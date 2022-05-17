// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionClassAdapter extends TypeAdapter<_$_Transaction> {
  @override
  final int typeId = 6;

  @override
  _$_Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Transaction(
      timestamp: fields[0] as int,
      height: fields[1] as int,
      txid: fields[2] as String,
      received: fields[3] as int,
      sent: fields[4] as int,
      fee: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Transaction obj) {
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

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      timestamp: json['timestamp'] as int,
      height: json['height'] as int,
      txid: json['txid'] as String,
      received: json['received'] as int,
      sent: json['sent'] as int,
      fee: json['fee'] as int,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'height': instance.height,
      'txid': instance.txid,
      'received': instance.received,
      'sent': instance.sent,
      'fee': instance.fee,
    };
