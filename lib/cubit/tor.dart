import 'dart:io';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/libtor.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/result.dart';
import 'package:utopic_tor_onion_proxy/utopic_tor_onion_proxy.dart';

part 'tor.freezed.dart';

@freezed
class TorState with _$TorState {
  const factory TorState({
    @Default('/tmp') String workingDir,
    @Default(9150) int socks5Port,
    @Default('') String httpProxy,
    @Default('101') String bootstapProgress,
    @Default(false) bool isRunning,
    @Default(false) bool isConnected,
    @Default('') String controlKey,
    @Default('') String errConnection,
  }) = _TorState;

  const TorState._();

  String getSocks5() {
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
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final port = await UtopicTorOnionProxy.startTor();
        emit(
          state.copyWith(
            socks5Port: port!,
            errConnection: '',
            isRunning: true,
            isConnected: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isRunning: false,
            errConnection: 'Not Connected To The Internet.',
          ),
        );
      }
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
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final isConnected = await UtopicTorOnionProxy.isTorRunning();
        emit(
          state.copyWith(isConnected: isConnected!),
        );
      } else {
        emit(
          state.copyWith(
            isConnected: false,
            isRunning: false,
            errConnection: 'Not Connected To The Internet.',
          ),
        );
      }
    } catch (e) {
      state.copyWith(
        isConnected: false,
        isRunning: false,
        errConnection: e.toString(),
      );
      _logger.logException(e, 'Tor.status', '');
    }
  }

  Future<void> getProgress() async {
    try {
      emit(
        state.copyWith(
          errConnection: '',
        ),
      );
      final progress = await compute(
        controlProgress,
        {
          'controlPort': (state.socks5Port + 1).toString(),
          'controlKey': state.controlKey,
        },
      );
      if (progress.hasError)
        emit(
          state.copyWith(
            errConnection: progress.error!,
            // isRunning: false,
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
      final status = await compute(
        controlShutdown,
        {
          'controlPort': (state.socks5Port + 1).toString(),
          'controlKey': state.controlKey,
        },
      );
      if (status.hasError)
        emit(
          state.copyWith(
            errConnection: status.error!,
          ),
        );
      else
        emit(
          state.copyWith(
            errConnection: '',
            isRunning: false,
            isConnected: false,
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

void daemonStart(dynamic data) {
  final obj = data as Map<String, String?>;

  LibTor().torStart(
    path: obj['path']!,
    socks5Port: obj['socks5Port']!,
    httpProxy: obj['httpProxy']!,
  );
}

Future<R<String>> controlProgress(dynamic data) async {
  final obj = data as Map<String, String?>;

  final resp = LibTor().torStatus(
    controlPort: obj['controlPort']!,
    controlKey: obj['controlKey']!,
  );
  if (resp.hasError)
    return resp;
  else if (resp.result!.startsWith('101'))
    return const R(error: 'Error, requires restart.');
  else
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
