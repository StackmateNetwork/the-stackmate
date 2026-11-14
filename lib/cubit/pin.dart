import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/model/pin.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'pin.freezed.dart';

const String hiddenPin = ' . ';
const _empty = '';

@freezed
abstract class PinState with _$PinState {
  const factory PinState({
    String? value,
    @Default(3) int attemptsLeft,
    @Default(0) int lastFailure,
    @Default(false) bool isLocked,
    @Default(false) bool isVerified,
    @Default(false) bool hasChosenPin,
    @Default(false) bool hasSetPin,
    @Default(false) bool hasEnteredPin,
    @Default('') String setValue,
    @Default('') String confirmedValue,
    @Default('') String enteredValue,
    @Default('') String hiddenValue,
    String? error,
  }) = _PinState;

  const PinState._();
}

class PinCubit extends Cubit<PinState> {
  PinCubit(this._storage) : super(const PinState()) {
    init();
  }

  final IStorage _storage;

  static const pinLength = 4;
  static const attemptsPerRound = 3;
  static const _baseLockout = Duration(minutes: 1);
  static const _maxLockout = Duration(hours: 24);

  /// Lockouts since the last correct PIN, persisted with the PIN.
  int _lockouts = 0;

  /// How long the PIN stays locked after the [lockouts]-th lockout: one
  /// minute, doubling each time, capped at a day. This keeps the 10,000
  /// possible PINs out of reach of a brute-force attempt.
  static Duration lockoutDuration(int lockouts) {
    if (lockouts <= 0) return Duration.zero;
    final ms = _baseLockout.inMilliseconds * pow(2, min(lockouts - 1, 20));
    return Duration(milliseconds: min(ms.toInt(), _maxLockout.inMilliseconds));
  }

  Future<void> init() async {
    final pin = _storage.getItem<Pin>(StoreKeys.Pin.name, 0);
    final stored = pin.result;
    if (stored == null || stored.value.isEmpty) {
      if (pin.hasError && pin.error != 'empty') {
        emit(state.copyWith(error: pin.error.toString(), isVerified: false));
        return;
      }
      _lockouts = 0;
      emit(const PinState());
      return;
    }
    _lockouts = stored.lockouts;
    emit(
      state.copyWith(
        value: stored.value,
        attemptsLeft: stored.attemptsLeft,
        lastFailure: stored.lastFailure,
        isLocked: stored.isLocked,
        isVerified: false,
        hasChosenPin: true,
        setValue: _empty,
        confirmedValue: _empty,
        hiddenValue: _empty,
        error: null,
      ),
    );
  }

  void addToChosenPin(String value) {
    if (state.setValue.length < pinLength) {
      emit(
        state.copyWith(
          setValue: state.setValue + value,
          hiddenValue: state.hiddenValue + hiddenPin,
          hasChosenPin: false,
          error: null,
        ),
      );
    }
  }

  void deleteOneFromChosenPin() {
    if (state.setValue.isEmpty) return;
    emit(
      state.copyWith(
        setValue: state.setValue.substring(0, state.setValue.length - 1),
        hiddenValue: state.hiddenValue.substring(
          0,
          state.hiddenValue.length - hiddenPin.length,
        ),
        hasChosenPin: false,
        error: null,
      ),
    );
  }

  void clearChosenPin() {
    emit(
      state.copyWith(
        setValue: _empty,
        hiddenValue: _empty,
        hasChosenPin: false,
      ),
    );
  }

  void setChosenPin() {
    if (state.setValue.length != pinLength) {
      emit(state.copyWith(error: 'PIN Must be 4 Digits.'));
      return;
    }
    emit(
      state.copyWith(
        hiddenValue: _empty,
        confirmedValue: _empty,
        hasChosenPin: true,
        error: null,
      ),
    );
  }

  void addToConfPin(String value) {
    if (state.confirmedValue.length < pinLength) {
      emit(
        state.copyWith(
          confirmedValue: state.confirmedValue + value,
          hiddenValue: state.hiddenValue + hiddenPin,
          error: null,
        ),
      );
    }
  }

  void deleteOneFromConfPin() {
    if (state.confirmedValue.isEmpty) return;
    emit(
      state.copyWith(
        confirmedValue: state.confirmedValue.substring(
          0,
          state.confirmedValue.length - 1,
        ),
        hiddenValue: state.hiddenValue.substring(
          0,
          state.hiddenValue.length - hiddenPin.length,
        ),
        error: null,
      ),
    );
  }

