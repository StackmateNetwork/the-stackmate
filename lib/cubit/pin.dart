import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/model/pin.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'pin.freezed.dart';

const defaultNodeAddress = 'default';
const String hiddenPin = ' . ';

@freezed
class PinState with _$PinState {
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
  PinCubit(
    this._storage,
  ) : super(const PinState()) {
    init();
  }

  final IStorage _storage;

  void init() async {
    final pin = _storage.getItem<Pin>(
      StoreKeys.Pin.name,
      0,
    );
    if (pin.hasError) {
      if (pin.error! == 'empty')
        emit(
          state.copyWith(
            value: null,
            attemptsLeft: 3,
            lastFailure: 0,
            isLocked: false,
            isVerified: false,
            hasChosenPin: false,
            error: null,
          ),
        );
      else
        emit(
          state.copyWith(
            error: pin.error.toString(),
            isVerified: false,
          ),
        );
    } else {
      emit(
        state.copyWith(
          value: (pin.result!.value == emptyString) ? null : pin.result!.value,
          attemptsLeft: pin.result!.attemptsLeft,
          lastFailure: pin.result!.lastFailure,
          isLocked: pin.result!.isLocked,
          isVerified: false,
          hasChosenPin: pin.result!.value != emptyString,
          setValue: emptyString,
          confirmedValue: emptyString,
          hiddenValue: emptyString,
          error: (pin.result!.isLocked) ? 'PIN LOCKED!' : null,
        ),
      );
    }
  }

  void addToChosenPin(String value) {
    if (state.setValue.length < 4)
      emit(
        state.copyWith(
          setValue: state.setValue + value,
          hiddenValue: state.hiddenValue + hiddenPin,
          hasChosenPin: false,
          error: null,
        ),
      );
  }

  void deleteOneFromChosenPin() {
    final newValue = (state.setValue.isEmpty)
        ? emptyString
        : state.setValue.substring(0, state.setValue.length - 1);
    final newHidden = (state.hiddenValue.isEmpty)
        ? emptyString
        : state.hiddenValue.substring(0, state.hiddenValue.length - 3);
    emit(
      state.copyWith(
        setValue: newValue,
        hiddenValue: newHidden,
        hasChosenPin: false,
        error: null,
      ),
    );
  }

  void clearChosenPin() {
    emit(
      state.copyWith(
        setValue: emptyString,
        hiddenValue: emptyString,
        hasChosenPin: false,
        error: null,
      ),
    );
  }

  void setChosenPin() {
    emit(
      state.copyWith(
        setValue: state.setValue,
        hiddenValue: emptyString,
        confirmedValue: emptyString,
        hasChosenPin: true,
        error: null,
      ),
    );
  }

  void addToConfPin(String value) {
    if (state.confirmedValue.length < 4)
      emit(
        state.copyWith(
          confirmedValue: state.confirmedValue + value,
          hiddenValue: state.hiddenValue + hiddenPin,
          error: null,
        ),
      );
  }

  void deleteOneFromConfPin() {
    final newValue = (state.confirmedValue.isEmpty)
        ? emptyString
        : state.confirmedValue.substring(0, state.confirmedValue.length - 1);
    final newHidden = (state.hiddenValue.isEmpty)
        ? emptyString
        : state.hiddenValue.substring(0, state.hiddenValue.length - 3);
    emit(
      state.copyWith(
        confirmedValue: newValue,
        hiddenValue: newHidden,
        error: null,
      ),
    );
  }

  void clearConfPin() {
    emit(
      state.copyWith(
        confirmedValue: emptyString,
        hiddenValue: emptyString,
        error: null,
      ),
    );
  }

  void verifyChosenPin() {
    if (state.setValue == state.confirmedValue) {
      emit(
        state.copyWith(
          isVerified: true,
          hasChosenPin: true,
          error: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          hasChosenPin: false,
          error: 'PINs do not match!',
          confirmedValue: emptyString,
          hiddenValue: emptyString,
        ),
      );
    }
  }

