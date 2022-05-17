// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Node _$NodeFromJson(Map<String, dynamic> json) {
  return _Node.fromJson(json);
}

/// @nodoc
class _$NodeTearOff {
  const _$NodeTearOff();

  _Node call(
      {@HiveField(1) required String address,
      @HiveField(2) required String port}) {
    return _Node(
      address: address,
      port: port,
    );
  }

  Node fromJson(Map<String, Object> json) {
    return Node.fromJson(json);
  }
}

/// @nodoc
const $Node = _$NodeTearOff();

/// @nodoc
mixin _$Node {
  @HiveField(1)
  String get address => throw _privateConstructorUsedError;
  @HiveField(2)
  String get port => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res>;
  $Res call({@HiveField(1) String address, @HiveField(2) String port});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res> implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  final Node _value;
  // ignore: unused_field
  final $Res Function(Node) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? port = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$NodeCopyWith(_Node value, $Res Function(_Node) then) =
      __$NodeCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(1) String address, @HiveField(2) String port});
}

/// @nodoc
class __$NodeCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res>
    implements _$NodeCopyWith<$Res> {
  __$NodeCopyWithImpl(_Node _value, $Res Function(_Node) _then)
      : super(_value, (v) => _then(v as _Node));

  @override
  _Node get _value => super._value as _Node;

  @override
  $Res call({
    Object? address = freezed,
    Object? port = freezed,
  }) {
    return _then(_Node(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'NodeClassAdapter')
class _$_Node extends _Node {
  const _$_Node(
      {@HiveField(1) required this.address, @HiveField(2) required this.port})
      : super._();

  factory _$_Node.fromJson(Map<String, dynamic> json) => _$$_NodeFromJson(json);

  @override
  @HiveField(1)
  final String address;
  @override
  @HiveField(2)
  final String port;

  @override
  String toString() {
    return 'Node(address: $address, port: $port)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Node &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(port);

  @JsonKey(ignore: true)
  @override
  _$NodeCopyWith<_Node> get copyWith =>
      __$NodeCopyWithImpl<_Node>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NodeToJson(this);
  }
}

abstract class _Node extends Node {
  const factory _Node(
      {@HiveField(1) required String address,
      @HiveField(2) required String port}) = _$_Node;
  const _Node._() : super._();

  factory _Node.fromJson(Map<String, dynamic> json) = _$_Node.fromJson;

  @override
  @HiveField(1)
  String get address => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get port => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NodeCopyWith<_Node> get copyWith => throw _privateConstructorUsedError;
}
