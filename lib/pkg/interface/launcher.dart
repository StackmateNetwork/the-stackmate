abstract class ILauncher {
  Future<bool> canLaunchApp(String link);
  Future launchApp(String link);
  Future openInAppStore(String link);
  Future sentSupportEmail(String loggedInEmail, String name);
  Future openEmailInbox();
}
