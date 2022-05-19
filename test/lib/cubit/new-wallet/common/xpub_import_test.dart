import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:test/test.dart';

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

void main() {
  group('xpubImport: CORE OPS', () {
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);

    late XpubImportCubit xpubImportCubit;
    const testXpub =
        'tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41';
    const fingerprint = '8099ce1e';
    const hardendedPath = 'm/84h/1h/0h';

    const fullTestXpub =
        '[8099ce1e/84h/1h/0h]tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41';
    setUp(() async {
      xpubImportCubit = XpubImportCubit(logger, clipboard);
    });

    tearDown(() {});
    blocTest<XpubImportCubit, XpubImportState>(
      'Import Xpub Flow (as full extended key)',
      build: () {
        return xpubImportCubit;
      },
      act: (cubit) async {
        cubit.xpubChanged(fullTestXpub);
        cubit.checkDetails();
      },
      expect: () => <XpubImportState>[
        const XpubImportState(xpub: fullTestXpub),
        const XpubImportState(xpub: fullTestXpub, detailsReady: true),
      ],
      verify: (cubit) => [],
    );
    blocTest<XpubImportCubit, XpubImportState>(
      'Import Xpub Flow (as parts)',
      build: () {
        return xpubImportCubit;
      },
      act: (cubit) async {
        cubit.xpubChanged(testXpub);
        cubit.fingerPrintChanged(fingerprint);
        cubit.pathChanged(hardendedPath);
        cubit.checkDetails();
      },
      expect: () => <XpubImportState>[
        const XpubImportState(xpub: testXpub),
        const XpubImportState(
          xpub: testXpub,
          fingerPrint: fingerprint,
        ),
        const XpubImportState(
          xpub: testXpub,
          fingerPrint: fingerprint,
          path: hardendedPath,
        ),
        const XpubImportState(
          xpub: testXpub,
          fingerPrint: fingerprint,
          path: hardendedPath,
          detailsReady: true,
        ),
      ],
    );

    blocTest<XpubImportCubit, XpubImportState>(
      'Error States',
      build: () {
        return xpubImportCubit;
      },
      act: (cubit) async {
        cubit.xpubChanged(testXpub);
        cubit.pathChanged(hardendedPath);
        cubit.checkDetails();
      },
      expect: () => <XpubImportState>[
        const XpubImportState(xpub: testXpub),
        const XpubImportState(
          xpub: testXpub,
          path: hardendedPath,
        ),
        const XpubImportState(
          xpub: testXpub,
          path: hardendedPath,
          errXpub: invalidFingerprintError,
        ),
      ],
    );

    blocTest<XpubImportCubit, XpubImportState>(
      'Clear Xpub Import State',
      build: () {
        return xpubImportCubit;
      },
      act: (cubit) async {
        cubit.clear();
      },
      expect: () => <XpubImportState>[
        const XpubImportState(),
      ],
      verify: (cubit) => [],
    );
  });
}
