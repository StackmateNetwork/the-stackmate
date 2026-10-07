abstract class IQrScanner {
  /// Opens the camera and returns the decoded QR payload, or an empty
  /// string if the user cancelled.
  Future<String> scan();
}
