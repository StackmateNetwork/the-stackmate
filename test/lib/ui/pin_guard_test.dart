import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/main.dart';
import 'package:sats/model/pin.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/storage.dart';

class _PinStore implements IStorage {
  _PinStore(this.pin);
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

void main() {
  late PinCubit pinCubit;
  late GoRouter router;

  Future<void> pumpApp(WidgetTester tester, String initialLocation) async {
    pinCubit = PinCubit(
      _PinStore(
        const Pin(
          value: '1234',
          attemptsLeft: 3,
          lastFailure: 0,
          isLocked: false,
        ),
      ),
    );
    await pinCubit.init();
    router = GoRouter(
      initialLocation: initialLocation,
      redirect: pinGuard,
      routes: [
        GoRoute(path: '/', builder: (_, _) => const Text('pin')),
        GoRoute(path: '/home', builder: (_, _) => const Text('home')),
      ],
    );
    await tester.pumpWidget(
      BlocProvider.value(
        value: pinCubit,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('a locked app cannot open other screens', (tester) async {
    await pumpApp(tester, '/home');
    expect(find.text('pin'), findsOneWidget);
    expect(find.text('home'), findsNothing);

    router.go('/home');
    await tester.pumpAndSettle();
    expect(find.text('pin'), findsOneWidget);
  });

  testWidgets('the right PIN unlocks navigation', (tester) async {
    await pumpApp(tester, '/');
    for (final d in '1234'.split('')) {
      pinCubit.addToConfPin(d);
    }
    await tester.runAsync(pinCubit.checkEnterPin);
    expect(pinCubit.state.isVerified, isTrue);

    router.go('/home');
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
  });
}
