import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/rates.dart';
import 'package:sats/api/reddit.dart';
import 'package:sats/cubit/_state.dart';
import 'package:sats/cubit/calculator.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/cubit/new-wallet/inheritance-with-new-seed.dart';
import 'package:sats/cubit/new-wallet/inheritance-with-old-seed.dart';
import 'package:sats/cubit/reddit.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/cubit/wallet/wallet.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/clipboard.dart';
import 'package:sats/pkg/core.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/launcher.dart';
import 'package:sats/pkg/share.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/vibrate.dart';
import 'package:sats/ui/screen/AddWallet.dart';
import 'package:sats/ui/screen/AddressBook.dart';
import 'package:sats/ui/screen/Calculator.dart';
import 'package:sats/ui/screen/Home.dart';
import 'package:sats/ui/screen/Logs.dart';
import 'package:sats/ui/screen/NewWallet/NewSeedInheritance.dart';
import 'package:sats/ui/screen/NewWallet/OldSeedInheritance.dart';
import 'package:sats/ui/screen/NewWallet/SeedGenerate.dart';
import 'package:sats/ui/screen/NewWallet/SeedImport.dart';
import 'package:sats/ui/screen/NewWallet/XpubImport.dart';
import 'package:sats/ui/screen/Qr.dart';
import 'package:sats/ui/screen/Settings.dart';
import 'package:sats/ui/screen/Wallet.dart';
import 'package:sats/ui/screen/WalletReceive.dart';
import 'package:sats/ui/screen/WalletSend.dart';

class Routes {
  static const home = '/';
  static const addWallet = 'add-wallet';
  static const calc = 'calc';
  static const setting = 'settings';
  static const logs = 'logs';
  static const wallet = 'wallet';
  static const receive = 'receive';
  static const send = 'send';
  static const sendFromQR = 'send-from-qr';
  static const qr = 'qr';
  static const addressBook = 'address-book';

  static const generateSeed = 'generate-seed';
  static const importSeed = 'import-seed';
  static const watchOnly = 'watch-only';
  static const inheritanceNewSeed = 'inheritance-new-seed';
  static const inheritanceOldSeed = 'inheritance-old-seed';

