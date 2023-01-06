import 'package:hive/hive.dart';
import 'package:libcpclient/outputs.dart';

// part 'member-identity.g.dart';
// part 'member-identity.freezed.dart';

class MemberIdentityAdapter extends TypeAdapter<MemberIdentity> {
  @override
  MemberIdentity read(BinaryReader reader) {
    // TODO: implement read
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberIdentity(
      pubkey: fields[0] as String,
      username: fields[1] as String,
    );
  }

  @override
  final typeId = 0;

  @override
  void write(BinaryWriter writer, MemberIdentity obj) {
    // TODO: implement write
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pubkey)
      ..writeByte(1)
      ..write(obj.username);
  }
}
