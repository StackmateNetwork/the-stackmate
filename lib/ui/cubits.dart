import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/words_cubit.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/mnemonic_word.dart';
import 'package:sats/pkg/secure-storage.dart';

class Cubits extends StatefulWidget {
  const Cubits({super.key, required this.child});
  final Widget child;

  @override
  State<Cubits> createState() => _CubitsState();
}

class _CubitsState extends State<Cubits> {
  final logger = locator<Logger>();
  late final ChainSelectCubit networkSelectCubit;
  late final TorCubit torCubit;
  late final MasterKeyCubit masterKeyCubit;
  late final PreferencesCubit preferencesCubit;
  late final WalletsCubit walletsCubit;
  late final NodeAddressCubit nodeAddressCubit;
  late final FeesCubit feesCubit;
  late final BroadcastCubit broadcastHex;
  late final PinCubit pinCubit;
  late final WordsCubit wordCubit;

  @override
  void initState() {
    super.initState();
    final storage = locator<IStorage>();

    networkSelectCubit = ChainSelectCubit(storage, logger);
    networkSelectCubit.init();

    torCubit = TorCubit(storage, logger);
    torCubit.start();

    masterKeyCubit = MasterKeyCubit(locator<SStorage>(), networkSelectCubit);
    masterKeyCubit.init();

    preferencesCubit = PreferencesCubit(storage);
    preferencesCubit.init();

    walletsCubit = WalletsCubit(
      storage,
      logger,
      networkSelectCubit,
      locator<IClipBoard>(),
    );

    nodeAddressCubit = NodeAddressCubit(storage, networkSelectCubit);
    nodeAddressCubit.init();

    // Loads cached fees and fetches fresh ones on creation.
    feesCubit = FeesCubit(
      storage,
      networkSelectCubit,
      nodeAddressCubit,
      torCubit,
      logger,
    );

    broadcastHex = BroadcastCubit(
      logger,
      locator<IStackMateBitcoin>(),
      locator<IClipBoard>(),
      nodeAddressCubit,
      torCubit,
      networkSelectCubit,
    );

    pinCubit = PinCubit(storage);
    pinCubit.init();

    wordCubit = WordsCubit(mnemonicWords: MnemonicWords());
  }

  /// Everything that depends on the selected network is reloaded here, so a
  /// switch takes effect however the settings screen is left.
  Future<void> _networkChanged() async {
    walletsCubit.refresh();
    await masterKeyCubit.init();
    await nodeAddressCubit.init();
    await feesCubit.update();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: networkSelectCubit),
        BlocProvider.value(value: logger),
        BlocProvider.value(value: walletsCubit),
        BlocProvider.value(value: feesCubit),
        BlocProvider.value(value: nodeAddressCubit),
        BlocProvider.value(value: preferencesCubit),
        BlocProvider.value(value: torCubit),
        BlocProvider.value(value: masterKeyCubit),
        BlocProvider.value(value: broadcastHex),
        BlocProvider.value(value: pinCubit),
        BlocProvider.value(value: wordCubit),
      ],
      child: BlocListener<ChainSelectCubit, BlockchainState>(
        listenWhen: (p, c) => p.blockchain != c.blockchain,
        listener: (context, state) => _networkChanged(),
        child: widget.child,
      ),
    );
  }
}
