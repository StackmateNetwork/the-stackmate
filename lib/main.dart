import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sats/cubit/_state.dart';
import 'package:sats/routes.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/style.dart';

void main() async {
  await initializeHive();
  setupDependencies(useDummies: false);

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  runZonedGuarded(
    () => runApp(const Stackmate()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class Stackmate extends StatelessWidget {
  const Stackmate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Cubits(
      child: OKToast(
        duration: const Duration(milliseconds: 2000),
        position: ToastPosition.bottom,
        textStyle: c.fonts.caption!.copyWith(color: c.colours.onBackground),
        child: MaterialApp(
          // locale: null,
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
          navigatorKey: homeNavigator,
          debugShowCheckedModeBanner: false,
          theme: derivedTheme(mainTheme()),
          onGenerateRoute: (settings) => Routes.setupRoutes(settings, c),
        ),
      ),
    );
  }
}
