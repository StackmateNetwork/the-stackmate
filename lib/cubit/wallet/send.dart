import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/validation.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

part 'send.freezed.dart';

enum SendSteps {
  address,
  amount,
  fees,
  confirm,
  sent,
}

@freezed
class SendState with _$SendState {
  const factory SendState({
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
    // this._file,
  ) : super(const SendState()) {
    _init(withQR);
  }

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
  // final FileManager _file;

  static const emailShareTxidSubject = 'Transaction ID';
  static const emailSharePSBTSubject = 'PSBT Requires Signature';
  static const belowDustError = 'Amount is below dust (546).';
  static const invalidAddressError = 'Invalid Address';
  static const invalidAmountError = 'Invalid Amount';
  static const invalidFeeError = 'Invalid Fee';
  static const psbtNotFinalizedError = 'Transaction signatures not satisfied.';
  static const dummyFeeValue = '500';
  static const minerOutput = 'miner';
  static const emptyString = '';

  void _init(bool withQR) async {
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
  void getBalance() async {
    try {
      final wallet = _walletsCubit.state.selectedWallet!;
      final dbName = wallet.label + wallet.uid + '.db';
      final db = await openDatabase(dbName);
      final databasesPath = await getDatabasesPath();
      final dbPath = join(databasesPath, dbName);

      emit(
        state.copyWith(
          balance: _walletsCubit.state.selectedWallet!.balance,
          loadingStart: false,
          errLoading: emptyString,
          errAddress: emptyString,
          errSending: emptyString,
          errAmount: emptyString,
          errFees: emptyString,
        ),
      );

      // final nodeAddress = _nodeAddressCubit.state.getAddress();
      // final socks5 = _torCubit.state.getSocks5();
      // final bal = await compute(computeBalance, {
      //   'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
      //   'nodeAddress': nodeAddress,
      //   'socks5': socks5,
      // });
      final balance = await compute(sqliteBalance, {
        'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
        'dbPath': dbPath,
      });

      emit(
        state.copyWith(
          balance: balance,
          loadingStart: false,
        ),
      );
      db.close();
    } catch (e, s) {
      emit(
        state.copyWith(
          loadingStart: false,
          errLoading: e.toString(),
        ),
      );
      _logger.logException(e, 'SendCubit.getBalance', s);
    }
  }

  void adddressChanged(String text) {
    if (text.startsWith('BC1') || text.startsWith('TB1'))
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
    else
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

  void pasteAddress() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) return;
    adddressChanged(text.result!);
  }

  void scanAddress(bool onStart) async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.QR,
      );
      if (barcodeScanRes == '-1') barcodeScanRes = emptyString;
      if (barcodeScanRes.contains('bitcoin:')) {
        final address = barcodeScanRes.split(':')[1].split('?')[0];
        adddressChanged(address);
        var amount =
            barcodeScanRes.split(':')[1].split('?amount=')[1].split('?')[0];
        if (amount.contains('.')) {
          amount = (double.parse(amount) * 100000000).toStringAsFixed(0);
        }
        amountChanged(amount);
      } else
        adddressChanged(barcodeScanRes);
      await Future.delayed(const Duration(milliseconds: 1000));

