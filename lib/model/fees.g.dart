// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fees.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeesClassAdapter extends TypeAdapter<_Fees> {
  @override
  final typeId = 5;

  @override
  _Fees read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _Fees(
      timestamp: (fields[0] as num).toInt(),
      slow: (fields[1] as num).toDouble(),
      medium: (fields[2] as num).toDouble(),
      fast: (fields[3] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, _Fees obj) {
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

_Fees _$FeesFromJson(Map<String, dynamic> json) => _Fees(
  timestamp: (json['timestamp'] as num).toInt(),
  slow: (json['slow'] as num).toDouble(),
  medium: (json['medium'] as num).toDouble(),
  fast: (json['fast'] as num).toDouble(),
);

Map<String, dynamic> _$FeesToJson(_Fees instance) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'slow': instance.slow,
  'medium': instance.medium,
  'fast': instance.fast,
};
