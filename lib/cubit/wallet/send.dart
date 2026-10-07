import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/signer.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/qr_scanner.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/validation.dart';
import 'package:sats/pkg/wallet_db.dart';

part 'send.freezed.dart';

enum SendSteps {
  address,
  amount,
  fees,
  confirm,
  sent,
}

@freezed
abstract class SendState with _$SendState {
  const factory SendState({
    required Wallet wallet,
    @Default(SendSteps.address) SendSteps currentStep,
    @Default(true) bool loadingStart,
    @Default(false) bool calculatingFees,
    @Default(false) bool buildingTx,
    @Default(false) bool sendingTx,
    bool? permissionGranted,
    @Default('') String errLoading,
    @Default('') String errAddress,
    @Default('') String errSending,
    @Default('') String errAmount,
    @Default('') String errFees,
    @Default('') String policyPath,
    @Default('') String txOutputs,
    @Default('') String address,
    @Default('') String amount,
    @Default(0) int weight,
    @Default('') String fees,
    int? feeSlow,
    int? feeMedium,
    int? feeFast,
    int? balance,
    @Default(1) int feesOption,
    @Default('') String psbt,
    @Default('') String txId,
    int? finalFee,
    int? finalAmount,
    @Default(false) bool sweepWallet,
  }) = _SendState;

  const SendState._();

  // bool confirmStep() => psbt != '' && txId == '';
  // bool confirmedStep() => txId != '';

  int total() => finalFee! + finalAmount!;

  bool zeroBalanceAmt() => balance != null && balance == 0;
}

class SendCubit extends Cubit<SendState> {
  SendCubit(
    bool withQR,
    this._walletsCubit,
    // this._bitcoin,
    this._blockchain,
    this._logger,
    this._clipBoard,
    this._share,
    this._nodeAddressCubit,
    this._torCubit,
    this._core,
    this._fees,
    this._storage,
    this._masterKeyCubit,
    Wallet wallet,

    // this._file,
  ) : super(SendState(wallet: wallet)) {
    _init(withQR);
  }

  final IStorage _storage;
  final WalletsCubit _walletsCubit;
  // final IBitcoin _bitcoin;
  final Logger _logger;
  final ChainSelectCubit _blockchain;
  final IShare _share;
  final IClipBoard _clipBoard;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;
  final IStackMateBitcoin _core;
  final FeesCubit _fees;
  final MasterKeyCubit _masterKeyCubit;

  // final FileManager _file;

  static const emailShareTxidSubject = 'Transaction ID';
  static const emailSharePSBTSubject = 'PSBT Requires Signature';
  static const belowDustError = 'Amount is below dust (546).';
  static const insufficientBalanceError = 'Insufficient balance.';
  static const invalidAddressError = 'Invalid Address';
  static const invalidAmountError = 'Invalid Amount';
  static const invalidFeeError = 'Invalid Fee';
  static const psbtNotFinalizedError = 'Transaction signatures not satisfied.';
  static const dummyFeeValue = '500';
  static const minerOutput = 'miner';
  static const emptyString = '';
  static const sweepMessage = 'WALLET WILL BE EMPTIED.';
  Future<void> _init(bool withQR) async {
    if (withQR) {
      await Future.delayed(const Duration(milliseconds: 500));
      scanAddress(true);
    } else {
      await Future.delayed(const Duration(milliseconds: 1000));
      getBalance();
    }
  }

  // void completed() {
  //   _walletsCubit.walletSelected(wallet)
  // }

  Future<void> updateWalletStorage(Wallet wallet) async {
    await _storage.saveItemAt<Wallet>(
      StoreKeys.Wallet.name,
      wallet.id!,
      wallet,
    );
    emit(
      state.copyWith(
        wallet: wallet,
      ),
    );
    // _walletsCubit.update(wallet);
    _walletsCubit.refresh();
  }

