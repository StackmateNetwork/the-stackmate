import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        page = const HomeScreen();
        break;
      case Routes.addWallet:
        page = const AddWalletScreen();
        break;
      case generateSeed:
        page = const SeedGenerateScreen();
        break;
      case importSeed:
        page = const SeedImportScreen();
        break;
      case watchOnly:
        page = const XPubImportScreen();
        break;
      case inheritanceNewSeed:
        page = const InheritanceNewSeedScreen();
        break;
      case inheritanceOldSeed:
        page = const InheritanceOldSeedScreen();
        break;
      case calc:
        page = const CalculatorScreen();
        break;
      case setting:
        page = const SettingsPage();
        break;
      case logs:
        page = const LogsScreen();
        break;
      case wallet:
        page = const WalletScreen();
        break;
      case receive:
        page = const ReceiveScreen();
        break;
      case send:
        page = const WalletSendScreen(fromQr: false);
        break;
      case sendFromQR:
        page = const WalletSendScreen(fromQr: true);
        break;
      case qr:
        page = const QRScreen();
        break;
      case addressBook:
        page = const AddressBookScreen();
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
