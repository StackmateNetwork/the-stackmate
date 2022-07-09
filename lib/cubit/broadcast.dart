import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/interface/clipboard.dart';

part 'broadcast.freezed.dart';

@freezed
class BroadcastState with _$BroadcastState {
  const factory BroadcastState({
    @Default(false) bool broadcasting,
    @Default('') String errBroadcasting,
    @Default('') String psbt,
    @Default('') String hex,
    @Default('') String txId,
    @Default('') String errFileImport,
    @Default(false) bool clearData,
    String? importedPsbtPath,
    String? importedPsbtfileName,
    String? importedHexPath,
    String? importedHexfileName,
  }) = _BroadcastState;

  const BroadcastState._();
}

class BroadcastCubit extends Cubit<BroadcastState> {
  BroadcastCubit(
    this._logger,
    this._core,
    this._clipBoard,
    this._nodeAddressCubit,
    this._torCubit,
    this._blockchainCubit,
  ) : super(const BroadcastState());

  static const minerOutput = 'miner';
  final Logger _logger;
  final IClipBoard _clipBoard;
  final NodeAddressCubit _nodeAddressCubit;
  final IStackMateBitcoin _core;
  final ChainSelectCubit _blockchainCubit;
  final TorCubit _torCubit;

  static const dummyDescriptor = 'wpkh(xprv/*)';
  static const emptyString = '';
  // void completed() {
  //   _walletsCubit.walletSelected(wallet)
  // }
  void reset() {
    emit(
      state.copyWith(
        txId: emptyString,
        importedHexfileName: '',
        importedPsbtfileName: '',
        hex: '',
      ),
    );
  }

  Future<void> updatePSBTFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: [],
      );

      if (result != null) {
        final PlatformFile _psbtFile = result.files.single;

        emit(
          state.copyWith(
            importedPsbtPath: _psbtFile.path,
            importedPsbtfileName: _psbtFile.name,
          ),
        );
      } else {
        emit(state.copyWith(errFileImport: 'Could not find file.'));
      }
    } catch (e, s) {
      _logger.logException(e, 'BroadcastCubit.importPsbt', s);
      emit(
        state.copyWith(
          errFileImport: e.toString(),
        ),
      );
    }
  }

  Future<void> updateHexFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: [],
      );
      if (result != null) {
        final _hexFile = result.files.first;

        emit(
          state.copyWith(
            importedHexPath: _hexFile.path,
            importedHexfileName: _hexFile.name,
          ),
        );
      } else {
        emit(state.copyWith(errFileImport: 'Could not find file.'));
      }
    } catch (e, s) {
      _logger.logException(e, 'BroadcastCubit.importHex', s);
      emit(
        state.copyWith(
          errFileImport: e.toString(),
        ),
      );
    }
  }

  Future<void> clearCachedFiles() async {
    final bool? result = await FilePicker.platform.clearTemporaryFiles();
    if (result != null) {
      emit(
        state.copyWith(
          clearData: true,
          importedHexfileName: '',
          importedPsbtfileName: '',
        ),
      );
    } else {
      emit(state.copyWith(errFileImport: 'Could not find file.'));
    }
  }

  void psbtChanged(String text) {
    emit(
      state.copyWith(psbt: text),
    );
  }

  void hexChanged(String text) {
    emit(
      state.copyWith(hex: text),
    );
  }

  void pastePSBT() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) emit(state.copyWith(errFileImport: text.error!));
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

  void pasteHex() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError)
      emit(state.copyWith(errFileImport: text.error!));
    else
      emit(state.copyWith(hex: text.result!));
  }

  void verifyImportPSBT() async {
    try {
      final psbtFile = File(state.importedPsbtPath!);
      final content = await psbtFile.readAsString();
      final decoded = _core.decodePsbt(
        network: _blockchainCubit.state.blockchain.name,
        psbt: content,
      );
      if (decoded.hasError) {
        emit(state.copyWith(errBroadcasting: 'Invalid PSBT.'));
      } else
        emit(
          state.copyWith(
            psbt: content
                .replaceAll(' ', '')
                .replaceAll('\r', '')
                .replaceAll('\n', ''),
          ),
        );
      return;
    } catch (e, s) {
      _logger.logException(e, 'BroadcastCubit.verifyImportPSBT', s);
      emit(
        state.copyWith(
          errFileImport: e.toString(),
        ),
      );
    }
  }

  void verifyImportHex() async {
    try {
      final hexFile = File(state.importedHexPath!);

      final content = await hexFile.readAsString();
      emit(
        state.copyWith(
          hex: content
              .replaceAll(' ', '')
              .replaceAll('\r', '')
              .replaceAll('\n', ''),
          errFileImport: emptyString,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'BroadcastCubit.verifyImportHex', s);
      emit(
        state.copyWith(
          errFileImport: e.toString(),
        ),
      );
    }
  }

  void hexText(String hex) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    emit(
      state.copyWith(
        hex: hex,
      ),
    );
  }

  Future<void> broadcastHexConfirmed() async {
    try {
      emit(state.copyWith(broadcasting: true, errBroadcasting: emptyString));
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();
      final hex = await _core.broadcastTransactionHex(
        descriptor: dummyDescriptor,
        nodeAddress: nodeAddress,
        socks5: socks5,
        signedHex: state.hex,
      );
      if (hex.hasError) {
        emit(
          state.copyWith(
            broadcasting: false,
            errBroadcasting: hex.error!,
            txId: '',
            hex: '',
          ),
        );
      } else
        emit(
          state.copyWith(
            broadcasting: false,
            txId: 'BROADCAST SUCCESSFUL.',
            hex: '',
            errBroadcasting: emptyString,
          ),
        );
    } catch (e, s) {
      _logger.logException(e, 'BroadcastCubit.confirmclicked', s);
      emit(
        state.copyWith(
          errBroadcasting: e.toString(),
          broadcasting: false,
        ),
      );
    }
  }

  void broadcastConfirmed() async {
    try {
      emit(state.copyWith(broadcasting: true, errBroadcasting: emptyString));
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();
      final psbt = await _core.broadcastTransaction(
        descriptor: dummyDescriptor,
        nodeAddress: nodeAddress,
        socks5: socks5,
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
      _logger.logException(e, 'BroadcastCubit.confirmclicked', s);
      emit(
        state.copyWith(
          errBroadcasting: e.toString(),
          broadcasting: false,
        ),
      );
    }
  }
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

Future<String> broadcastTx(dynamic data) async {
  final obj = data as Map<String, String?>;

  final resp = await LibBitcoin().broadcastTransaction(
    descriptor: obj['descriptor']!,
    nodeAddress: obj['nodeAddress']!,
    socks5: obj['socks5']!,
    signedPSBT: obj['signedPSBT']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}
// tb1qcd0dej2spq73nlkr4d5w3scksqagz0nzmdnzgg
