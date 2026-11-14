import 'package:flutter_test/flutter_test.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/model/pin.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/storage.dart';

/// Keeps the one stored [Pin] in memory.
class _PinStore implements IStorage {
  Pin? pin;

  @override
  R<T> getItem<T>(String cls, int idx) => R(result: pin as T?);

  @override
  Future<R<bool>> saveItemAt<T>(String cls, int idx, T obj) async {
    pin = obj as Pin;
    return const R(result: true);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

Future<void> enter(PinCubit cubit, String pin) async {
  for (final d in pin.split('')) {
    cubit.addToConfPin(d);
  }
  await cubit.checkEnterPin();
}

void main() {
  test('lockout doubles each time and is capped at a day', () {
    expect(PinCubit.lockoutDuration(0), Duration.zero);
    expect(PinCubit.lockoutDuration(1), const Duration(minutes: 1));
    expect(PinCubit.lockoutDuration(2), const Duration(minutes: 2));
    expect(PinCubit.lockoutDuration(5), const Duration(minutes: 16));
    expect(PinCubit.lockoutDuration(40), const Duration(hours: 24));
  });

  test('a PIN is stored only once both entries match', () async {
    final store = _PinStore();
    final cubit = PinCubit(store);
    await cubit.init();

    for (final d in '1234'.split('')) {
      cubit.addToChosenPin(d);
    }
    cubit.setChosenPin();
    for (final d in '9999'.split('')) {
      cubit.addToConfPin(d);
    }
    await cubit.checkConfirmedPin();
    expect(store.pin, isNull);
    expect(cubit.state.isVerified, isFalse);
    // Back to choosing a PIN, not stuck on an empty stored one.
    expect(cubit.state.value, isNull);
    expect(cubit.state.hasChosenPin, isFalse);

    for (final d in '1234'.split('')) {
      cubit.addToChosenPin(d);
    }
    cubit.setChosenPin();
    for (final d in '1234'.split('')) {
      cubit.addToConfPin(d);
    }
    await cubit.checkConfirmedPin();
    expect(store.pin!.value, '1234');
    expect(cubit.state.isVerified, isTrue);
  });

  test('three wrong PINs lock, and a locked PIN rejects even the right one',
      () async {
    final store = _PinStore()
      ..pin = const Pin(
        value: '1234',
        attemptsLeft: 3,
        lastFailure: 0,
        isLocked: false,
      );
    final cubit = PinCubit(store);
    await cubit.init();

    await enter(cubit, '0000');
    await enter(cubit, '0000');
    expect(cubit.state.attemptsLeft, 1);
    await enter(cubit, '0000');
    expect(cubit.state.isLocked, isTrue);
    expect(store.pin!.isLocked, isTrue);
    expect(store.pin!.lockouts, 1);

    await enter(cubit, '1234');
    expect(cubit.state.isVerified, isFalse);
    expect(cubit.state.error, startsWith('Locked!'));
  });

  test('after the lockout the right PIN unlocks and resets the count',
      () async {
    final expired = DateTime.now()
        .subtract(const Duration(minutes: 3))
        .millisecondsSinceEpoch;
    final store = _PinStore()
      ..pin = Pin(
        value: '1234',
        attemptsLeft: 0,
        lastFailure: expired,
        isLocked: true,
        lockouts: 2,
      );
    final cubit = PinCubit(store);
    await cubit.init();

    await enter(cubit, '1234');
    expect(cubit.state.isVerified, isTrue);
    expect(store.pin!.lockouts, 0);
    expect(store.pin!.isLocked, isFalse);
  });

  test('a repeat lockout lasts longer', () async {
    final expired = DateTime.now()
        .subtract(const Duration(minutes: 2))
        .millisecondsSinceEpoch;
    final store = _PinStore()
      ..pin = Pin(
        value: '1234',
        attemptsLeft: 0,
        lastFailure: expired,
        isLocked: true,
        lockouts: 1,
      );
    final cubit = PinCubit(store);
    await cubit.init();

    await enter(cubit, '0000');
    await enter(cubit, '0000');
    await enter(cubit, '0000');
    expect(store.pin!.lockouts, 2);
    expect(cubit.state.error, 'PIN locked for 2 minutes.');
  });
}
