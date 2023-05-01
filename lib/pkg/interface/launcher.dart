import 'package:sats/model/result.dart';

abstract class ILauncher {
  Future<R<bool>> canLaunchApp(String link);
  Future<R<bool>> launchApp(String link);
  Future<R<bool>> openInAppStore(String link);
  Future<R<bool>> sentSupportEmail(String loggedInEmail, String name);
  // Future<R<bool>> openEmailInbox();
}
