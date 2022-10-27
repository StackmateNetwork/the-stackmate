import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/model/pin.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'pin.freezed.dart';

const defaultNodeAddress = 'default';
String pinText = '';
String hidden = '';

@freezed
class PinState with _$PinState {
  const factory PinState({
    String? value,
    @Default(3) int attemptsLeft,
    @Default(0) int lastFailure,
    @Default(false) bool isLocked,
    @Default(false) bool hasChosenPin,
    @Default(false) bool isVerified,
    @Default('') String chosenValue,
    @Default('') String confirmedValue,
    String? error,
    Pin? pin,
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
    final pin = _storage.getFirstItem<Pin>(
      StoreKeys.Pin.name,
    );
    if (pin.hasError) {
      if (pin.error! == 'empty')
        emit(
          state.copyWith(
            value: null,
            pin: null,
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
          value: pin.result!.value,
          attemptsLeft: pin.result!.attemptsLeft,
          lastFailure: pin.result!.lastFailure,
          isLocked: pin.result!.isLocked,
          isVerified: false,
          hasChosenPin: true,
          chosenValue: '',
          confirmedValue: '',
          error: (pin.result!.isLocked) ? 'PIN LOCKED!' : null,
        ),
      );
    }
  }

  void addToChosenPin(String value) {
    if (state.chosenValue.length < 4)
      emit(
        state.copyWith(
          chosenValue: state.chosenValue + value,
          hasChosenPin: false,
          error: null,
        ),
      );
  }

  void deleteOneFromChosenPin() {
    final newValue = (state.chosenValue.isEmpty)
        ? emptyString
        : state.chosenValue.substring(0, state.chosenValue.length - 1);
    emit(
      state.copyWith(
        chosenValue: newValue,
        hasChosenPin: false,
        error: null,
      ),
    );
  }

  void clearChosenPin() {
    emit(
      state.copyWith(
        chosenValue: emptyString,
        hasChosenPin: false,
        error: null,
      ),
    );
  }

  void setChosenPin() {
    emit(
      state.copyWith(
        chosenValue: state.chosenValue,
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
          error: null,
        ),
      );
  }

  void deleteOneFromConfPin() {
    final newValue = (state.confirmedValue.isEmpty)
        ? emptyString
        : state.confirmedValue.substring(0, state.confirmedValue.length - 1);
    emit(
      state.copyWith(
        confirmedValue: newValue,
        error: null,
      ),
    );
  }

  void clearConfPin() {
    emit(
      state.copyWith(
        confirmedValue: emptyString,
        error: null,
      ),
    );
  }

  void verifyChosenPin() {
    if (state.chosenValue == state.confirmedValue) {
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
        ),
      );
    }
  }

  Future<void> checkConfirmedPin() async {
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
            isVerified: false,
            chosenValue: '',
            confirmedValue: '',
            error: null,
          ),
        );
      }
    }

    if (state.confirmedValue.length != 4) {
      emit(
        state.copyWith(
          isVerified: false,
          chosenValue: '',
          confirmedValue: '',
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
      emit(
        state.copyWith(
          isVerified: true,
          chosenValue: '',
          confirmedValue: '',
          hasChosenPin: true,
          error: null,
        ),
      );
    } else {
      await saveFailedAttempt();
    }
  }

  Future<void> saveNewPin(String value) async {
    if (value.length != 4) {
      emit(
        state.copyWith(
          error: 'PIN Must be 4 Digits!',
        ),
      );
      return;
    }
    final pin = Pin(
      attemptsLeft: 3,
      lastFailure: 0,
      value: value,
      isLocked: false,
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
      return;
    }
    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );
  }

  Future<void> saveFailedAttempt() async {
    final attempts = state.attemptsLeft - 1;

    final lastFailure = DateTime.now().millisecondsSinceEpoch;
    var isLocked = false;
    if (state.attemptsLeft == 0) {
      isLocked = true;
    }

    if (isLocked) {
      emit(
        state.copyWith(
          error: 'Locked! Try in 10 seconds.',
          isVerified: false,
          value: state.value,
          attemptsLeft: attempts,
          lastFailure: lastFailure,
          isLocked: isLocked,
          chosenValue: '',
          confirmedValue: '',
        ),
      );
    } else
      emit(
        state.copyWith(
          error: 'Wrong PIN! $attempts attempts left. ',
          value: state.value,
          isVerified: false,
          attemptsLeft: attempts,
          lastFailure: lastFailure,
          isLocked: isLocked,
          chosenValue: '',
          confirmedValue: '',
        ),
      );

    final pin = Pin(
      attemptsLeft: attempts,
      lastFailure: lastFailure,
      value: state.value!,
      isLocked: isLocked,
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
    init();
    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );
  }
}
