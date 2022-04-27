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
    @HiveField(2) required bool verified,
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
    // String date = '';
    final t = timestamp;
    final dt = DateTime.fromMillisecondsSinceEpoch(
      t * 1000,
      // isUtc: true,
    ).toString();
    return dt;
    //date += DateFormat.EEEE().format(dt) + ', ';

    // date += dt.day.toString() +
    //     '-' +
    //     dt.month.toString() +
    //     '-' +
    //     dt.year.toString() +
    //     ' ';

    // date += dt.hour.toString() + ':' + dt.minute.toString() + ' ';

    // date += dt.hour < 12 ? 'AM' : 'PM';

    // date += ' GMT';

    // return date;
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
