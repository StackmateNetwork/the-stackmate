import 'package:hive/src/hive_impl.dart';
import 'package:test/test.dart';
import 'hive_common.dart';

void main() {
  Future<HiveImpl> initHive() async {
    final tempDir = await getTempDir();
    final hive = HiveImpl();
    hive.init(tempDir.path);
    return hive;
  }

  test('returns false if no box was created', () async {
    final hive = await initHive();
    final box = await hive.openBox('testBox');
    await box.put('key', 'value');
    expect(box.get('key'), 'value');
    await hive.close();
  });
}
