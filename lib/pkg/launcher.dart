import 'package:sats/cubit/logger.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher implements ILauncher {
  @override
  Future<R<bool>> canLaunchApp(String link) async {
    try {
      final c = await canLaunchUrl(Uri.parse(link));
      return R(result: c);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<bool>> launchApp(String link) async {
    try {
      final can = await canLaunchUrl(Uri.parse(link));
      if (can)
        await launchUrl(
          Uri.parse(link),
          // forceWebView: true
          // universalLinksOnly: true,
        );
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<bool>> openInAppStore(String link) async {
    try {
      throw Exception();
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<bool>> sentSupportEmail(String loggedInEmail, String name) async {
    try {
      throw UnimplementedError();
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  // @override
  // Future<R<bool>> openEmailInbox() async {
  //   try {
  //     final result = await OpenMailApp.openMailApp();
  //     if (!result.didOpen && !result.canOpen) {
  //       throw 'didnt open';
  //     }
  //     return const R(result: true);
  //   } catch (e, s) {
  //     locator<Logger>().logException(e, '', s);
  //     return R(error: e.toString());
  //   }
  // }
}
