// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MasterKeyClassAdapter extends TypeAdapter<_$_MasterKey> {
  @override
  final int typeId = 7;

  @override
  _$_MasterKey read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MasterKey(
      seed: fields[0] as String?,
      passphrase: fields[1] as String?,
      root: fields[2] as String?,
      fingerprint: fields[3] as String?,
      network: fields[4] as String?,
      hasPassphrase: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_MasterKey obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.seed)
      ..writeByte(1)
      ..write(obj.passphrase)
      ..writeByte(2)
      ..write(obj.root)
      ..writeByte(3)
      ..write(obj.fingerprint)
      ..writeByte(4)
      ..write(obj.network)
      ..writeByte(5)
      ..write(obj.hasPassphrase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasterKeyClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