  void clearConfPin() {
    emit(state.copyWith(confirmedValue: _empty, hiddenValue: _empty));
  }

  bool _rejectIncomplete() {
    if (state.confirmedValue.length == pinLength) return false;
    emit(
      state.copyWith(
        isVerified: false,
        confirmedValue: _empty,
        hiddenValue: _empty,
        error: 'PIN Must be 4 Digits.',
      ),
    );
    return true;
  }

  /// Second step of choosing a PIN: the confirmation must match.
  Future<void> checkConfirmedPin() async {
    if (_rejectIncomplete()) return;

    if (state.confirmedValue != state.setValue) {
      // Start over; nothing is stored until both entries match.
      emit(
        const PinState().copyWith(error: 'PINs do not match! Set again.'),
      );
      return;
    }

    final saved = await _save(
      value: state.confirmedValue,
      attemptsLeft: attemptsPerRound,
      lastFailure: 0,
      isLocked: false,
      lockouts: 0,
    );
    if (!saved) return;
    emit(
      state.copyWith(
        value: state.confirmedValue,
        isVerified: true,
        hasChosenPin: true,
        confirmedValue: _empty,
        setValue: _empty,
        hiddenValue: _empty,
        error: null,
      ),
    );
  }

  /// Unlocks the app when the entered PIN matches the stored one.
  Future<void> checkEnterPin() async {
    if (_rejectIncomplete()) return;
    final entered = state.confirmedValue;
    final now = DateTime.now().millisecondsSinceEpoch;

    if (state.isLocked) {
      final unlockAt = state.lastFailure +
          lockoutDuration(max(1, _lockouts)).inMilliseconds;
      if (now < unlockAt) {
        emit(
          state.copyWith(
            error: 'Locked! ${_describe(unlockAt - now)} left.',
            confirmedValue: _empty,
            hiddenValue: _empty,
          ),
        );
        return;
      }
      // The lockout is over: this entry starts a new round of attempts.
      emit(state.copyWith(isLocked: false, attemptsLeft: attemptsPerRound));
    }

    if (entered == state.value) {
      _lockouts = 0;
      await _save(
        value: state.value!,
        attemptsLeft: attemptsPerRound,
        lastFailure: 0,
        isLocked: false,
        lockouts: 0,
      );
      emit(
        state.copyWith(
          attemptsLeft: attemptsPerRound,
          lastFailure: 0,
          isLocked: false,
          isVerified: true,
          confirmedValue: _empty,
          hiddenValue: _empty,
          error: null,
        ),
      );
      return;
    }

    final attemptsLeft = max(0, state.attemptsLeft - 1);
    final locked = attemptsLeft == 0;
    if (locked) _lockouts++;
    await _save(
      value: state.value!,
      attemptsLeft: attemptsLeft,
      lastFailure: now,
      isLocked: locked,
      lockouts: _lockouts,
    );
    emit(
      state.copyWith(
        attemptsLeft: attemptsLeft,
        lastFailure: now,
        isLocked: locked,
        isVerified: false,
        confirmedValue: _empty,
        hiddenValue: _empty,
        error: locked
            ? 'PIN locked for '
                '${_describe(lockoutDuration(_lockouts).inMilliseconds)}.'
            : 'Wrong PIN! $attemptsLeft attempts left.',
      ),
    );
  }

  Future<bool> _save({
    required String value,
    required int attemptsLeft,
    required int lastFailure,
    required bool isLocked,
    required int lockouts,
  }) async {
    final saved = await _storage.saveItemAt<Pin>(
      StoreKeys.Pin.name,
      0,
      Pin(
        value: value,
        attemptsLeft: attemptsLeft,
        lastFailure: lastFailure,
        isLocked: isLocked,
        lockouts: lockouts,
      ),
    );
    if (saved.hasError) emit(state.copyWith(error: saved.error.toString()));
    return !saved.hasError;
  }

  static String _describe(int ms) {
    final seconds = (ms / 1000).ceil();
    if (seconds < 120) return '$seconds seconds';
    final minutes = (seconds / 60).ceil();
    if (minutes < 120) return '$minutes minutes';
    return '${(minutes / 60).ceil()} hours';
  }
}
