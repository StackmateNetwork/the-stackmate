import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ILauncher {
  Future<bool> canLaunchApp(String link);
  Future launchApp(String link);
  Future openInAppStore(String link);
  Future sentSupportEmail(String loggedInEmail, String name);
  Future openEmailInbox();
}

class Launcher implements ILauncher {
  @override
  Future<bool> canLaunchApp(String link) async {
    final c = await canLaunch(link);
    return c;
  }

  @override
  Future launchApp(String link) async {
    final can = await canLaunch(link);
    if (can)
      await launch(
        link,
        // forceWebView: true
        // universalLinksOnly: true,
      );
  }

  @override
  Future openInAppStore(String link) {
    throw Exception();
  }

  @override
  Future sentSupportEmail(String loggedInEmail, String name) {
    throw UnimplementedError();
  }

  @override
  Future openEmailInbox() async {
    final result = await OpenMailApp.openMailApp();
    if (!result.didOpen && !result.canOpen) {
      throw 'didnt open';
    }
  }
}

class DummyLauncher implements ILauncher {
  @override
  Future<bool> canLaunchApp(String link) {
    //  implement canLaunchApp
    throw Exception();
  }

  @override
  Future launchApp(String link) {
    //  implement launchApp
    throw Exception();
  }

  @override
  Future openInAppStore(String link) {
    throw Exception();
  }

  @override
  Future sentSupportEmail(String loggedInEmail, String name) {
    throw UnimplementedError();
  }

  @override
  Future openEmailInbox() {
    throw UnimplementedError();
  }
}
