import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Location of a wallet's database. The wallet engine stores its data next
/// to it (see [bdkDbPath]), so the name must stay stable for a wallet.
Future<String> walletDbPath(String label, String uid) async =>
    join(await getDatabasesPath(), '$label$uid.db');

/// BDK keeps its own sqlite schema, separate from the legacy stackmate-core
/// database at [dbPath]; chain data is re-synced into it.
String bdkDbPath(String dbPath) => '$dbPath.bdk';

/// Removes every database file kept for a wallet.
Future<void> deleteWalletDb(String label, String uid) async {
  final dbPath = await walletDbPath(label, uid);
  await deleteDatabase(dbPath);
  final bdk = bdkDbPath(dbPath);
  for (final path in [bdk, '$bdk-wal', '$bdk-shm', '$bdk-journal']) {
    final file = File(path);
    if (file.existsSync()) await file.delete();
  }
}
