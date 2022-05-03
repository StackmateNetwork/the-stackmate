import 'dart:convert';

import 'package:bitcoin/types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/fees.dart';

import 'package:sats/cubit/wallet/wallet.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/validation.dart';

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
    @Default('') String errLoading,
    @Default('') String errAddress,
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
      this._walletCubit,
      // this._bitcoin,
      this._blockchain,
      this._logger,
      this._clipBoard,
      this._share,
      this._nodeAddressCubit,
      this._core,
      this._fees)
      : super(const SendState()) {
    _init(withQR);
  }

  final WalletsCubit _walletCubit;
  // final IBitcoin _bitcoin;
  final Logger _logger;
  final ChainSelectCubit _blockchain;
  final IShare _share;
  final IClipBoard _clipBoard;
  final NodeAddressCubit _nodeAddressCubit;
  final IStackMateCore _core;
  final FeesCubit _fees;
  void _init(bool withQR) async {
    if (withQR) {
      await Future.delayed(const Duration(milliseconds: 500));
      scanAddress(true);
    } else {
      await Future.delayed(const Duration(milliseconds: 1000));
      getBalance();
    }
  }

  void getBalance() async {
    // emit(
    //   state.copyWith(
    //     loadingStart: true,
    //   ),
    // );

    try {
      emit(
        state.copyWith(
          balance: _walletCubit.state.selectedWallet!.balance,
          loadingStart: false,
          errLoading: '',
        ),
      );

      final nodeAddress = _nodeAddressCubit.state.getAddress();

      final bal = await compute(computeBalance, {
        'descriptor': _walletCubit.state.selectedWallet!.descriptor,
        'nodeAddress': nodeAddress,
      });

      emit(
        state.copyWith(
          balance: bal,
          loadingStart: false,
        ),
      );
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
    emit(state.copyWith(address: text));
  }

  void pasteAddress() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) return;
    emit(state.copyWith(address: text.result!));
  }

  void scanAddress(bool onStart) async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.QR,
      );
      if (barcodeScanRes == '-1') barcodeScanRes = '';

      emit(state.copyWith(address: barcodeScanRes));

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
    emit(state.copyWith(errAddress: ''));

    if (!Validation.isBtcAddress(state.address)) {
      emit(state.copyWith(errAddress: 'Invalid Wallet Address'));
      return;
    }
    emit(state.copyWith(currentStep: SendSteps.amount));
  }

  void amountChanged(String amount) {
    final checked = amount.replaceAll('.', '');
    emit(state.copyWith(amount: checked));
  }

  void toggleSweep() {
    emit(state.copyWith(sweepWallet: !state.sweepWallet, amount: ''));
  }

  bool _checkAmount() {
    return true;
  }

  void amountConfirmedClicked() async {
    //buildtx
    //get fees

    try {
      emit(state.copyWith(errAmount: ''));

      if (!_checkAmount()) {
        emit(state.copyWith(errAmount: 'Please enter a valid amount'));
        return;
      }
      final txOutputs = '${state.address}:${state.amount}';

      emit(
        state.copyWith(
          calculatingFees: true,
          currentStep: SendSteps.fees,
          txOutputs: txOutputs,
        ),
      );

      // await Future.delayed(const Duration(milliseconds: 100));

      // emit(state.copyWith(buildingTx: true, errLoading: ''));

      final nodeAddress = _nodeAddressCubit.state.getAddress();

      final psbt = await compute(buildTx, {
        'descriptor': _walletCubit.state.selectedWallet!.descriptor,
        'nodeAddress': nodeAddress,
        'txOutputs': txOutputs,
        'feeAbsolute': '1000',
        'policyPath': state.policyPath,
        'sweep': state.sweepWallet.toString(),
      });

      final weight = await compute(getWeight, {
        'descriptor': _walletCubit.state.selectedWallet!.descriptor,
        'psbt': psbt,
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
          finalFee: medium.result!.absolute,
          weight: weight,
          calculatingFees: false,
          currentStep: SendSteps.fees,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          calculatingFees: false,
          errAmount: e.toString(),
        ),
      );

      _logger.logException(e, 'SendCubit.confirmclicked', s);
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
    emit(state.copyWith(finalFee: finalFee, fees: ''));
  }

  void feeChanged(String fee) {
    final checked = fee.replaceAll('.', '');
    emit(state.copyWith(fees: checked, feesOption: 4));
    final fees = _core.feeAbsoluteToRate(
      feeAbsolute: checked,
      weight: state.weight.toString(),
    );
    emit(state.copyWith(finalFee: fees.result!.absolute));
  }

  bool _checkFee() {
    return true;
  }

  void feeConfirmedClicked() async {
    try {
      emit(state.copyWith(errFees: ''));

      if (!_checkFee()) {
        emit(state.copyWith(errAmount: 'Please enter a valid fee amount'));
        return;
      }
      await Future.delayed(const Duration(milliseconds: 100));

      emit(state.copyWith(buildingTx: true, errLoading: ''));

      final nodeAddress = _nodeAddressCubit.state.getAddress();

      final psbt = await compute(buildTx, {
        'descriptor': _walletCubit.state.selectedWallet!.descriptor,
        'nodeAddress': nodeAddress,
        'txOutputs': state.txOutputs,
        'feeAbsolute': state.finalFee.toString(),
        'policyPath': state.policyPath,
        'sweep': state.sweepWallet.toString(),
      });

      final decode = await compute(decodePSBT, {
        'network': _blockchain.state.blockchain.name,
        'psbt': psbt,
      });

      final amtoutput = decode.firstWhere((o) => o.to == state.address);
      final feeoutput = decode.firstWhere((o) => o.to == 'miner');

      emit(
        state.copyWith(
          buildingTx: false,
          psbt: psbt,
          finalFee: feeoutput.value,
          finalAmount: amtoutput.value,
          currentStep: SendSteps.confirm,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          buildingTx: false,
          errLoading: e.toString(),
        ),
      );

      _logger.logException(e, 'SendCubit.confirmclicked', s);
    }
  }

  void clearPsbt() {
    emit(state.copyWith(psbt: '', finalAmount: null, finalFee: null));
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
      if (state.sendingTx == true) {
        return;
      }
      emit(state.copyWith(sendingTx: true, errLoading: ''));
      final nodeAddress = _nodeAddressCubit.state.getAddress();

      // final unsigned = state.psbt;
      final descriptor = _walletCubit.state.selectedWallet!.descriptor;
      final signed = await compute(signTx, {
        'descriptor': descriptor,
        'unsignedPSBT': state.psbt,
      });

      final txid = await compute(broadcastTx, {
        'descriptor': _walletCubit.state.selectedWallet!.descriptor,
        'nodeAddress': nodeAddress,
        'signedPSBT': signed,
      });

      emit(
        state.copyWith(
          sendingTx: false,
          errLoading: '',
          txId: txid,
          currentStep: SendSteps.sent,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          sendingTx: false,
          errLoading: e.toString(),
        ),
      );
      _logger.logException(e, 'SendCubit.sendclicked', s);
    }
  }

  void shareTxId() {
    _share.share(
      text: 'This is the txid: ' + state.txId,
      subjectForEmail: 'transaction',
    );
  }
}

