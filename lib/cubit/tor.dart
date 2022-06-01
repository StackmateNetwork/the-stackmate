import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/logger.dart';
import 'package:utopic_tor_onion_proxy/utopic_tor_onion_proxy.dart';

part 'tor.freezed.dart';

@freezed
class TorState with _$TorState {
  const factory TorState({
    @Default(0) int port,
    @Default(false) bool isRunning,
    @Default('') String errConnection,
  }) = _TorState;

  const TorState._();

  String getSocks5() {
    if (port == 0)
      return 'none';
    else
      return '127.0.0.1:' + port.toString();
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
            port: port!,
            errConnection: '',
            isRunning: true,
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
          errConnection: 'Could not connect to the Internet.',
        ),
      );
      _logger.logException(e, 'Tor.start', '');
      return;
    }
  }

  Future<void> checkStatus() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final isRunning = await UtopicTorOnionProxy.isTorRunning();
        emit(
          state.copyWith(isRunning: isRunning!),
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
      state.copyWith(
        isRunning: false,
        errConnection: e.toString(),
      );
      _logger.logException(e, 'Tor.status', '');
    }
  }

  Future<void> stop() async {
    try {
      final isStopped = await UtopicTorOnionProxy.stopTor();
      emit(
        state.copyWith(isRunning: !isStopped!),
      );
    } catch (e) {
      state.copyWith(
        errConnection: e.toString(),
      );
      _logger.logException(e, 'Tor.stop', '');
    }
  }
}