      if (onStart) getBalance();
    } catch (e, s) {
      if (onStart) getBalance();
      emit(
        state.copyWith(
          // loadingStart: false,
          errLoading: e.toString(),
        ),
      );
      _logger.logException(e, 'SendCubit.scanqr', s);
    }
  }

  void addressConfirmedClicked() async {
    emit(
      state.copyWith(
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
      ),
    );

    if (!Validation.isBtcAddress(state.address)) {
      emit(
        state.copyWith(
          errAddress: invalidAddressError,
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
      ),
    );
  }

  void toggleSweep() {
    emit(
      state.copyWith(
        sweepWallet: !state.sweepWallet,
        amount: 'WALLET WILL BE EMPTIED.',
        errLoading: emptyString,
        errAddress: emptyString,
        errSending: emptyString,
        errAmount: emptyString,
      ),
    );
  }

  Future<void> _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      // ignore: unused_local_variable
      const permissionGranted = true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      // ignore: unused_local_variable
      const permissionGranted = false;
    }
  }

  Future<void> savePSBTToFile() async {
    try {
      await _getStoragePermission();
      final path = await FilePicker.platform.getDirectoryPath();
      if (path == null) {
        emit(
          state.copyWith(
            sendingTx: false,
            errLoading: 'Folder not selected',
            currentStep: SendSteps.confirm,
          ),
        );
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
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          sendingTx: false,
          errLoading: emptyString,
          currentStep: SendSteps.confirm,
        ),
      );

      _logger.logException(e.toString(), 'SendCubit.confirmclicked', s);
    }
  }

  bool _parseAmount() {
    final parsed = state.amount.replaceAll(',', emptyString);
    final intParsed = int.parse(parsed);

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

  void amountConfirmedClicked() async {
    try {
      final wallet = _walletsCubit.state.selectedWallet!;
      final dbName = wallet.label + wallet.uid + '.db';
      final db = await openDatabase(dbName);
      final databasesPath = await getDatabasesPath();
      final dbPath = join(databasesPath, dbName);

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

      emit(
        state.copyWith(
          calculatingFees: true,
          currentStep: SendSteps.fees,
          txOutputs: txOutputs,
        ),
      );

      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      final syncRes = await compute(sqliteSync, {
        'dbPath': dbPath,
        'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
        'nodeAddress': nodeAddress,
        'socks5': socks5,
      });
      if (syncRes.hasError) {
        throw SMError.fromJson(syncRes.error!).message;
      }

      final psbt = await compute(sqliteBuildTx, {
        'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
        'dbPath': dbPath,
        'txOutputs': txOutputs,
        'feeAbsolute': dummyFeeValue,
        'policyPath': state.policyPath,
        'sweep': state.sweepWallet.toString(),
      });
      if (psbt.hasError) {
        throw SMError.fromJson(psbt.error!).message;
      }

      final weight = await compute(getWeight, {
        'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
        'psbt': psbt.result!.psbt,
      });

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
      db.close();
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
        break;
      case 1:
        finalFee = state.feeMedium!;
        break;
      case 2:
        finalFee = state.feeFast!;
        break;
    }
    emit(
      state.copyWith(
        finalFee: finalFee,
        fees: emptyString,
      ),
    );
  }

  void feeChanged(String fee) {
    final checked = fee.replaceAll('.', emptyString);
    emit(
      state.copyWith(
        fees: checked,
        feesOption: 4,
      ),
    );

    emit(
      state.copyWith(
        finalFee: int.parse(checked),
      ),
    );
  }

  bool _checkFee() {
    return true;
  }

  void feeConfirmedClicked() async {
    try {
      final wallet = _walletsCubit.state.selectedWallet!;
      final dbName = wallet.label + wallet.uid + '.db';
      final db = await openDatabase(dbName);
      final databasesPath = await getDatabasesPath();
      final dbPath = join(databasesPath, dbName);

      emit(
        state.copyWith(
          errFees: emptyString,
        ),
      );

      if (!_checkFee()) {
        emit(
          state.copyWith(
            errFees: invalidFeeError,
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

      // final nodeAddress = _nodeAddressCubit.state.getAddress();
      // final socks5 = _torCubit.state.getSocks5();

      // final psbt = await compute(buildTx, {
      //   'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
      //   'nodeAddress': nodeAddress,
      //   'socks5': socks5,
      //   'txOutputs': state.txOutputs,
      //   'feeAbsolute': state.finalFee.toString(),
      //   'policyPath': state.policyPath,
      //   'sweep': state.sweepWallet.toString(),
      // });

      final psbt = await compute(sqliteBuildTx, {
        'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
        'dbPath': dbPath,
        'txOutputs': state.txOutputs,
        'feeAbsolute': state.finalFee.toString(),
        'policyPath': state.policyPath,
        'sweep': state.sweepWallet.toString(),
      });

      if (psbt.hasError) {
        throw SMError.fromJson(psbt.error!).message;
      }

      final decode = await compute(decodePSBT, {
        'network': _blockchain.state.blockchain.name,
        'psbt': psbt.result!.psbt,
      });

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
        ),
      );
      db.close();
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
    emit(state.copyWith(psbt: emptyString, finalAmount: null, finalFee: null));
  }

  void backClicked() {
    switch (state.currentStep) {
      case SendSteps.address:
        break;
      case SendSteps.amount:
        emit(state.copyWith(currentStep: SendSteps.address));
        break;
      case SendSteps.fees:
        emit(state.copyWith(currentStep: SendSteps.amount));
        break;
      case SendSteps.confirm:
        emit(state.copyWith(currentStep: SendSteps.fees));
        break;
      case SendSteps.sent:
        break;
    }
  }

  void sendClicked() async {
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
        ),
      );

      final descriptor = _walletsCubit.state.selectedWallet!.descriptor;
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      final signed = await compute(signTx, {
        'descriptor': descriptor,
        'unsignedPSBT': state.psbt,
      });

      if (signed.hasError) {
        throw SMError.fromJson(signed.error!).message;
      }
      if (!signed.result!.isFinalized) {
        emit(
          state.copyWith(
            sendingTx: false,
            errSending: 'All signatures not present.',
          ),
        );
        return;
      }

      final txid = await compute(broadcastTx, {
        'descriptor': descriptor,
        'nodeAddress': nodeAddress,
        'socks5': socks5,
        'signedPSBT': signed.result!.psbt,
      });

      if (txid.hasError)
        throw SMError.fromJson(txid.error!).message;
      else
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
      ),
    );
  }
}

