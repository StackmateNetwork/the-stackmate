import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/ui/cubits.dart';
import 'package:sats/ui/screen/AddWallet.dart';
import 'package:sats/ui/screen/BackupWallet.dart';
import 'package:sats/ui/screen/Broadcast.dart';
import 'package:sats/ui/screen/Home.dart';
import 'package:sats/ui/screen/Landing.dart';
import 'package:sats/ui/screen/Logs.dart';
import 'package:sats/ui/screen/Messages.dart';
import 'package:sats/ui/screen/MyIdentity.dart';
import 'package:sats/ui/screen/Network.dart';
import 'package:sats/ui/screen/NewWallet/MasterKeyDerive.dart';
import 'package:sats/ui/screen/NewWallet/SeedGenerate.dart';
import 'package:sats/ui/screen/NewWallet/SeedImport.dart';
import 'package:sats/ui/screen/NewWallet/XpubColdcard.dart';
import 'package:sats/ui/screen/NewWallet/XpubImport.dart';
import 'package:sats/ui/screen/Peers.dart';
import 'package:sats/ui/screen/Receive.dart';
import 'package:sats/ui/screen/Send.dart';
import 'package:sats/ui/screen/Settings.dart';
import 'package:sats/ui/screen/TorConfig.dart';
import 'package:sats/ui/screen/Contracts.dart';
import 'package:sats/ui/screen/Wallet.dart';
import 'package:sats/ui/style.dart';

void main() async {
  await initializeHive();
  setupDependencies(useDummies: false);

  WidgetsFlutterBinding.ensureInitialized();
  // final p = ReceivePort();

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
        textStyle: c.fonts.caption!.copyWith(color: c.colours.onBackground),
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
        path: '/network',
        builder: (_, __) => const NetworkHomeScreen(),
      ),
      GoRoute(
        path: '/my-identity',
        builder: (_, __) => const MyIdentityScreen(),
      ),
      GoRoute(
        path: '/peers',
        builder: (_, __) => const PeersScreen(),
      ),
      GoRoute(
        path: '/contracts',
        builder: (_, __) => const ContractsScreen(),
      ),
      GoRoute(
        path: '/messages',
        builder: (_, __) => const MessagesScreen(),
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
        builder: (_, __) => const MasterDeriveScreen(),
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
        builder: (_, __) => const WalletScreen(),
      ),
      GoRoute(
        path: '/receive',
        builder: (_, __) => const ReceiveScreen(),
      ),
      GoRoute(
        path: '/send',
        builder: (_, __) => const WalletSendScreen(
          fromQr: false,
        ),
      ),
      GoRoute(
        path: '/send-from-qr',
        builder: (_, __) => const WalletSendScreen(
          fromQr: true,
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
