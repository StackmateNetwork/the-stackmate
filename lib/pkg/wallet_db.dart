import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Location of a wallet's database. The wallet engine stores its data next
/// to it (see `LibBitcoin`), so the name must stay stable for a wallet.
Future<String> walletDbPath(String label, String uid) async =>
    join(await getDatabasesPath(), '$label$uid.db');
