import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/bip21.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/qr_scanner.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
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
    @Default('') String errLoading,
    @Default('') String errAddress,
    @Default('') String errSending,
    @Default('') String errAmount,
    @Default('') String errFees,
    @Default('') String txOutputs,
    @Default('') String address,
    @Default('') String amount,
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

  int total() => finalFee! + finalAmount!;

  bool zeroBalanceAmt() => balance != null && balance == 0;

  bool get isBusy => calculatingFees || buildingTx || sendingTx;

  SendState clearErrors() => copyWith(
        errLoading: '',
        errAddress: '',
        errSending: '',
        errAmount: '',
        errFees: '',
      );
}

class SendCubit extends Cubit<SendState> {
  SendCubit(
    bool withQR,
    this._walletsCubit,
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
  ) : super(SendState(wallet: wallet)) {
    _init(withQR);
  }

  final IStorage _storage;
  final WalletsCubit _walletsCubit;
  final Logger _logger;
  final ChainSelectCubit _blockchain;
  final IShare _share;
  final IClipBoard _clipBoard;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;
  final IStackMateBitcoin _core;
  final FeesCubit _fees;
  final MasterKeyCubit _masterKeyCubit;

  static const emailShareTxidSubject = 'Transaction ID';
  static const emailSharePSBTSubject = 'PSBT Requires Signature';
  static const dustLimit = 546;
  static const belowDustError = 'Amount is below dust ($dustLimit sats).';
  static const insufficientBalanceError = 'Insufficient balance.';
  static const invalidAddressError = 'Invalid address for this network.';
  static const invalidAmountError = 'Invalid amount.';
  static const invalidFeeError = 'Invalid fee.';
  static const noFeeEstimateError =
      'Could not fetch network fees. Check your node and Tor connection.';
  static const notFullySignedError = 'All signatures not present.';

  /// Placeholder fee for the draft transaction used to measure its weight.
  static const _draftFee = '500';
  static const _minerOutput = 'miner';
  static const _feeMaxAge = Duration(minutes: 10);

  Future<void> _init(bool withQR) async {
    await getBalance();
    if (withQR) await scanAddress();
  }

  Future<void> getBalance() async {
    emit(state.copyWith(balance: state.wallet.balance));
    try {
      final wallet = state.wallet;
      final dbPath = await walletDbPath(wallet.label, wallet.uid);
      final balance = (await BitcoinWorker.balance(
        descriptor: wallet.descriptor,
        dbPath: dbPath,
      )).orThrow();
      emit(state.copyWith(balance: balance, loadingStart: false));
    } catch (e, s) {
      // The stored balance is still shown; the send flow re-syncs anyway.
      emit(state.copyWith(loadingStart: false));
      _logger.logException(e, 'SendCubit.getBalance', s);
    }
  }

  Future<void> _syncWallet() async {
    final wallet = state.wallet;
    final dbPath = await walletDbPath(wallet.label, wallet.uid);

    (await BitcoinWorker.sync(
      dbPath: dbPath,
      descriptor: wallet.descriptor,
      nodeAddress: _nodeAddressCubit.state.getAddress(),
      socks5: _torCubit.state.getSocks5(),
    )).orThrow();

    final balance = (await BitcoinWorker.balance(
      descriptor: wallet.descriptor,
      dbPath: dbPath,
    )).orThrow();

    final transactions = (await BitcoinWorker.history(
      descriptor: wallet.descriptor,
      dbPath: dbPath,
    )).orThrow();

    final updated = state.wallet.copyWith(
      balance: balance,
      transactions: transactions,
    );
    await _storage.saveItemAt<Wallet>(
      StoreKeys.Wallet.name,
      updated.id!,
      updated,
    );
    emit(state.copyWith(wallet: updated, balance: balance));
    _walletsCubit.refresh();
  }

  void adddressChanged(String text) {
    emit(state.clearErrors().copyWith(address: text.trim()));
  }

  /// Fills in the address, and the amount when [text] is a BIP21 URI
  /// carrying one.
  void _paymentRequestReceived(String text) {
    if (text.trim().isEmpty) return;
    final request = PaymentRequest.parse(text);
    adddressChanged(request.address);
    if (request.amountSats != null) {
      emit(
        state.copyWith(
          amount: request.amountSats.toString(),
          sweepWallet: false,
        ),
      );
    }
  }

