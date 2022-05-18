import 'package:bitcoin/types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/pkg/interface/clipboard.dart';

part 'psbt-tool.freezed.dart';

@freezed
class PSBTState with _$PSBTState {
  const factory PSBTState({
    @Default(false) bool broadcasting,
    @Default('') String errBroadcasting,
    @Default('') String psbt,
    @Default('') String txId,
  }) = _PSBTState;

  const PSBTState._();
}

class PSBTCubit extends Cubit<PSBTState> {
  PSBTCubit(
    this._core,
    this._clipBoard,
    this._nodeAddressCubit,
    this._blockchainCubit,
  ) : super(const PSBTState());

  static const minerOutput = 'miner';

  final IClipBoard _clipBoard;
  final NodeAddressCubit _nodeAddressCubit;
  final IStackMateCore _core;
  final ChainSelectCubit _blockchainCubit;

  static const dummyDescriptor = 'wpkh(tprv/*)';
  static const emptyString = '';
  // void completed() {
  //   _walletsCubit.walletSelected(wallet)
  // }
  void reset() {
    emit(
      state.copyWith(txId: emptyString),
    );
  }

  void psbtChanged(String text) {
    emit(
      state.copyWith(psbt: text),
    );
  }

  void pastePSBT() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) emit(state.copyWith(errBroadcasting: text.error!));
    final decoded = _core.decodePsbt(
      network: _blockchainCubit.state.blockchain.name,
      psbt: text.result!,
    );
    if (decoded.hasError) {
      emit(state.copyWith(errBroadcasting: 'Invalid PSBT.'));
    } else
      emit(state.copyWith(psbt: text.result!));
    return;
  }

  void broadcastConfirmed() async {
    try {
      emit(state.copyWith(broadcasting: true, errBroadcasting: emptyString));
      final nodeAddress = _nodeAddressCubit.state.getAddress();

      final psbt = _core.broadcastTransaction(
        descriptor: dummyDescriptor,
        nodeAddress: nodeAddress,
        signedPSBT: state.psbt,
      );

      if (psbt.hasError) {
        emit(
          state.copyWith(
            broadcasting: false,
            errBroadcasting: psbt.error!,
            txId: '',
            psbt: '',
          ),
        );
      } else
        emit(
          state.copyWith(
            broadcasting: false,
            txId: 'BROADCAST SUCCESSFUL.',
            psbt: '',
            errBroadcasting: emptyString,
          ),
        );
    } catch (e, s) {
      emit(
        state.copyWith(
          errBroadcasting: e.toString(),
          broadcasting: false,
        ),
      );

      // _logger.logException(e, 'PSBTCubit.confirmclicked', s);
    }
  }
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
  return resp.result!.psbt;
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
