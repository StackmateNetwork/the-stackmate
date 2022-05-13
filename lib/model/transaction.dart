import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';
part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction {
  @HiveType(typeId: 3, adapterName: 'TransactionClassAdapter')
  const factory Transaction({
    @HiveField(0) required int timestamp,
    @HiveField(1) required int height,
    // ignore: non_constant_identifier_names
    @HiveField(2) required int confirmation_time,
    @HiveField(3) required String txid,
    @HiveField(4) required int received,
    @HiveField(5) required int sent,
    @HiveField(6) required int fee,
  }) = _Transaction;
  const Transaction._();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  bool isReceive() => sent == 0;

  String timeStr() {
    if (timestamp == 0) return '';
    final t = timestamp;
    final dt = DateTime.fromMillisecondsSinceEpoch(
      t * 1000,
    ).toString();
    return dt;
  }

  String amountToBtc() =>
      ((isReceive() ? received : sent) / 100000000).toStringAsFixed(8);
  String feesToBtc() => (fee / 100000000).toStringAsFixed(8);

  String txIdBlur() {
    return '****' + txid.substring(txid.length - 3, txid.length);
  }

  String link() {
    String url = '';
    if (txid.startsWith('2') ||
        txid.startsWith('m') ||
        txid.startsWith('n') ||
        txid.startsWith('tb'))
      url = 'https://blockstream.info/testnet/tx/';
    else
      url = 'https://blockstream.info/tx/';
    url += txid;
    return url;
  }
}
