// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NodeClassAdapter extends TypeAdapter<_$NodeImpl> {
  @override
  final int typeId = 3;

  @override
  _$NodeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$NodeImpl(
      address: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$NodeImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NodeClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      address: json['address'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'name': instance.name,
    };