  static GoRouter setupRouter() {
    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/family/:fid',
          builder: (context, state) {
            // state.extra
            return Container();
          },
          // pageBuilder: (context, state) {
          //   return CustomTransitionPage(child: Container());
          // },
        ),
      ],

      // navigatorBuilder:
    );
    return _router;
  }

  static Route<dynamic>? setupRoutes(RouteSettings settings, BuildContext c) {
    late Widget page;

    switch (settings.name) {
      case home:
        final redditBloc = RedditCubit(
          locator<IRedditAPI>(),
          loggerCubit,
          locator<ILauncher>(),
        );

        page = BlocProvider.value(
          value: redditBloc,
          child: NewHomePage(),
        );

        break;

      case Routes.addWallet:
        page = const AddWalletPage();
        break;

      case generateSeed:
        final seedGenerateCubit = SeedGenerateCubit(
          locator<IStackMateCore>(),
          networkSelectCubit,
          loggerCubit,
        );

        final seedGenerateWalletCubit = SeedGenerateWalletCubit(
          locator<IStackMateCore>(),
          locator<IStorage>(),
          loggerCubit,
          walletsCubit,
          networkSelectCubit,
          seedGenerateCubit,
        );

        page = MultiBlocProvider(
          providers: [
            BlocProvider.value(value: seedGenerateCubit),
            BlocProvider.value(value: seedGenerateWalletCubit),
          ],
          child: SeedGeneratePage(),
        );
        break;

      case importSeed:
        final importCubit = SeedImportCubit(
          loggerCubit,
          networkSelectCubit,
          locator<IStackMateCore>(),
        );

        final seedImportCubit = SeedImportWalletCubit(
          locator<IStackMateCore>(),
          locator<IStorage>(),
          walletsCubit,
          networkSelectCubit,
          loggerCubit,
          importCubit,
        );

        page = MultiBlocProvider(
          providers: [
            BlocProvider.value(value: importCubit),
            BlocProvider.value(value: seedImportCubit),
          ],
          child: SeedImportPage(),
        );
        break;

      case watchOnly:
        final xpubCub = XpubImportCubit(
          loggerCubit,
          locator<IClipBoard>(),
        );
        final xpubCubit = XpubImportWalletCubit(
          locator<IStackMateCore>(),
          loggerCubit,
          locator<IStorage>(),
          walletsCubit,
          networkSelectCubit,
          xpubCub,
        );

        page = MultiBlocProvider(
          providers: [
            BlocProvider.value(value: xpubCub),
            BlocProvider.value(value: xpubCubit),
          ],
          child: XpubImportPage(),
        );
        break;

      case inheritanceNewSeed:
        final seedGenerateCubit = SeedGenerateCubit(
          locator<IStackMateCore>(),
          networkSelectCubit,
          loggerCubit,
        );

        final xpubCub = XpubImportCubit(
          loggerCubit,
          locator<IClipBoard>(),
        );

        final inheritance = InteritanceWithNewSeedCubit(
          locator<IStackMateCore>(),
          locator<IStorage>(),
          loggerCubit,
          walletsCubit,
          networkSelectCubit,
          seedGenerateCubit,
          xpubCub,
          nodeAddressCubit,
        );

        page = MultiBlocProvider(
          providers: [
            BlocProvider.value(value: seedGenerateCubit),
            BlocProvider.value(value: xpubCub),
            BlocProvider.value(value: inheritance),
          ],
          child: const InheritanceNewSeedPage(),
        );

        break;

      case inheritanceOldSeed:
        final seedImportCubit = SeedImportCubit(
          loggerCubit,
          networkSelectCubit,
          locator<IStackMateCore>(),
        );

        final xpubCub = XpubImportCubit(
          loggerCubit,
          locator<IClipBoard>(),
        );

        final inheritance = InheritanceWithOldSeedCubit(
          locator<IStackMateCore>(),
          locator<IStorage>(),
          loggerCubit,
          walletsCubit,
          networkSelectCubit,
          seedImportCubit,
          xpubCub,
          nodeAddressCubit,
        );

        page = MultiBlocProvider(
          providers: [
            BlocProvider.value(value: seedImportCubit),
            BlocProvider.value(value: xpubCub),
            BlocProvider.value(value: inheritance),
          ],
          child: const InheritanceOldSeedPage(),
        );

        break;

      case calc:
        final calcCubit = CalculatorCubit(
          loggerCubit,
          locator<IVibrate>(),
          locator<IRatesAPI>(),
        );

        page = BlocProvider.value(
          value: calcCubit,
          child: const CalcPage(),
        );
        break;

      case setting:
        page = const SettingsPage();
        break;

      case logs:
        page = BlocProvider.value(
          value: loggerCubit,
          child: LogsPage(),
        );

        break;

      case wallet:
        final history = WalletCubit(
          walletsCubit,
          locator<IStorage>(),
          loggerCubit,
          locator<ILauncher>(),
          locator<IShare>(),
          locator<IVibrate>(),
          nodeAddressCubit,
          networkSelectCubit,
        );

        page = BlocProvider.value(
          value: history,
          child: const WalletPage(),
        );

        break;

      case receive:
        final r = ReceiveCubit(
          walletsCubit,
          networkSelectCubit,
          loggerCubit,
          locator<IClipBoard>(),
          locator<IShare>(),
          locator<IVibrate>(),
          nodeAddressCubit,
        );

        page = BlocProvider.value(
          value: r,
          child: const ReceivePage(),
        );
        break;

      case send:
        final s = SendCubit(
          false,
          walletsCubit,
          networkSelectCubit,
          loggerCubit,
          locator<IClipBoard>(),
          locator<IShare>(),
          nodeAddressCubit,
          locator<IStackMateCore>(),
        );

        page = BlocProvider.value(
          value: s,
          child: const WalletSendPage(),
        );

        break;

      case sendFromQR:
        final s = SendCubit(
          true,
          walletsCubit,
          networkSelectCubit,
          loggerCubit,
          locator<IClipBoard>(),
          locator<IShare>(),
          nodeAddressCubit,
          locator<IStackMateCore>(),
        );

        page = BlocProvider.value(
          value: s,
          child: const WalletSendPage(),
        );

        break;

      case qr:
        page = const QRPage();
        break;

      case addressBook:
        page = const AddressBookPage();
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (_, anim, anim2, child) {
        return FadeThroughTransition(
          fillColor: Colors.transparent,
          animation: anim,
          secondaryAnimation: anim2,
          child: child,
        );
      },
    );
  }
}

final homeNavigator = GlobalKey<NavigatorState>();
