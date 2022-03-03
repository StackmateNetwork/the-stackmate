import 'package:get_it/get_it.dart';
import 'package:sats/api/coincap.dart';
import 'package:sats/api/interface/coincap.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/api/interface/reddit.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/api/logger.dart';
import 'package:sats/api/reddit.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/pkg/clipboard.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/pkg/launcher.dart';
import 'package:sats/pkg/share.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/vibrate.dart';

GetIt locator = GetIt.instance;

void setupDependencies({required bool useDummies}) {
  if (useDummies) {
    locator.registerLazySingleton<IStorage>(() => HiveStore());
    locator.registerLazySingleton<IClipBoard>(() => ClipBoardd());
    locator.registerLazySingleton<IShare>(() => Sharer());
    locator.registerSingleton<ILauncher>(Launcher());
    locator.registerLazySingleton<IRedditAPI>(() => RedditAPI());
    locator.registerLazySingleton<IVibrate>(() => Vibrate());
    locator.registerLazySingleton<IStackMateCore>(() => BitcoinFFI());
    locator.registerLazySingleton<ILogAPI>(() => DummyLogAPI());
  } else {
    locator.registerLazySingleton<IShare>(() => Sharer());
    locator.registerLazySingleton<ILauncher>(() => Launcher());
    locator.registerLazySingleton<IRedditAPI>(() => RedditAPI());
    locator.registerLazySingleton<IClipBoard>(() => ClipBoardd());
    locator.registerLazySingleton<IStorage>(() => HiveStore());
    locator.registerLazySingleton<IStackMateCore>(() => BitcoinFFI());
    locator.registerLazySingleton<IVibrate>(() => Vibrate());
    locator.registerLazySingleton<IRatesAPI>(() => RatesAPI());
    locator.registerLazySingleton<ILogAPI>(() => SentryLogger());
  }

  final loggerCubit = LoggerCubit(
    locator<IClipBoard>(),
    locator<ILogAPI>(),
  );

  locator.registerLazySingleton<LoggerCubit>(() => loggerCubit);
}
