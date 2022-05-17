// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fees.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeesClassAdapter extends TypeAdapter<_$_Fees> {
  @override
  final int typeId = 5;

  @override
  _$_Fees read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Fees(
      timestamp: fields[0] as int,
      slow: fields[1] as double,
      medium: fields[2] as double,
      fast: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Fees obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.slow)
      ..writeByte(2)
      ..write(obj.medium)
      ..writeByte(3)
      ..write(obj.fast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeesClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fees _$$_FeesFromJson(Map<String, dynamic> json) => _$_Fees(
      timestamp: json['timestamp'] as int,
      slow: (json['slow'] as num).toDouble(),
      medium: (json['medium'] as num).toDouble(),
      fast: (json['fast'] as num).toDouble(),
    );

Map<String, dynamic> _$$_FeesToJson(_$_Fees instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'slow': instance.slow,
      'medium': instance.medium,
      'fast': instance.fast,
    };
