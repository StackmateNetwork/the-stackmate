import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
            attemptsLeft: 3,
            lastFailure: 0,
            isLocked: false,
            isVerified: false,
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
          isVerified: false,
          chosenValue: '',
          confirmedValue: '',
          error: null,
        ),
      );
    }
  }

  void setChosenPin(String value) {
    emit(
      state.copyWith(
        chosenValue: value,
      ),
    );
  }

  void setConfirmedPin(String value) {
    emit(
      state.copyWith(
        confirmedValue: value,
      ),
    );
  }

  void verifyChosenPin() {
    if (state.chosenValue == state.confirmedValue) {
      emit(
        state.copyWith(
          isVerified: true,
        ),
      );
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
    init();
    final lastFailure = DateTime.now().millisecondsSinceEpoch;
    var isLocked = false;
    if (state.attemptsLeft == 1) {
      isLocked = true;
    }
    emit(
      state.copyWith(
        value: state.value,
        attemptsLeft: state.attemptsLeft - 1,
        lastFailure: lastFailure,
        isLocked: isLocked,
        chosenValue: '',
        confirmedValue: '',
        error: null,
      ),
    );
    final pin = Pin(
      attemptsLeft: state.attemptsLeft,
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
    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );
  }

  Future<void> checkPin(String value) async {
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
      } else {
        emit(
          state.copyWith(
            error: 'Locked! Try in 10 seconds.',
            isVerified: false,
          ),
        );
      }
    }

    if (value == state.value) {
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
        ),
      );
    } else {
      saveFailedAttempt();
      emit(
        state.copyWith(
          isVerified: false,
          chosenValue: '',
          confirmedValue: '',
        ),
      );
    }
  }
}
