// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionClassAdapter extends TypeAdapter<_Transaction> {
  @override
  final typeId = 6;

  @override
  _Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _Transaction(
      timestamp: (fields[0] as num).toInt(),
      height: (fields[1] as num).toInt(),
      txid: fields[2] as String,
      received: (fields[3] as num).toInt(),
      sent: (fields[4] as num).toInt(),
      fee: (fields[5] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _Transaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.txid)
      ..writeByte(3)
      ..write(obj.received)
      ..writeByte(4)
      ..write(obj.sent)
      ..writeByte(5)
      ..write(obj.fee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  timestamp: (json['timestamp'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  txid: json['txid'] as String,
  received: (json['received'] as num).toInt(),
  sent: (json['sent'] as num).toInt(),
  fee: (json['fee'] as num).toInt(),
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'height': instance.height,
      'txid': instance.txid,
      'received': instance.received,
      'sent': instance.sent,
      'fee': instance.fee,
    };
