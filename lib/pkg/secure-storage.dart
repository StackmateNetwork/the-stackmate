import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sats/model/result.dart';

abstract class SStorage {
  Future<R> saveValue({
    required String key,
    required String value,
  });

  Future<R<String>> getValue(
    String key,
  );
}

class SecureStorage implements SStorage {
  final storage = const FlutterSecureStorage();

  @override
  Future<R> saveValue({required String key, required String value}) async {
    try {
      await storage.write(
        key: key,
        value: value,
      );
      return const R();
    } catch (e) {
      return R(error: e.toString());
    }
  }

  @override
  Future<R<String>> getValue(String key) async {
    try {
      final value = await storage.read(
        key: key,
      );

      if (value == null) throw 'No Key';

      return R(result: value);
    } catch (e) {
      return R(error: e.toString());
    }
  }
}
