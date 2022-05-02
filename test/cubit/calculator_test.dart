//

import 'package:sats/api/coincap.dart';
import 'package:sats/api/logger.dart';
import 'package:sats/cubit/calculator.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/clipboard.dart';
import 'package:sats/pkg/vibrate.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

main() {
  group('Calculator Bloc', () {
    late CalculatorCubit bloc;
    // final Logger _logger;
    // final IVibrate _vibrate;
    // final IRatesAPI _ratesAPI;

    setUp(() {
      bloc = CalculatorCubit(
        Logger(ClipBoardd(), SentryLogger()),
        Vibrate(),
        RatesAPI(),
      );
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state should be blank', () {
      expect(bloc.state.currencyAmt, '0');
    });

    blocTest('should add numbers',
        build: () => bloc,
        act: (CalculatorCubit bloc) {
          bloc.getRates();
        },
        expect: () => []);
  });
}
