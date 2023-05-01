import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/ui/cubits.dart';
import 'package:sats/ui/screen/AddWallet.dart';
import 'package:sats/ui/screen/BackupWallet.dart';
import 'package:sats/ui/screen/Broadcast.dart';
import 'package:sats/ui/screen/Landing.dart';
import 'package:sats/ui/screen/Logs.dart';
import 'package:sats/ui/screen/NewWallet/Derive.dart';
import 'package:sats/ui/screen/NewWallet/SeedGenerate.dart';
import 'package:sats/ui/screen/NewWallet/SeedImport.dart';
import 'package:sats/ui/screen/NewWallet/XpubColdcard.dart';
import 'package:sats/ui/screen/NewWallet/XpubImport.dart';
import 'package:sats/ui/screen/Receive.dart';
import 'package:sats/ui/screen/Send.dart';
import 'package:sats/ui/screen/Settings.dart';
import 'package:sats/ui/screen/TorConfig.dart';
import 'package:sats/ui/screen/WalletSingle.dart';
import 'package:sats/ui/screen/WalletsHome.dart';
import 'package:sats/ui/style.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  await initializeHive();
  setupDependencies(useDummies: false);
  await openDatabase('stackmate.db');
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  runZonedGuarded(
    () => runApp(Stackmate()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class Stackmate extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Cubits(
      child: OKToast(
        duration: const Duration(milliseconds: 2000),
        position: ToastPosition.bottom,
        textStyle: c.fonts.bodySmall!.copyWith(color: c.colours.onBackground),
        child: MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQueryData.copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          theme: derivedTheme(mainTheme()),
        ),
      ),
    );
  }

  late final _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const LandingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (_, __) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/add-wallet',
        builder: (_, __) => const AddWalletScreen(),
      ),
      GoRoute(
        path: '/broadcast',
        builder: (_, __) => const BroadcastScreen(),
      ),
      GoRoute(
        path: '/backup-master',
        builder: (_, __) => const BackupWalletScreen(),
      ),
      GoRoute(
        path: '/tor-config',
        builder: (_, __) => const TorConfigScreen(),
      ),
      GoRoute(
        path: '/generate-seed',
        builder: (_, __) => const SeedGenerateScreen(),
      ),
      GoRoute(
        path: '/import-seed',
        builder: (_, __) => const SeedImportScreen(),
      ),
      GoRoute(
        path: '/derive-account',
        builder: (_, __) => const DeriveScreen(),
      ),
      GoRoute(
        path: '/watch-only',
        builder: (_, __) => const XPubImportScreen(),
      ),
      GoRoute(
        path: '/coldcard',
        builder: (_, __) => const XPubColdcardScreen(),
      ),
      GoRoute(
        path: '/wallet',
        builder: (_, state) =>
            WalletScreen(infoCubit: state.extra! as InfoCubit),
      ),
      GoRoute(
        path: '/receive',
        builder: (context, state) =>
            ReceiveScreen(wallet: state.extra! as Wallet),
      ),
      GoRoute(
        path: '/send',
        builder: (_, state) => WalletSendScreen(
          fromQr: false,
          wallet: state.extra! as Wallet,
        ),
      ),
      GoRoute(
        path: '/send-from-qr',
        builder: (_, state) => WalletSendScreen(
          fromQr: true,
          wallet: state.extra! as Wallet,
        ),
      ),
      GoRoute(
        path: '/logs',
        builder: (_, __) => const LogsScreen(),
      ),
    ],
    errorBuilder: (context, state) => Container(color: Colors.red),
  );
}
