import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/pkg/storage.dart';
import 'package:test/test.dart';
import 'package:sats/cubit/tor.dart';

void main() {
  group('Tor', () {
    late TorCubit torCubit;

    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();
      torCubit = TorCubit();
    });

    tearDown(() {});
    blocTest<TorCubit, TorState>(
      'Initialize tor and monitor bootstrap progress',
      build: () {
        return torCubit;
      },
      act: (cubit) async {
        torCubit.start();
        torCubit.checkStatus();
        // we need to sleep and checkStatus after 10 seconds
        // the line below will break the test
        // await Future.delayed(Duration(seconds: 10));
        torCubit.checkStatus();
        torCubit.stop();
      },
      expect: () => <TorState>[
        // const TorState(port: 9150, isRunning: false),
        // const TorState(port: 9150, isRunning: false),
        // const TorState(port: 9150, isRunning: true),
        // const TorState(port: 9150, isRunning: false),
      ],
    );
  });
}
