import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/ui/cubits.dart';
import 'package:sats/ui/screen/AddWallet.dart';
import 'package:sats/ui/screen/Calculator.dart';
import 'package:sats/ui/screen/Home.dart';
import 'package:sats/ui/screen/Logs.dart';
import 'package:sats/ui/screen/NewWallet/SeedGenerate.dart';
import 'package:sats/ui/screen/NewWallet/SeedImport.dart';
import 'package:sats/ui/screen/NewWallet/XpubImport.dart';
import 'package:sats/ui/screen/PSBT.dart';
import 'package:sats/ui/screen/Receive.dart';
import 'package:sats/ui/screen/Send.dart';
import 'package:sats/ui/screen/Settings.dart';
import 'package:sats/ui/screen/Wallet.dart';
import 'package:sats/ui/style.dart';
import 'package:sats/api/local-auth.dart';

void main() async {
  await initializeHive();
  setupDependencies(useDummies: false);

  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  runZonedGuarded(
    () => runApp(MaterialApp(home: LoginPage())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text('Tap on the button to authenticate ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                  )),
              const SizedBox(height: 30),
              SizedBox(
                //width: MediaQuery.of(context).size,
                child: TextButton(
                  onPressed: () async {
                    bool isAuthenticated = await AuthService.authenticateUser();
                    if (isAuthenticated) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Stackmate()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Authentication failed.'),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    //shadowColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'UNLOCK WITH BIOMETRICS',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
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
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/calc',
        builder: (_, __) => const CalculatorScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (_, __) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/network',
        builder: (_, __) => Container(),
      ),
      GoRoute(
        path: '/add-wallet',
        builder: (_, __) => const AddWalletScreen(),
      ),
      GoRoute(
        path: '/psbt-tools',
        builder: (_, __) => const PSBTScreen(),
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
        path: '/watch-only',
        builder: (_, __) => const XPubImportScreen(),
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
