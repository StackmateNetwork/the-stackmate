import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/model/pin.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'pin.freezed.dart';

const defaultNodeAddress = 'default';

@freezed
class PinState with _$PinState {
  const factory PinState({
    String? value,
    @Default(3) int attemptsLeft,
    @Default(0) int lastFailure,
    @Default(false) bool isLocked,
    String? error,
  }) = _PinState;

  const PinState._();
}

class PinCubit extends Cubit<PinState> {
  PinCubit(
    this._storage,
  ) : super(const PinState());

  final IStorage _storage;

  void init() async {
    final pin = _storage.getFirstItem<Pin>(
      StoreKeys.Pin.name,
    );
    if (pin.hasError) {
      if (pin.error! == 'empty')
        emit(
          state.copyWith(
            value: null,
            attemptsLeft: 3,
            lastFailure: 0,
            isLocked: false,
            error: null,
          ),
        );
      else
        emit(
          state.copyWith(
            error: pin.error.toString(),
          ),
        );
    } else {
      emit(
        state.copyWith(
          value: pin.result!.value,
          attemptsLeft: pin.result!.attemptsLeft,
          lastFailure: pin.result!.lastFailure,
          isLocked: pin.result!.isLocked,
          error: null,
        ),
      );
    }
  }

  Future<void> saveNewPin(String value, String fingerPrint) async {
    final pin = Pin(
      attemptsLeft: 3,
      lastFailure: 0,
      value: value,
      isLocked: false,
    );
    final saved = await _storage.saveItemAt<Pin>(
      StoreKeys.Pin.name,
      0,
      pin,
    );
    if (saved.hasError) {
      emit(
        state.copyWith(
          error: saved.error.toString(),
        ),
      );
      return;
    }
    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );
  }

  Future<void> saveFailedAttempt() async {
    init();
    final lastFailure = DateTime.now().millisecondsSinceEpoch;
    emit(
      state.copyWith(
        value: state.value,
        attemptsLeft: state.attemptsLeft - 1,
        lastFailure: lastFailure,
        isLocked: state.isLocked,
        error: null,
      ),
    );
    final pin = Pin(
      attemptsLeft: state.attemptsLeft,
      lastFailure: lastFailure,
      value: state.value!,
      isLocked: state.isLocked,
    );

    final saved = await _storage.saveItem<Pin>(
      StoreKeys.Pin.name,
      pin,
    );
    if (saved.hasError) {
      emit(
        state.copyWith(
          error: saved.error.toString(),
        ),
      );
    }
    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );
  }

  Future<bool> checkPin(String value) async {
    if (state.isLocked) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (state.lastFailure - now == 10000) {
        // allow retry
        emit(
          state.copyWith(
            value: state.value,
            attemptsLeft: 3,
            lastFailure: state.lastFailure,
            isLocked: false,
            error: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            error: 'Locked! Try in 10 seconds.',
          ),
        );
        return false;
      }
    }

    if (value == state.value) {
      // allow
      return true;
    } else {
      saveFailedAttempt();
      return false;
    }
  }
}
