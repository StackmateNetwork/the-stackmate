import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/interface/clipboard.dart';

part 'broadcast.freezed.dart';

@freezed
abstract class BroadcastState with _$BroadcastState {
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
      final psbtFile = await FilePicker.pickFile();

      if (psbtFile != null) {
        emit(
          state.copyWith(
            importedPsbtPath: psbtFile.path,
            importedPsbtfileName: psbtFile.name,
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
      final hexFile = await FilePicker.pickFile();
      if (hexFile != null) {
        emit(
          state.copyWith(
            importedHexPath: hexFile.path,
            importedHexfileName: hexFile.name,
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
    try {
      await FilePicker.clearTemporaryFiles();
      emit(
        state.copyWith(
          clearData: true,
          importedHexfileName: '',
          importedPsbtfileName: '',
        ),
      );
    } catch (_) {
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

  Future<void> pastePSBT() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) {
      emit(state.copyWith(errFileImport: text.error!));
      return;
    }
    final psbt = text.result!.replaceAll(RegExp(r'\s'), '');
    final decoded = _core.decodePsbt(
      network: _blockchainCubit.state.blockchain.name,
      psbt: psbt,
    );
    if (decoded.hasError) {
      emit(state.copyWith(errBroadcasting: 'Invalid PSBT.'));
    } else {
      emit(state.copyWith(psbt: psbt));
    }
  }

  Future<void> pasteHex() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) {
      emit(state.copyWith(errFileImport: text.error!));
    } else {
      hexText(text.result!);
    }
  }

  Future<void> verifyImportPSBT() async {
    try {
      final psbtFile = File(state.importedPsbtPath!);
      final content = await psbtFile.readAsString();
      final decoded = _core.decodePsbt(
        network: _blockchainCubit.state.blockchain.name,
        psbt: content,
      );
      if (decoded.hasError) {
        emit(state.copyWith(errBroadcasting: 'Invalid PSBT.'));
      } else {
        emit(
          state.copyWith(
            psbt: content
                .replaceAll(' ', '')
                .replaceAll('\r', '')
                .replaceAll('\n', ''),
          ),
        );
      }
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

  Future<void> verifyImportHex() async {
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

  void hexText(String hex) {
    emit(state.copyWith(hex: hex.trim(), errBroadcasting: emptyString));
  }

  static final _hexPattern = RegExp(r'^[0-9a-fA-F]+$');

  /// Broadcasts the entered text, which may be a raw transaction in hex or
  /// a finalized PSBT in base64.
  Future<void> broadcastHexConfirmed() async {
    if (state.broadcasting) return;
    final input = state.hex.replaceAll(RegExp(r'\s'), '');
    if (input.isEmpty) {
      emit(state.copyWith(errBroadcasting: 'Nothing to broadcast.'));
      return;
    }
    try {
      emit(
        state.copyWith(
          broadcasting: true,
          errBroadcasting: emptyString,
          txId: emptyString,
        ),
      );
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();
      final result = _hexPattern.hasMatch(input)
          ? await BitcoinWorker.broadcastHex(
              descriptor: dummyDescriptor,
              nodeAddress: nodeAddress,
              socks5: socks5,
              signedHex: input,
            )
          : await BitcoinWorker.broadcast(
              descriptor: dummyDescriptor,
              nodeAddress: nodeAddress,
              socks5: socks5,
              signedPSBT: input,
            );
      if (result.hasError) {
        // Keep the input so the user can fix the node/Tor and retry.
        emit(
          state.copyWith(
            broadcasting: false,
            errBroadcasting: result.errorMessage,
          ),
        );
      } else {
        emit(
          state.copyWith(
            broadcasting: false,
            txId: 'BROADCAST SUCCESSFUL.\n${result.result}',
            hex: '',
            errBroadcasting: emptyString,
          ),
        );
      }
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

  Future<void> broadcastConfirmed() async {
    if (state.broadcasting) return;
    try {
      emit(state.copyWith(broadcasting: true, errBroadcasting: emptyString));
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();
      final psbt = await BitcoinWorker.broadcast(
        descriptor: dummyDescriptor,
        nodeAddress: nodeAddress,
        socks5: socks5,
        signedPSBT: state.psbt,
      );

      if (psbt.hasError) {
        emit(
          state.copyWith(
            broadcasting: false,
            errBroadcasting: psbt.errorMessage,
            txId: '',
          ),
        );
      } else {
        emit(
          state.copyWith(
            broadcasting: false,
            txId: 'BROADCAST SUCCESSFUL.\n${psbt.result}',
            psbt: '',
            errBroadcasting: emptyString,
          ),
        );
      }
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
