// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NodeClassAdaper extends TypeAdapter<_$_Node> {
  @override
  final int typeId = 5;

  @override
  _$_Node read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Node(
      address: fields[1] as String,
      port: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Node obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.port);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NodeClassAdaper &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      address: json['address'] as String,
      port: json['port'] as String,
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'address': instance.address,
      'port': instance.port,
    };
