import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
// import 'package:sats/pkg/vibrate.dart';

class Cubits extends StatefulWidget {
  const Cubits({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<Cubits> createState() => _CubitsState();
}

class _CubitsState extends State<Cubits> {
  @override
  Widget build(BuildContext context) {
    final logger = locator<Logger>();

    final networkSelectCubit = ChainSelectCubit(
      locator<IStorage>(),
      logger,
      // walletsCubit,
    );

    final walletsCubit = WalletsCubit(
      locator<IStorage>(),
      logger,
      networkSelectCubit,
      locator<IClipBoard>(),
    );

    final nodeAddressCubit = NodeAddressCubit(
      locator<IStorage>(),
    );

    final feesCubit =
        FeesCubit(locator<IStorage>(), networkSelectCubit, nodeAddressCubit);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: networkSelectCubit),
        BlocProvider.value(value: logger),
        BlocProvider.value(value: walletsCubit),
        BlocProvider.value(value: feesCubit),
        BlocProvider.value(value: nodeAddressCubit),
      ],
      child: BlocListener<ChainSelectCubit, BlockchainState>(
        listener: (context, state) {
          walletsCubit.refresh();
        },
        child: widget.child,
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  void prettyPrint(String input) {
    String str = input.replaceAll(', ', ',\n    ');
    str = str.replaceAll('(', '(\n    ');
    str = str.replaceAll(')', '\n)');
    str = '\n' + str.replaceAll('),', '  ),') + '\n\n';

    print(str);
  }

  // @override
  // void onEvent(Bloc bloc, Object? event) {
  //   // print('Event { ' + event.toString() + ' }');

  //   super.onEvent(bloc, event);
  // }

  @override
  void onChange(BlocBase bloc, Change change) {
    try {
      // print('\n' + change.currentState.runtimeType.toString() + ' changed\n');
      // prettyPrint(change.nextState.toString());
    } catch (e) {
      print('STATE ERROR: ' + e.toString());
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  // }
}