double estimateFeees(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = BitcoinFFI().estimateNetworkFee(
    network: obj['network']!,
    nodeAddress: obj['nodeAddress']!,
    targetSize: obj['targetSize']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

int getWeight(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = BitcoinFFI().getWeight(
    descriptor: obj['descriptor']!,
    psbt: obj['psbt']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

AbsoluteFees getAbsoluteFees(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = BitcoinFFI().feeAbsoluteToRate(
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
  final resp = BitcoinFFI().buildTransaction(
    descriptor: obj['descriptor']!,
    nodeAddress: obj['nodeAddress']!,
    txOutputs: obj['txOutputs']!,
    feeAbsolute: obj['feeAbsolute']!,
    policyPath: obj['policyPath']!,
    sweep: obj['sweep']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

List<DecodedTxOutput> decodePSBT(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = BitcoinFFI().decodePsbt(
    network: obj['network']!,
    psbt: obj['psbt']!,
  );

  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  final json = jsonDecode(resp.result!)['outputs'];

  final List<DecodedTxOutput> decoded = [];
  for (final out in json)
    decoded.add(DecodedTxOutput.fromJson(out as Map<String, dynamic>));

  return decoded;
}

String signTx(dynamic data) {
  final obj = data as Map<String, String?>;

  final resp = BitcoinFFI().signTransaction(
    descriptor: obj['descriptor']!,
    unsignedPSBT: obj['unsignedPSBT']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

String broadcastTx(dynamic data) {
  final obj = data as Map<String, String?>;

  final resp = BitcoinFFI().broadcastTransaction(
    nodeAddress: obj['nodeAddress']!,
    descriptor: obj['descriptor']!,
    signedPSBT: obj['signedPSBT']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}
// tb1qcd0dej2spq73nlkr4d5w3scksqagz0nzmdnzgg
