// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NodeClassAdapter extends TypeAdapter<_Node> {
  @override
  final typeId = 3;

  @override
  _Node read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _Node(address: fields[1] as String, name: fields[2] as String);
  }

  @override
  void write(BinaryWriter writer, _Node obj) {
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

_Node _$NodeFromJson(Map<String, dynamic> json) =>
    _Node(address: json['address'] as String, name: json['name'] as String);

Map<String, dynamic> _$NodeToJson(_Node instance) => <String, dynamic>{
  'address': instance.address,
  'name': instance.name,
};
