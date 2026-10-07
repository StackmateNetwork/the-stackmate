// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
abstract class Node with _$Node {
  @HiveType(typeId: 3, adapterName: 'NodeClassAdapter')
  const factory Node({
    @HiveField(1) required String address,
    @HiveField(2) required String name,
  }) = _Node;
  const Node._();

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
