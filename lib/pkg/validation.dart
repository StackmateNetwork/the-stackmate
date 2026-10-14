class Validation {
  static String formatSatsString(String amt) {
    return amt.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]} ',
    );
  }

  static String formatHardenedPath(String value) {
    return value.replaceAll("'", 'h');
  }

  static String fingerPrintFromXKey(String xkey) {
    final startIndex = xkey.indexOf('[');
    final fingerPrintEndIndex = xkey.indexOf('/');
    return xkey.substring(startIndex + 1, fingerPrintEndIndex);
  }
}
