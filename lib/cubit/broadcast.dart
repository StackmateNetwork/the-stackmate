import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/bitcoin_worker.dart';
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
    @Default('') String hex,
    @Default('') String txId,
    @Default('') String errFileImport,
    @Default(false) bool clearData,
    String? importedHexPath,
    String? importedHexfileName,
  }) = _BroadcastState;

  const BroadcastState._();
}

class BroadcastCubit extends Cubit<BroadcastState> {
  BroadcastCubit(
    this._logger,
    this._clipBoard,
    this._nodeAddressCubit,
    this._torCubit,
  ) : super(const BroadcastState());

  final Logger _logger;
  final IClipBoard _clipBoard;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;

  static const dummyDescriptor = 'wpkh(xprv/*)';
  static const emptyString = '';
  void reset() {
    emit(
      state.copyWith(
        txId: emptyString,
        importedHexfileName: '',
        hex: '',
      ),
    );
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
        ),
      );
    } catch (_) {
      emit(state.copyWith(errFileImport: 'Could not find file.'));
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
}
