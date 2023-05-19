import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sats/model/result.dart';

enum StorageKeys {
  securityKey('securityKey');

  const StorageKeys(this.name);
  final String name;
}

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<R<void>> saveValue({
    required StorageKeys key,
    required String value,
  }) async {
    try {
      await storage.write(
        key: key.name,
        value: value,
      );
      // ignore: void_checks
      return const R(result: true);
    } catch (e) {
      return R(
        error: e.toString(),
      );
    }
  }

  Future<R<String>> getValue(
    StorageKeys key,
  ) async {
    try {
      final value = await storage.read(
        key: key.name,
      );

      if (value == null) throw 'No Key';

      return R(result: value);
    } catch (e) {
      return R(
        error: e.toString(),
      );
    }
  }
}
