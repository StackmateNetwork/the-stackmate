// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-members.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkMembers _$NetworkMembersFromJson(Map<String, dynamic> json) {
  return _NetworkMembers.fromJson(json);
}

/// @nodoc
mixin _$NetworkMembers {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  List<MemberIdentity> get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkMembersCopyWith<NetworkMembers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkMembersCopyWith<$Res> {
  factory $NetworkMembersCopyWith(
          NetworkMembers value, $Res Function(NetworkMembers) then) =
      _$NetworkMembersCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id, @HiveField(1) List<MemberIdentity> members});
}

/// @nodoc
class _$NetworkMembersCopyWithImpl<$Res>
    implements $NetworkMembersCopyWith<$Res> {
  _$NetworkMembersCopyWithImpl(this._value, this._then);

  final NetworkMembers _value;
  // ignore: unused_field
  final $Res Function(NetworkMembers) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberIdentity>,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkMembersCopyWith<$Res>
    implements $NetworkMembersCopyWith<$Res> {
  factory _$$_NetworkMembersCopyWith(
          _$_NetworkMembers value, $Res Function(_$_NetworkMembers) then) =
      __$$_NetworkMembersCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? id, @HiveField(1) List<MemberIdentity> members});
}

/// @nodoc
class __$$_NetworkMembersCopyWithImpl<$Res>
    extends _$NetworkMembersCopyWithImpl<$Res>
    implements _$$_NetworkMembersCopyWith<$Res> {
  __$$_NetworkMembersCopyWithImpl(
      _$_NetworkMembers _value, $Res Function(_$_NetworkMembers) _then)
      : super(_value, (v) => _then(v as _$_NetworkMembers));

  @override
  _$_NetworkMembers get _value => super._value as _$_NetworkMembers;

  @override
  $Res call({
    Object? id = freezed,
    Object? members = freezed,
  }) {
    return _then(_$_NetworkMembers(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberIdentity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 12, adapterName: 'NetworkMembersClassAdapter')
class _$_NetworkMembers extends _NetworkMembers {
  const _$_NetworkMembers(
      {@HiveField(0) this.id,
      @HiveField(1) required final List<MemberIdentity> members})
      : _members = members,
        super._();

  factory _$_NetworkMembers.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkMembersFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  final List<MemberIdentity> _members;
  @override
  @HiveField(1)
  List<MemberIdentity> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'NetworkMembers(id: $id, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkMembers &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkMembersCopyWith<_$_NetworkMembers> get copyWith =>
      __$$_NetworkMembersCopyWithImpl<_$_NetworkMembers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkMembersToJson(this);
  }
}

abstract class _NetworkMembers extends NetworkMembers {
  const factory _NetworkMembers(
          {@HiveField(0) final int? id,
          @HiveField(1) required final List<MemberIdentity> members}) =
      _$_NetworkMembers;
  const _NetworkMembers._() : super._();

  factory _NetworkMembers.fromJson(Map<String, dynamic> json) =
      _$_NetworkMembers.fromJson;

  @override
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<MemberIdentity> get members => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkMembersCopyWith<_$_NetworkMembers> get copyWith =>
      throw _privateConstructorUsedError;
}
