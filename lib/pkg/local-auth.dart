// import 'package:local_auth/local_auth.dart';

abstract class ILocalAuth {
  Future<bool> authenticate();
  Future stopAuth();
}

class LocalAuth implements ILocalAuth {
  // final localAuth = LocalAuthentication();

  @override
  Future<bool> authenticate() async {
    // try {
    //   // final canCheckBiometrics = await localAuth.canCheckBiometrics;

    //   final didAuthenticate = await localAuth.authenticate(
    //     localizedReason: 'Please authenticate to view wallets',
    //   );

    //   return didAuthenticate;
    // } catch (e) {
    //   print(e.toString());
    //   return false;
    // }
    return false;
  }

  @override
  Future stopAuth() async {
    // localAuth.stopAuthentication();
  }
}