R<double> estimateFeees(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibBitcoin().estimateNetworkFee(
    network: obj['network']!,
    nodeAddress: obj['nodeAddress']!,
    socks5: obj['socks5']!,
    targetSize: obj['targetSize']!,
  );
  return resp;
}

int getWeight(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibBitcoin().getWeight(
    descriptor: obj['descriptor']!,
    psbt: obj['psbt']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!).message;
  }
  return resp.result!;
}

NetworkFees getAbsoluteFees(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibBitcoin().feeAbsoluteToRate(
    feeAbsolute: obj['feeRate']!,
    weight: obj['weight']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

String buildTx(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibBitcoin().buildTransaction(
    descriptor: obj['descriptor']!,
    nodeAddress: obj['nodeAddress']!,
    socks5: obj['socks5']!,
    txOutputs: obj['txOutputs']!,
    feeAbsolute: obj['feeAbsolute']!,
    policyPath: obj['policyPath']!,
    sweep: obj['sweep']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!.psbt;
}

R<PSBT> sqliteBuildTx(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibBitcoin().sqliteBuildTransaction(
    descriptor: obj['descriptor']!,
    dbPath: obj['dbPath']!,
    txOutputs: obj['txOutputs']!,
    feeAbsolute: obj['feeAbsolute']!,
    policyPath: obj['policyPath']!,
    sweep: obj['sweep']!,
  );

  return resp;
}

List<DecodedTxOutput> decodePSBT(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibBitcoin().decodePsbt(
    network: obj['network']!,
    psbt: obj['psbt']!,
  );

  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }

  return resp.result!;
}

R<PSBT> signTx(dynamic data) {
  final obj = data as Map<String, String?>;

  final resp = LibBitcoin().signTransaction(
    descriptor: obj['descriptor']!,
    unsignedPSBT: obj['unsignedPSBT']!,
  );

  return resp;
}

Future<R<String>> broadcastTx(dynamic data) async {
  final obj = data as Map<String, String?>;

  final resp = await LibBitcoin().broadcastTransaction(
    descriptor: obj['descriptor']!,
    nodeAddress: obj['nodeAddress']!,
    socks5: obj['socks5']!,
    signedPSBT: obj['signedPSBT']!,
  );

  return resp;
}

// tb1qcd0dej2spq73nlkr4d5w3scksqagz0nzmdnzgg
int sqliteBalance(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().sqliteBalance(
    descriptor: data['descriptor']!,
    dbPath: data['dbPath']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

R<String> sqliteSync(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().sqliteSync(
    dbPath: obj['dbPath']!,
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
    socks5: obj['socks5']!,
  );

  return resp;
}
