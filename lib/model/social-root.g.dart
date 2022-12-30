// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social-root.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SocialRootClassAdapter extends TypeAdapter<_$_SocialRoot> {
  @override
  final int typeId = 10;

  @override
  _$_SocialRoot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SocialRoot(
      mnemonic: fields[0] as String,
      xprv: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SocialRoot obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mnemonic)
      ..writeByte(2)
      ..write(obj.xprv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialRootClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
