import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sats/cubit/address-book.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/clipboard.dart';
import 'package:sats/pkg/storage.dart';
// import 'package:sats/pkg/vibrate.dart';

class Cubits extends StatelessWidget {
  const Cubits({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final logger = locator<LoggerCubit>();

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

    final addressBookCubit = AddressBookCubit(
      locator<IStorage>(),
      logger,
      // locator<IVibrate>(),
      locator<IClipBoard>(),
    );

    final nodeAddressCubit = NodeAddressCubit(
      locator<IStorage>(),
      logger,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: networkSelectCubit),
        BlocProvider.value(value: logger),
        BlocProvider.value(value: walletsCubit),
        BlocProvider.value(value: addressBookCubit),
        BlocProvider.value(value: nodeAddressCubit),
      ],
      child: BlocListener<ChainSelectCubit, BlockchainState>(
        listener: (context, state) {
          walletsCubit.refresh();
        },
        child: child,
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
