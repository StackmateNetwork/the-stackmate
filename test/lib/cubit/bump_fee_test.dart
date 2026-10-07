import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/bump-fee.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallet/signer.dart';
import 'package:sats/model/transaction.dart';

class _MockInfo extends Mock implements InfoCubit {}

class _MockSigner extends Mock implements WalletSigner {}

class _MockNode extends Mock implements NodeAddressCubit {}

class _MockTor extends Mock implements TorCubit {}

class _MockLogger extends Mock implements Logger {}

void main() {
  const tx = Transaction(
    timestamp: 0,
    height: 0,
    txid: 'aa',
    received: 0,
    sent: 20000,
    fee: 300,
  );

  late _MockInfo info;

  BumpFeeCubit build({double suggested = 0}) => BumpFeeCubit(
        tx,
        info,
        _MockSigner(),
        _MockNode(),
        _MockTor(),
        _MockLogger(),
        suggestedFeeRate: suggested,
      );

  setUp(() => info = _MockInfo());

  test('pre-fills the suggested fee rate, rounded up', () {
    expect(build(suggested: 12.3).state.feeRate, '13');
    expect(build().state.feeRate, '');
  });

  blocTest<BumpFeeCubit, BumpFeeState>(
    'rejects an invalid fee rate without touching the wallet',
    build: build,
    act: (cubit) => cubit
      ..feeRateChanged('0')
      ..bump(),
    expect: () => const [
      BumpFeeState(feeRate: '0'),
      BumpFeeState(feeRate: '0', error: BumpFeeCubit.invalidFeeRateError),
    ],
    verify: (_) => verifyZeroInteractions(info),
  );

  blocTest<BumpFeeCubit, BumpFeeState>(
    'editing the fee rate clears the previous error',
    build: build,
    seed: () => const BumpFeeState(error: 'boom'),
    act: (cubit) => cubit.feeRateChanged('5'),
    expect: () => const [BumpFeeState(feeRate: '5')],
  );
}
