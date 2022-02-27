import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  @HiveType(typeId: 5, adapterName: 'NodeClassAdaper')
  const factory Node({
    @HiveField(1) required String address,
    @HiveField(2) required String port,
  }) = _Node;
  const Node._();

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