  Future<void> checkConfirmedPin() async {
    if (state.confirmedValue.length != 4) {
      emit(
        state.copyWith(
          isVerified: false,
          confirmedValue: emptyString,
          hiddenValue: emptyString,
          error: 'PIN Must be 4 Digits.',
        ),
      );
      return;
    }

    if (state.confirmedValue != emptyString &&
        state.confirmedValue == state.setValue) {
      final pin = Pin(
        attemptsLeft: 3,
        lastFailure: state.lastFailure,
        value: state.confirmedValue,
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
      }
      await Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
      );
      emit(
        state.copyWith(
          isVerified: true,
          hasChosenPin: true,
          error: null,
        ),
      );
    } else {
      await saveFailedAttempt(); // we dont have to save this resetSetPin();
    }
  }

  Future<void> checkEnterPin() async {
    if (state.isLocked) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (state.lastFailure - now >= 60000) {
        // allow retry
        emit(
          state.copyWith(
            value: state.value,
            attemptsLeft: 3,
            lastFailure: state.lastFailure,
            isLocked: false,
            isVerified: false,
            confirmedValue: emptyString,
            hiddenValue: emptyString,
            error: null,
          ),
        );
      }
    }

    if (state.confirmedValue.length != 4) {
      emit(
        state.copyWith(
          isVerified: false,
          confirmedValue: emptyString,
          hiddenValue: emptyString,
          error: 'PIN Must be 4 Digits.',
        ),
      );
      return;
    }

    if (state.confirmedValue == state.value) {
      final pin = Pin(
        attemptsLeft: 3,
        lastFailure: state.lastFailure,
        value: state.value!,
        isLocked: state.isLocked,
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
      }
      emit(
        state.copyWith(
          isVerified: true,
          confirmedValue: emptyString,
          hasChosenPin: true,
          error: null,
          hiddenValue: emptyString,
        ),
      );
    } else {
      await saveFailedAttempt();
    }
  }

  // Future<void> saveNewPin(String value) async {
  //   if (value.length != 4) {
  //     emit(
  //       state.copyWith(
  //         error: 'PIN Must be 4 Digits!',
  //       ),
  //     );
  //     return;
  //   }
  //   final pin = Pin(
  //     attemptsLeft: 3,
  //     lastFailure: 0,
  //     value: value,
  //     isLocked: false,
  //   );
  //   final saved = await _storage.saveItem<Pin>(
  //     StoreKeys.Pin.name,
  //     pin,
  //   );
  //   if (saved.hasError) {
  //     emit(
  //       state.copyWith(
  //         error: saved.error.toString(),
  //       ),
  //     );
  //     return;
  //   }
  //   await Future.delayed(
  //     const Duration(
  //       milliseconds: 200,
  //     ),
  //   );
  // }

  Future<void> saveFailedAttempt() async {
    final updatedAttempts = state.attemptsLeft - 1;

    final lastFailure = DateTime.now().millisecondsSinceEpoch;
    var isLocked = false;

    if (updatedAttempts <= 0) {
      isLocked = true;
    }

    if (isLocked) {
      emit(
        state.copyWith(
          error: 'Locked! Try in 1 minute.',
          isVerified: false,
          value: state.value,
          attemptsLeft: (state.value == null) ? 3 : updatedAttempts,
          lastFailure: lastFailure,
          isLocked: state.value ==
              null, // will be false if pin is set(stays locked) true if no pin set(unlock to set again)
          // ignore: avoid_bool_literals_in_conditional_expressions
          hasChosenPin: state.value !=
              null, // will be true if pin is set, will be false if not set (triggers a reset)
          setValue: emptyString,
          confirmedValue: emptyString,
          hiddenValue: emptyString,
        ),
      );
    } else
      emit(
        state.copyWith(
          error: (state.value == null)
              ? 'Wrong PIN! Set again.'
              : 'Wrong PIN! $updatedAttempts attempts left. ',
          isVerified: false,
          attemptsLeft: updatedAttempts,
          lastFailure: lastFailure,
          isLocked: isLocked,
          hiddenValue: emptyString,
        ),
      );

    // if (state.value == null || state.value == emptyString) {
    //   // still in set/confirm stage (do not lock)
    //   updatedAttempts = 3;
    //   isLocked = false;
    // }

    final pin = Pin(
      attemptsLeft: (state.value == null || state.value == emptyString)
          ? 3
          : updatedAttempts,
      lastFailure: lastFailure,
      value: (state.value == null) ? emptyString : state.value!,
      // ignore: avoid_bool_literals_in_conditional_expressions
      isLocked: (state.value == null || state.value == emptyString)
          ? false
          : isLocked,
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
    }

    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );

    init();
  }
}
