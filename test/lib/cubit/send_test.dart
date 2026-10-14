import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';

class _MockWallets extends Mock implements WalletsCubit {}

class _MockChain extends Mock implements ChainSelectCubit {}

class _MockLogger extends Mock implements Logger {}

class _MockClipBoard extends Mock implements IClipBoard {}

class _MockShare extends Mock implements IShare {}

class _MockNode extends Mock implements NodeAddressCubit {}

class _MockTor extends Mock implements TorCubit {}

class _MockCore extends Mock implements IStackMateBitcoin {}

class _MockFees extends Mock implements FeesCubit {}

class _MockStorage extends Mock implements IStorage {}

class _MockMaster extends Mock implements MasterKeyCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const address = 'tb1q6rz28mcfaxtmd6v789l9rrlrusdprr9pqcpvkl';
  const wallet = Wallet(
    id: 0,
    uid: 'uid',
    label: 'test',
    descriptor: 'wpkh(tpub/*)',
    policy: 'pk(tpub)',
    requiredPolicyElements: 1,
    policyElements: ['tpub'],
    blockchain: 'test',
    transactions: [],
    balance: 100000,
    lastAddressIndex: 0,
    walletType: WalletType.primary,
    passPhrase: '',
    fingerprint: 'ffffffff',
  );

  late _MockCore core;
  late _MockClipBoard clipBoard;

  Future<SendCubit> build() async {
    final chain = _MockChain();
    when(() => chain.state)
        .thenReturn(const BlockchainState(blockchain: Blockchain.test));
    final logger = _MockLogger();
    when(() => logger.logException(any(), any(), any()))
        .thenAnswer((_) async {});

    final cubit = SendCubit(
      false,
      _MockWallets(),
      chain,
      logger,
      clipBoard,
      _MockShare(),
      _MockNode(),
      _MockTor(),
      core,
      _MockFees(),
      _MockStorage(),
      _MockMaster(),
      wallet,
    );
    await pumpEventQueue();
    return cubit;
  }

  setUp(() {
    core = _MockCore();
    clipBoard = _MockClipBoard();
    when(
      () => core.isValidAddress(
        address: any(named: 'address'),
        network: any(named: 'network'),
      ),
    ).thenAnswer(
      (i) => i.namedArguments[#address] == address,
    );
  });

  test('starts with the stored balance once loading ends', () async {
    final cubit = await build();
    expect(cubit.state.loadingStart, isFalse);
    expect(cubit.state.balance, wallet.balance);
  });

  test('rejects an invalid address and stays on the address step', () async {
    final cubit = await build();
    cubit
      ..adddressChanged('mango')
      ..addressConfirmedClicked();
    expect(cubit.state.currentStep, SendSteps.address);
    expect(cubit.state.errAddress, SendCubit.invalidAddressError);
  });

  test('a valid address moves on to the amount step', () async {
    final cubit = await build();
    cubit
      ..adddressChanged(' $address ')
      ..addressConfirmedClicked();
    expect(cubit.state.address, address);
    expect(cubit.state.currentStep, SendSteps.amount);
    expect(cubit.state.errAddress, isEmpty);
  });

  test('pasting a BIP21 uri fills address and amount', () async {
    when(() => clipBoard.pasteFromClipBoard()).thenAnswer(
      (_) async => const R(result: 'bitcoin:$address?label=x&amount=0.0005'),
    );
    final cubit = await build();
    await cubit.pasteAddress();
    expect(cubit.state.address, address);
    expect(cubit.state.amount, '50000');
  });

  test('an empty paste keeps the typed address', () async {
    when(() => clipBoard.pasteFromClipBoard())
        .thenAnswer((_) async => const R(result: ''));
    final cubit = await build();
    cubit.adddressChanged(address);
    await cubit.pasteAddress();
    expect(cubit.state.address, address);
  });

  group('amount', () {
    Future<SendCubit> atAmount(String amount) async {
      final cubit = await build();
      cubit
        ..adddressChanged(address)
        ..addressConfirmedClicked()
        ..amountChanged(amount);
      await cubit.amountConfirmedClicked();
      return cubit;
    }

    test('rejects non-numeric input', () async {
      final cubit = await atAmount('abc');
      expect(cubit.state.errAmount, SendCubit.invalidAmountError);
      expect(cubit.state.currentStep, SendSteps.amount);
    });

    test('rejects more than the balance', () async {
      final cubit = await atAmount('100,001');
      expect(cubit.state.errAmount, SendCubit.insufficientBalanceError);
    });

    test('rejects dust but accepts the dust limit itself', () async {
      final dust = await atAmount('545');
      expect(dust.state.errAmount, SendCubit.belowDustError);

      final limit = await atAmount('546');
      expect(limit.state.errAmount, isEmpty);
      expect(limit.state.txOutputs, '$address:546');
    });

    test('sweeping needs no amount and builds a drain output', () async {
      final cubit = await build();
      cubit
        ..adddressChanged(address)
        ..addressConfirmedClicked()
        ..toggleSweep();
      await cubit.amountConfirmedClicked();
      expect(cubit.state.errAmount, isEmpty);
      expect(cubit.state.txOutputs, '$address:0');
    });
  });

  test('fee options select their fee and the slider sets a custom one',
      () async {
    final cubit = await build();
    cubit.emit(
      cubit.state.copyWith(
        currentStep: SendSteps.fees,
        feeSlow: 100,
        feeMedium: 200,
        feeFast: 300,
      ),
    );
    cubit.feeSelected(0);
    expect(cubit.state.finalFee, 100);
    cubit.feeSelected(2);
    expect(cubit.state.finalFee, 300);
    cubit.feeChanged(250);
    expect(cubit.state.finalFee, 250);
    expect(cubit.state.feesOption, -1);
  });

  test('back walks the steps but not while busy', () async {
    final cubit = await build();
    cubit.emit(cubit.state.copyWith(currentStep: SendSteps.confirm));
    cubit.backClicked();
    expect(cubit.state.currentStep, SendSteps.fees);

    cubit.emit(cubit.state.copyWith(buildingTx: true));
    cubit.backClicked();
    expect(cubit.state.currentStep, SendSteps.fees);

    cubit.emit(cubit.state.copyWith(buildingTx: false));
    cubit
      ..backClicked()
      ..backClicked()
      ..backClicked();
    expect(cubit.state.currentStep, SendSteps.address);
  });
}