  Future<void> pasteAddress() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) return;
    _paymentRequestReceived(text.result!);
  }

  Future<void> scanAddress() async {
    try {
      final scanned = await locator<IQrScanner>().scan();
      _paymentRequestReceived(scanned);
    } catch (e, s) {
      emit(state.clearErrors().copyWith(errAddress: e.toString()));
      _logger.logException(e, 'SendCubit.scanAddress', s);
    }
  }

  void addressConfirmedClicked() {
    emit(state.clearErrors());
    final valid = _core.isValidAddress(
      address: state.address,
      network: _blockchain.state.blockchain.name,
    );
    if (!valid) {
      emit(state.clearErrors().copyWith(errAddress: invalidAddressError));
      return;
    }
    emit(state.clearErrors().copyWith(currentStep: SendSteps.amount));
  }

  void amountChanged(String amount) {
    emit(state.clearErrors().copyWith(amount: amount));
  }

  void toggleSweep() {
    emit(
      state.clearErrors().copyWith(
        sweepWallet: !state.sweepWallet,
        amount: '',
      ),
    );
  }

  /// Validates the entered amount, returning it in sats (0 for a sweep), or
  /// null after emitting an error.
  int? _parseAmount() {
    if (state.sweepWallet) return 0;
    emit(state.clearErrors());

    final amount = int.tryParse(state.amount.replaceAll(RegExp('[^0-9]'), ''));
    final String? error;
    if (amount == null || amount <= 0) {
      error = invalidAmountError;
    } else if (amount > (state.balance ?? state.wallet.balance)) {
      error = insufficientBalanceError;
    } else if (amount < dustLimit) {
      error = belowDustError;
    } else {
      error = null;
    }
    if (error != null) {
      emit(state.clearErrors().copyWith(errAmount: error));
      return null;
    }
    return amount;
  }

  Future<void> amountConfirmedClicked() async {
    if (state.isBusy) return;
    final amount = _parseAmount();
    if (amount == null) return;

    final txOutputs = '${state.address}:$amount';
    emit(
      state.clearErrors().copyWith(
        amount: state.sweepWallet ? '' : amount.toString(),
        calculatingFees: true,
        currentStep: SendSteps.fees,
        txOutputs: txOutputs,
        feeSlow: null,
        feeMedium: null,
        feeFast: null,
        finalFee: null,
      ),
    );

    try {
      final wallet = state.wallet;
      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      (await BitcoinWorker.sync(
        dbPath: dbPath,
        descriptor: wallet.descriptor,
        nodeAddress: _nodeAddressCubit.state.getAddress(),
        socks5: _torCubit.state.getSocks5(),
      )).orThrow();

      final draft = (await BitcoinWorker.buildTx(
        descriptor: wallet.descriptor,
        dbPath: dbPath,
        txOutputs: txOutputs,
        feeAbsolute: _draftFee,
        policyPath: '',
        sweep: state.sweepWallet.toString(),
      )).orThrow();

      final weight = (await BitcoinWorker.weight(
        descriptor: wallet.descriptor,
        psbt: draft.psbt,
      )).orThrow();

      final cutoff = DateTime.now().subtract(_feeMaxAge).millisecondsSinceEpoch;
      final cached = _fees.getFees();
      if (cached.fast <= 0 || cached.timestamp < cutoff) await _fees.update();
      final rates = _fees.getFees();
      if (rates.fast <= 0) throw noFeeEstimateError;

      int absolute(double rate) => _core
          .feeRateToAbsolute(
            feeRate: rate.toString(),
            weight: weight.toString(),
          )
          .orThrow()
          .absolute;

      final medium = absolute(rates.medium);
      emit(
        state.copyWith(
          feeFast: absolute(rates.fast),
          feeMedium: medium,
          feeSlow: absolute(rates.slow),
          feesOption: 1,
          finalFee: medium,
          calculatingFees: false,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          calculatingFees: false,
          currentStep: SendSteps.amount,
          errFees: e.toString(),
        ),
      );
      _logger.logException(e, 'SendCubit.amountConfirmedClicked', s);
    }
  }

  void feeSelected(int idx) {
    final fee = switch (idx) {
      0 => state.feeSlow,
      1 => state.feeMedium,
      _ => state.feeFast,
    };
    emit(state.clearErrors().copyWith(feesOption: idx, finalFee: fee));
  }

  /// A custom absolute fee in sats, chosen with the slider.
  void feeChanged(int fee) {
    emit(state.clearErrors().copyWith(feesOption: -1, finalFee: fee));
  }

  Future<void> feeConfirmedClicked() async {
    if (state.isBusy) return;
    emit(state.clearErrors());
    final fee = state.finalFee;
    if (fee == null || fee <= 0) {
      emit(state.clearErrors().copyWith(errFees: invalidFeeError));
      return;
    }

    emit(state.clearErrors().copyWith(buildingTx: true));
    try {
      final wallet = state.wallet;
      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      final psbt = (await BitcoinWorker.buildTx(
        descriptor: wallet.descriptor,
        dbPath: dbPath,
        txOutputs: state.txOutputs,
        feeAbsolute: fee.toString(),
        policyPath: '',
        sweep: state.sweepWallet.toString(),
      )).orThrow();

      final outputs = (await BitcoinWorker.decodePsbt(
        network: _blockchain.state.blockchain.name,
        psbt: psbt.psbt,
      )).orThrow();

      // Cross-check what was built against what the user asked for before
      // showing it for confirmation.
      final payment = outputs.where((o) => o.to == state.address).firstOrNull;
      final minerFee = outputs.where((o) => o.to == _minerOutput).firstOrNull;
      if (payment == null || minerFee == null) {
        throw 'Built transaction does not pay ${state.address}.';
      }
      if (!state.sweepWallet && payment.value.toString() != state.amount) {
        throw 'Built transaction pays ${payment.value} sats, '
            'expected ${state.amount}.';
      }

      emit(
        state.copyWith(
          buildingTx: false,
          psbt: psbt.psbt,
          finalFee: minerFee.value,
          finalAmount: payment.value,
          currentStep: SendSteps.confirm,
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(buildingTx: false, errFees: e.toString()));
      _logger.logException(e, 'SendCubit.feeConfirmedClicked', s);
    }
  }

  void backClicked() {
    if (state.isBusy) return;
    final previous = switch (state.currentStep) {
      SendSteps.amount => SendSteps.address,
      SendSteps.fees => SendSteps.amount,
      SendSteps.confirm => SendSteps.fees,
      SendSteps.address || SendSteps.sent => null,
    };
    if (previous == null) return;
    emit(
      state.clearErrors().copyWith(
        currentStep: previous,
        psbt: '',
        finalAmount: null,
      ),
    );
  }

  Future<void> sendClicked() async {
    if (state.isBusy) return;
    emit(state.clearErrors().copyWith(sendingTx: true));

    final String txid;
    try {
      final descriptor = await WalletSigner(
        _core,
        _masterKeyCubit,
        _blockchain,
      ).signingDescriptor(state.wallet);

      final signed = (await BitcoinWorker.sign(
        descriptor: descriptor,
        unsignedPSBT: state.psbt,
      )).orThrow();
      if (!signed.isFinalized) throw notFullySignedError;

      txid = (await BitcoinWorker.broadcast(
        descriptor: descriptor,
        nodeAddress: _nodeAddressCubit.state.getAddress(),
        socks5: _torCubit.state.getSocks5(),
        signedPSBT: signed.psbt,
      )).orThrow();
    } catch (e, s) {
      emit(state.copyWith(sendingTx: false, errSending: e.toString()));
      _logger.logException(e, 'SendCubit.sendClicked', s);
      return;
    }

    // The transaction is out: report success even if the refresh fails, so
    // the user is never invited to send it again.
    emit(
      state.copyWith(
        sendingTx: false,
        txId: txid,
        currentStep: SendSteps.sent,
      ),
    );
    try {
      await _syncWallet();
    } catch (e, s) {
      _logger.logException(e, 'SendCubit.syncAfterSend', s);
    }
  }

  Future<void> savePSBTToFile() async {
    try {
      final path = await FilePicker.getDirectoryPath();
      if (path == null) return;
      final stamp = DateTime.now().millisecondsSinceEpoch;
      await File('$path/stackmate-$stamp.psbt')
          .writeAsString(state.psbt, flush: true);
      emit(state.clearErrors().copyWith(currentStep: SendSteps.sent));
    } catch (e, s) {
      emit(state.clearErrors().copyWith(errSending: e.toString()));
      _logger.logException(e, 'SendCubit.savePSBTToFile', s);
    }
  }

  void shareTxId() {
    _share.share(text: state.txId, subjectForEmail: emailShareTxidSubject);
  }

  void copyPSBT() {
    _clipBoard.copyToClipBoard(state.psbt);
    emit(state.clearErrors().copyWith(currentStep: SendSteps.sent));
  }

  void sharePSBT() {
    _share.share(text: state.psbt, subjectForEmail: emailSharePSBTSubject);
    emit(state.clearErrors().copyWith(currentStep: SendSteps.sent));
  }
}
