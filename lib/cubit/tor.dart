import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/result.dart';
import 'package:utopic_tor_onion_proxy/utopic_tor_onion_proxy.dart';
import 'package:sats/api/libtor.dart';

part 'tor.freezed.dart';

@freezed
class TorState with _$TorState {
  const factory TorState({
    @Default(49050) int socks5Port,
    @Default(48950) int httpProxy,
    @Default('Offline.') String bootstapProgress,
    @Default(false) bool isRunning,
    @Default(false) bool isConnected,
    @Default('control_key') String controlKey,
    @Default('') String errConnection,
  }) = _TorState;

  const TorState._();

  String getSocks5() {
    if (socks5Port == 0)
      return 'none';
    else
      return '127.0.0.1:' + socks5Port.toString();
  }
}

class TorCubit extends Cubit<TorState> {
  TorCubit(this._logger) : super(const TorState());
  final Logger _logger;

  Future<void> start() async {
    try {
      emit(
        state.copyWith(
          errConnection: '',
        ),
      );
      final controlKey = await compute(
        daemonStart,
        {'path': '/tmp', 'socks5Port': '49050', 'httpProxy': ''},
      );
      if (controlKey.hasError)
        emit(
          state.copyWith(
            errConnection: controlKey.result!,
            isRunning: false,
            bootstapProgress: '0',
          ),
        );
      else
        emit(
          state.copyWith(
            errConnection: '',
            controlKey: controlKey.result!,
            isRunning: true,
            bootstapProgress: '0',
          ),
        );
    } catch (e) {
      emit(
        state.copyWith(
          isRunning: false,
          errConnection: e.toString(),
        ),
      );
      _logger.logException(e, 'Tor.start', '');
      return;
    }
  }

  Future<void> checkStatus() async {
    try {
      emit(
        state.copyWith(
          errConnection: '',
        ),
      );
      final progress = await compute(
        controlProgress,
        {
          'controlPort': '48950',
          'controlKey': state.controlKey,
        },
      );
      if (progress.hasError)
        emit(
          state.copyWith(
            errConnection: progress.result!,
            isRunning: false,
          ),
        );
      else
        emit(
          state.copyWith(
            errConnection: '',
            isRunning: true,
            isConnected: progress.result == '100',
            bootstapProgress: progress.result!,
          ),
        );
    } catch (e) {
      state.copyWith(
        isRunning: false,
        errConnection: e.toString(),
      );
      _logger.logException(e, 'Tor.status', '');
    }
  }

  Future<void> stop() async {
    try {
      emit(
        state.copyWith(
          errConnection: '',
        ),
      );
      final progress = await compute(
        controlShutdown,
        {
          'controlPort': '48950',
          'controlKey': state.controlKey,
        },
      );
      if (progress.hasError)
        emit(
          state.copyWith(
            errConnection: progress.result!,
          ),
        );
      else
        emit(
          state.copyWith(
            errConnection: '',
            isRunning: false,
            isConnected: false,
            bootstapProgress: progress.result!,
          ),
        );
    } catch (e) {
      state.copyWith(
        errConnection: e.toString(),
      );
      _logger.logException(e, 'Tor.stop', '');
    }
  }
}

Future<R<String>> daemonStart(dynamic data) async {
  final obj = data as Map<String, String?>;

  final resp = LibTor().torStart(
    path: obj['path']!,
    socks5Port: obj['socks5Port']!,
    httpProxy: obj['httpProxy']!,
  );

  return resp;
}

Future<R<String>> controlProgress(dynamic data) async {
  final obj = data as Map<String, String?>;

  final resp = LibTor().torStatus(
    controlPort: obj['controlPort']!,
    controlKey: obj['controlKey']!,
  );

  if (resp.result!.startsWith('101'))
    return const R(error: 'Error, requires restart.');
  return resp;
}

Future<R<String>> controlShutdown(dynamic data) async {
  final obj = data as Map<String, String?>;

  final resp = LibTor().torStop(
    controlPort: obj['controlPort']!,
    controlKey: obj['controlKey']!,
  );

  return resp;
}
