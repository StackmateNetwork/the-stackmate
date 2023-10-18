// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fees.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeesClassAdapter extends TypeAdapter<_$FeesImpl> {
  @override
  final int typeId = 5;

  @override
  _$FeesImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FeesImpl(
      timestamp: fields[0] as int,
      slow: fields[1] as double,
      medium: fields[2] as double,
      fast: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$FeesImpl obj) {
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

_$FeesImpl _$$FeesImplFromJson(Map<String, dynamic> json) => _$FeesImpl(
      timestamp: json['timestamp'] as int,
      slow: (json['slow'] as num).toDouble(),
      medium: (json['medium'] as num).toDouble(),
      fast: (json['fast'] as num).toDouble(),
    );

Map<String, dynamic> _$$FeesImplToJson(_$FeesImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'slow': instance.slow,
      'medium': instance.medium,
      'fast': instance.fast,
    };
