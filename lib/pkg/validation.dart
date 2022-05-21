class Validation {
  static bool isNumeric(String s) {
    try {
      double.parse(s);
      return true;
    } catch (e) {
      //logger.addExpectionToLog(e, 'Validation.isNumeric', s);
    }
    return false;
    // return double.parse(s) != null;
  }

  static bool isEmail(String email) {
    final emailCheck = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );

    if (email != '') {
      if (emailCheck.hasMatch(email)) return true;
    }
    return false;
  }

  static bool isBtcAddress(String address) {
    if (address.startsWith('1') ||
            address.startsWith('3') ||
            address.startsWith('bc1') ||
            address.startsWith('2') ||
            address.startsWith('m') ||
            address.startsWith('n') ||
            address.startsWith('tb')
        // &&
        // address.length >= 25 &&
        // address.length <= 35

        ) return true;

    return false;
  }

  static String toBtc(int sats) {
    final btc = (sats / 100000000).toStringAsFixed(8);
    return btc;
  }

  static String formatSatsString(String amt) {
    // var str = amt.replaceAll(',', '');
    // str = str.replaceAll(r'(\\d)(?=(\\d{3})+$)', str);
    // print('---amt: $str');
    return amt.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]} ',
    );
  }

  static String removeSatsFormat(String amt) {
    return amt.replaceAll(' ', '');
  }

  static bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }
}