  Future<void> getBalance() async {
    try {
      final wallet = state.wallet;
      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      emit(
        state.copyWith(
          balance: state.wallet.balance,
          loadingStart: false,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );

      final balance = (await BitcoinWorker.balance(
        descriptor: state.wallet.descriptor,
        dbPath: dbPath,
      )).orThrow();

      emit(
        state.copyWith(
          balance: balance,
          loadingStart: false,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          loadingStart: false,
          errLoading: e.toString(),
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
      _logger.logException(e, 'SendCubit.getBalance', s);
    }
  }

  Future<void> syncWallet() async {
    final wallet = state.wallet;

    final node = _nodeAddressCubit.state.getAddress();
    final socks5 = _torCubit.state.getSocks5();

    final dbPath = await walletDbPath(wallet.label, wallet.uid);

    final syncStat = await BitcoinWorker.sync(
      dbPath: dbPath,
      descriptor: state.wallet.descriptor,
      nodeAddress: node,
      socks5: socks5,
    );
    syncStat.orThrow();

    final balance = (await BitcoinWorker.balance(
      descriptor: state.wallet.descriptor,
      dbPath: dbPath,
    )).orThrow();

    final transactions = (await BitcoinWorker.history(
      descriptor: state.wallet.descriptor,
      dbPath: dbPath,
    )).orThrow();

    final updated = state.wallet.copyWith(
      balance: balance,
      transactions: transactions,
    );
    await updateWalletStorage(updated);
  }

  void adddressChanged(String text) {
    if (text.startsWith('BC1') || text.startsWith('TB1')) {
      emit(
        state.copyWith(
          address: text.toLowerCase(),
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
    } else {
      emit(
        state.copyWith(
          address: text,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
    }
  }

  Future<void> pasteAddress() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) return;
    adddressChanged(text.result!);
  }

  Future<void> scanAddress(bool onStart) async {
    try {
      final barcodeScanRes = await locator<IQrScanner>().scan();
      if (barcodeScanRes.contains('bitcoin:')) {
        final address = barcodeScanRes.split(':')[1].split('?')[0];
        adddressChanged(address);
        var amount =
            barcodeScanRes.split(':')[1].split('?amount=')[1].split('?')[0];
        if (amount.contains('.')) {
          amount = (double.parse(amount) * 100000000).toStringAsFixed(0);
        }
        amountChanged(amount);
      } else {
        adddressChanged(barcodeScanRes);
      }
      await Future.delayed(const Duration(milliseconds: 1000));

      if (onStart) getBalance();
    } catch (e, s) {
      if (onStart) getBalance();
      emit(
        state.copyWith(
          errLoading: e.toString(),
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
      _logger.logException(e, 'SendCubit.scanqr', s);
    }
  }

  Future<void> addressConfirmedClicked() async {
    emit(
      state.copyWith(
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );

    if (!Validation.isBtcAddress(state.address)) {
      emit(
        state.copyWith(
          errAddress: invalidAddressError,
          errLoading: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        currentStep: SendSteps.amount,
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );
  }

  void amountChanged(String amount) {
    final checked = amount.replaceAll(' ', emptyString);
    emit(
      state.copyWith(
        amount: checked,
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );
  }

  void toggleSweep() {
    if (state.sweepWallet) {
      emit(
        state.copyWith(
          sweepWallet: !state.sweepWallet,
          amount: emptyString,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
    } else {
      emit(
        state.copyWith(
          sweepWallet: !state.sweepWallet,
          amount: sweepMessage,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
    }
  }

  // Future<void> _getStoragePermission() async {
  //   if (await Permission.storage.request().isGranted) {
  //     // ignore: unused_local_variable
  //     const permissionGranted = true;
  //   } else if (await Permission.storage.request().isPermanentlyDenied) {
  //     await openAppSettings();
  //   } else if (await Permission.storage.request().isDenied) {
  //     // ignore: unused_local_variable
  //     const permissionGranted = false;
  //   }
  // }

  Future<void> savePSBTToFile() async {
    try {
      // await _getStoragePermission();
      final path = await FilePicker.getDirectoryPath();
      if (path == null) {
        emit(
          state.copyWith(
            sendingTx: false,
            errLoading: 'Folder not selected',
            currentStep: SendSteps.confirm,
            errAddress: emptyString,
            errSending: emptyString,
            errAmount: emptyString,
            errFees: emptyString,
          ),
        );
        return;
      }
      //final File file = File('$path/build.psbt');
      // String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

      final psbtFile = File('$path/build.psbt');

      await psbtFile.writeAsString(state.psbt, flush: true);

      emit(
        state.copyWith(
          sendingTx: false,
          errLoading: emptyString,
          currentStep: SendSteps.sent,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          sendingTx: false,
          errLoading: emptyString,
          currentStep: SendSteps.confirm,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );

      _logger.logException(e.toString(), 'SendCubit.confirmclicked', s);
    }
  }

  bool _parseAmount() {
    final parsed = (state.amount == sweepMessage)
        ? '0'
        : state.amount.replaceAll(',', emptyString);
    final intParsed = int.parse(parsed);
    if (intParsed > state.balance!) {
      emit(
        state.copyWith(
          amount: emptyString,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: insufficientBalanceError,
          errFees: emptyString,
        ),
      );
      return false;
    }
    if (intParsed > 546 || (intParsed == 0 && state.sweepWallet)) {
      emit(
        state.copyWith(
          amount: parsed,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
      return true;
    } else {
      emit(
        state.copyWith(
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: belowDustError,
          errFees: emptyString,
        ),
      );
      return false;
    }
  }

  Future<void> amountConfirmedClicked() async {
    try {
      final wallet = state.wallet;
      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      emit(
        state.copyWith(
          errAmount: emptyString,
          errFees: emptyString,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
        ),
      );

      if (!_parseAmount()) {
        return;
      }
      final txOutputs =
          '${state.address}:${state.sweepWallet ? 0 : state.amount}';

      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      emit(
        state.copyWith(
          calculatingFees: true,
          currentStep: SendSteps.fees,
          txOutputs: txOutputs,
        ),
      );

      final syncRes = await BitcoinWorker.sync(
        dbPath: dbPath,
        descriptor: state.wallet.descriptor,
        nodeAddress: nodeAddress,
        socks5: socks5,
      );
      syncRes.orThrow();

      final psbt = await BitcoinWorker.buildTx(
        descriptor: state.wallet.descriptor,
        dbPath: dbPath,
        txOutputs: txOutputs,
        feeAbsolute: dummyFeeValue,
        policyPath: state.policyPath,
        sweep: state.sweepWallet.toString(),
      );
      psbt.orThrow();

      final weight = (await BitcoinWorker.weight(
        descriptor: state.wallet.descriptor,
        psbt: psbt.result!.psbt,
      )).orThrow();

      final now = DateTime.now().millisecondsSinceEpoch;
      const tenMinutes = 600000;
      var feesComplete = _fees.getFees();
      if (feesComplete.fast == 0.0 ||
          feesComplete.timestamp < now - tenMinutes) {
        await _fees.update();
      }
      feesComplete = _fees.getFees();

      final fast = _core.feeRateToAbsolute(
        feeRate: feesComplete.fast.toString(),
        weight: weight.toString(),
      );

      final medium = _core.feeRateToAbsolute(
        feeRate: feesComplete.medium.toString(),
        weight: weight.toString(),
      );

      final slow = _core.feeRateToAbsolute(
        feeRate: feesComplete.slow.toString(),
        weight: weight.toString(),
      );

      emit(
        state.copyWith(
          feeFast: fast.result!.absolute,
          feeMedium: medium.result!.absolute,
          feeSlow: slow.result!.absolute,
          finalFee: fast.result!.absolute,
          weight: weight,
          calculatingFees: false,
          currentStep: SendSteps.fees,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          calculatingFees: false,
          errFees: e.toString(),
        ),
      );

      _logger.logException(e.toString(), 'SendCubit.confirmclicked', s);
    }
  }

  void feeSelected(int idx) {
    emit(state.copyWith(feesOption: idx));

    int finalFee = 0;
    switch (idx) {
      case 0:
        finalFee = state.feeSlow!;
      case 1:
        finalFee = state.feeMedium!;
      case 2:
        finalFee = state.feeFast!;
    }
    emit(
      state.copyWith(
        finalFee: finalFee,
        fees: emptyString,
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );
  }

  void feeChanged(String fee) {
    final checked = fee.replaceAll('.', emptyString);
    emit(
      state.copyWith(
        fees: checked,
        feesOption: 4,
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );

    emit(
      state.copyWith(
        finalFee: int.parse(checked),
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );
  }

  bool _checkFee() {
    return true;
  }

  Future<void> feeConfirmedClicked() async {
    try {
      final wallet = state.wallet;
      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      emit(
        state.copyWith(
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );

      if (!_checkFee()) {
        emit(
          state.copyWith(
            errFees: invalidFeeError,
            errLoading: emptyString,
            errAddress: emptyString,
            errSending: emptyString,
            errAmount: emptyString,
          ),
        );
        return;
      }
      await Future.delayed(const Duration(milliseconds: 100));

      emit(
        state.copyWith(
          buildingTx: true,
          errLoading: emptyString,
        ),
      );

      final psbt = await BitcoinWorker.buildTx(
        descriptor: state.wallet.descriptor,
        dbPath: dbPath,
        txOutputs: state.txOutputs,
        feeAbsolute: state.finalFee.toString(),
        policyPath: state.policyPath,
        sweep: state.sweepWallet.toString(),
      );

      psbt.orThrow();

      final decode = (await BitcoinWorker.decodePsbt(
        network: _blockchain.state.blockchain.name,
        psbt: psbt.result!.psbt,
      )).orThrow();

      final amtoutput = decode.firstWhere((o) => o.to == state.address);
      final feeoutput = decode.firstWhere((o) => o.to == minerOutput);

      emit(
        state.copyWith(
          buildingTx: false,
          psbt: psbt.result!.psbt,
          finalFee: feeoutput.value,
          finalAmount: amtoutput.value,
          currentStep: SendSteps.confirm,
          errSending: emptyString,
          errLoading: emptyString,
          errAddress: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          buildingTx: false,
          errLoading: e.toString(),
        ),
      );

      _logger.logException(e.toString(), 'SendCubit.confirmclicked', s);
    }
  }

  void clearPsbt() {
    emit(
      state.copyWith(
        psbt: emptyString,
        finalAmount: null,
        finalFee: null,
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );
  }

  void backClicked() {
    switch (state.currentStep) {
      case SendSteps.address:
        break;
      case SendSteps.amount:
        emit(
          state.copyWith(
            currentStep: SendSteps.address,
            errLoading: emptyString,
            errAddress: emptyString,
            errSending: emptyString,
            errAmount: emptyString,
            errFees: emptyString,
          ),
        );
      case SendSteps.fees:
        emit(
          state.copyWith(
            currentStep: SendSteps.amount,
            errLoading: emptyString,
            errAddress: emptyString,
            errSending: emptyString,
            errAmount: emptyString,
            errFees: emptyString,
          ),
        );
      case SendSteps.confirm:
        emit(
          state.copyWith(
            currentStep: SendSteps.fees,
            errLoading: emptyString,
            errAddress: emptyString,
            errSending: emptyString,
            errAmount: emptyString,
            errFees: emptyString,
          ),
        );
      case SendSteps.sent:
        break;
    }
  }

  Future<void> sendClicked() async {
    try {
      if (state.sendingTx) return;
      emit(
        state.copyWith(
          sendingTx: true,
          errLoading: emptyString,
          currentStep: SendSteps.confirm,
          errAmount: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errFees: emptyString,
        ),
      );

      final descriptor = await WalletSigner(
        _core,
        _masterKeyCubit,
        _blockchain,
      ).signingDescriptor(state.wallet);
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      final signed = await BitcoinWorker.sign(
        descriptor: descriptor,
        unsignedPSBT: state.psbt,
      );

      signed.orThrow();
      if (!signed.result!.isFinalized) {
        emit(
          state.copyWith(
            sendingTx: false,
            errSending: 'All signatures not present.',
          ),
        );
        return;
      }

      final txid = await BitcoinWorker.broadcast(
        descriptor: descriptor,
        nodeAddress: nodeAddress,
        socks5: socks5,
        signedPSBT: signed.result!.psbt,
      );

      txid.orThrow();
      await syncWallet();

      updateWalletStorage(state.wallet);

      emit(
        state.copyWith(
          sendingTx: false,
          errLoading: emptyString,
          errSending: emptyString,
          txId: txid.result!,
          currentStep: SendSteps.sent,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          sendingTx: false,
          currentStep: SendSteps.confirm,
          errLoading: e.toString(),
        ),
      );
      _logger.logException(e.toString(), 'SendCubit.sendclicked', s);
    }
  }

  void shareTxId() {
    _share.share(
      text: state.txId,
      subjectForEmail: emailShareTxidSubject,
    );
  }

  void copyPSBT() {
    _clipBoard.copyToClipBoard(state.psbt);
    emit(
      state.copyWith(
        sendingTx: false,
        errLoading: emptyString,
        currentStep: SendSteps.sent,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );
  }

  void sharePSBT() {
    _share.share(
      text: state.psbt,
      subjectForEmail: emailSharePSBTSubject,
    );
    emit(
      state.copyWith(
        sendingTx: false,
        errLoading: emptyString,
        currentStep: SendSteps.sent,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
        errFees: emptyString,
      ),
    );
  }
}
