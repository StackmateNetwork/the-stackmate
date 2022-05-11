import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utopic_tor_onion_proxy/utopic_tor_onion_proxy.dart';

part 'tor.freezed.dart';

@freezed
class TorState with _$TorState {
  const factory TorState({
    @Default(9150) int port,
    @Default(false) bool isRunning,
  }) = _TorState;
}

class TorCubit extends Cubit<TorState> {
  TorCubit() : super(const TorState());
  Future<void> start() async {
    try {
      final port = await UtopicTorOnionProxy.startTor();
      emit(
        state.copyWith(port: port!, isRunning: true),
      );
    } on PlatformException catch (e) {
      print('Failed to get port. Message: ${e.message}');
    }
  }

  Future<void> checkStatus() async {
    try {
      final isRunning = await UtopicTorOnionProxy.isTorRunning();
      emit(
        state.copyWith(isRunning: isRunning!),
      );
    } on PlatformException catch (e) {
      print('Failed to get status. Message: ${e.message}');
    }
  }

  Future<void> stop() async {
    try {
      final isStopped = await UtopicTorOnionProxy.stopTor();
      emit(
        state.copyWith(isRunning: !isStopped!),
      );
    } on PlatformException catch (e) {
      print('Failed to get port. Message: ${e.message}');
    }
  }
}
