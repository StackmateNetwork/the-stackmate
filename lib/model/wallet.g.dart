// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletClassAdaper extends TypeAdapter<_$_Wallet> {
  @override
  final int typeId = 1;

  @override
  _$_Wallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Wallet(
      label: fields[0] as String,
      mainWallet: fields[1] as InternalWallet,
      exportWallet: fields[2] as InternalWallet,
      backedupWallet: fields[3] as InternalWallet?,
      blockchain: fields[4] as String,
      transactions: (fields[5] as List?)?.cast<Transaction>(),
      id: fields[6] as int?,
      balance: fields[7] as int?,
      walletType: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Wallet obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.mainWallet)
      ..writeByte(2)
      ..write(obj.exportWallet)
      ..writeByte(3)
      ..write(obj.backedupWallet)
      ..writeByte(4)
      ..write(obj.blockchain)
      ..writeByte(5)
      ..write(obj.transactions)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.balance)
      ..writeByte(8)
      ..write(obj.walletType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletClassAdaper &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InternalWalletClassAdaper extends TypeAdapter<_$_InternalWallet> {
  @override
  final int typeId = 2;

  @override
  _$_InternalWallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_InternalWallet(
      xPriv: fields[0] as String?,
      xPub: fields[1] as String,
      fingerPrint: fields[2] as String,
      path: fields[3] as String,
      descriptor: fields[4] as String?,
      rescueDate: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_InternalWallet obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.xPriv)
      ..writeByte(1)
      ..write(obj.xPub)
      ..writeByte(2)
      ..write(obj.fingerPrint)
      ..writeByte(3)
      ..write(obj.path)
      ..writeByte(4)
      ..write(obj.descriptor)
      ..writeByte(5)
      ..write(obj.rescueDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InternalWalletClassAdaper &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wallet _$$_WalletFromJson(Map<String, dynamic> json) => _$_Wallet(
      label: json['label'] as String,
      mainWallet:
          InternalWallet.fromJson(json['mainWallet'] as Map<String, dynamic>),
      exportWallet:
          InternalWallet.fromJson(json['exportWallet'] as Map<String, dynamic>),
      backedupWallet: json['backedupWallet'] == null
          ? null
          : InternalWallet.fromJson(
              json['backedupWallet'] as Map<String, dynamic>),
      blockchain: json['blockchain'] as String,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      balance: json['balance'] as int?,
      walletType: json['walletType'] as String,
    );

Map<String, dynamic> _$$_WalletToJson(_$_Wallet instance) => <String, dynamic>{
      'label': instance.label,
      'mainWallet': instance.mainWallet,
      'exportWallet': instance.exportWallet,
      'backedupWallet': instance.backedupWallet,
      'blockchain': instance.blockchain,
      'transactions': instance.transactions,
      'id': instance.id,
      'balance': instance.balance,
      'walletType': instance.walletType,
    };

_$_InternalWallet _$$_InternalWalletFromJson(Map<String, dynamic> json) =>
    _$_InternalWallet(
      xPriv: json['xPriv'] as String?,
      xPub: json['xPub'] as String,
      fingerPrint: json['fingerPrint'] as String,
      path: json['path'] as String,
      descriptor: json['descriptor'] as String?,
      rescueDate: json['rescueDate'] == null
          ? null
          : DateTime.parse(json['rescueDate'] as String),
    );

Map<String, dynamic> _$$_InternalWalletToJson(_$_InternalWallet instance) =>
    <String, dynamic>{
      'xPriv': instance.xPriv,
      'xPub': instance.xPub,
      'fingerPrint': instance.fingerPrint,
      'path': instance.path,
      'descriptor': instance.descriptor,
      'rescueDate': instance.rescueDate?.toIso8601String(),
    };
