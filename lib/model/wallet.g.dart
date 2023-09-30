// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletClassAdapter extends TypeAdapter<_$_Wallet> {
  @override
  final int typeId = 1;

  @override
  _$_Wallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Wallet(
      id: fields[0] as int?,
      uid: fields[1] as String,
      label: fields[2] as String,
      descriptor: fields[3] as String,
      policy: fields[4] as String,
      requiredPolicyElements: fields[5] as int,
      policyElements: (fields[6] as List).cast<String>(),
      blockchain: fields[7] as String,
      transactions: (fields[8] as List).cast<Transaction>(),
      balance: fields[9] as int,
      lastAddressIndex: fields[10] as int,
      walletType: fields[11] as String,
      passPhrase: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Wallet obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.label)
      ..writeByte(3)
      ..write(obj.descriptor)
      ..writeByte(4)
      ..write(obj.policy)
      ..writeByte(5)
      ..write(obj.requiredPolicyElements)
      ..writeByte(7)
      ..write(obj.blockchain)
      ..writeByte(9)
      ..write(obj.balance)
      ..writeByte(10)
      ..write(obj.lastAddressIndex)
      ..writeByte(11)
      ..write(obj.walletType)
      ..writeByte(12)
      ..write(obj.passPhrase)
      ..writeByte(6)
      ..write(obj.policyElements)
      ..writeByte(8)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wallet _$$_WalletFromJson(Map<String, dynamic> json) => _$_Wallet(
      id: json['id'] as int?,
      uid: json['uid'] as String,
      label: json['label'] as String,
      descriptor: json['descriptor'] as String,
      policy: json['policy'] as String,
      requiredPolicyElements: json['requiredPolicyElements'] as int,
      policyElements: (json['policyElements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      blockchain: json['blockchain'] as String,
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      balance: json['balance'] as int,
      lastAddressIndex: json['lastAddressIndex'] as int,
      walletType: json['walletType'] as String,
      passPhrase: json['passPhrase'] as String,
    );

Map<String, dynamic> _$$_WalletToJson(_$_Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'label': instance.label,
      'descriptor': instance.descriptor,
      'policy': instance.policy,
      'requiredPolicyElements': instance.requiredPolicyElements,
      'policyElements': instance.policyElements,
      'blockchain': instance.blockchain,
      'transactions': instance.transactions,
      'balance': instance.balance,
      'lastAddressIndex': instance.lastAddressIndex,
      'walletType': instance.walletType,
      'passPhrase': instance.passPhrase,
    };
