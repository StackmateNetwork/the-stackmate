import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sats/cubit/_state.dart';
import 'package:sats/routes.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/ui/screen/AddWallet.dart';
import 'package:sats/ui/screen/Calculator.dart';
import 'package:sats/ui/screen/Home.dart';
import 'package:sats/ui/screen/Logs.dart';
import 'package:sats/ui/screen/NewWallet/NewSeedInheritance.dart';
import 'package:sats/ui/screen/NewWallet/OldSeedInheritance.dart';
import 'package:sats/ui/screen/NewWallet/SeedGenerate.dart';
import 'package:sats/ui/screen/NewWallet/SeedImport.dart';
import 'package:sats/ui/screen/NewWallet/XpubImport.dart';
import 'package:sats/ui/screen/Qr.dart';
import 'package:sats/ui/screen/Receive.dart';
import 'package:sats/ui/screen/Send.dart';
import 'package:sats/ui/screen/Settings.dart';
import 'package:sats/ui/screen/Wallet.dart';
import 'package:sats/ui/style.dart';

void main() async {
  await initializeHive();
  setupDependencies(useDummies: false);

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

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
    return Cubits(
      child: OKToast(
        duration: const Duration(milliseconds: 2000),
        position: ToastPosition.bottom,
        textStyle: c.fonts.caption!.copyWith(color: c.colours.onBackground),
        child: MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
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
    redirect: (state) {
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
      //
      GoRoute(path: '/qr', builder: (_, __) => const QRScreen()),
      GoRoute(path: '/calc', builder: (_, __) => const CalculatorScreen()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
      GoRoute(path: '/network', builder: (_, __) => Container()),
      //
      GoRoute(path: '/add-wallet', builder: (_, __) => const AddWalletScreen()),
      GoRoute(path: '/generate-seed', builder: (_, __) => const SeedGenerateScreen()),
      GoRoute(path: '/import-seed', builder: (_, __) => const SeedImportScreen()),
      GoRoute(path: '/watch-only', builder: (_, __) => const XPubImportScreen()),
      GoRoute(path: '/inheritance-new-seed', builder: (_, __) => const InheritanceNewSeedScreen()),
      GoRoute(path: '/inheritance-old-seed', builder: (_, __) => const InheritanceOldSeedScreen()),
      //
      GoRoute(path: '/wallet', builder: (_, __) => const WalletScreen()),
      GoRoute(path: '/receive', builder: (_, __) => const ReceiveScreen()),
      GoRoute(path: '/send', builder: (_, __) => const WalletSendScreen(fromQr: false)),
      GoRoute(path: '/send', builder: (_, __) => const WalletSendScreen(fromQr: true)),
      //
      GoRoute(path: '/logs', builder: (_, __) => const LogsScreen()),
    ],
  );
}

// return PageRouteBuilder(
//     pageBuilder: (_, __, ___) => page,
//     transitionDuration: const Duration(milliseconds: 400),
//     transitionsBuilder: (_, anim, anim2, child) {
//       return FadeThroughTransition(
//         fillColor: Colors.transparent,
//         animation: anim,
//         secondaryAnimation: anim2,
//         child: child,
//       );
//     },
//   // )
