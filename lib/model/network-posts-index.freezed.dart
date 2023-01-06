// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-posts-index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkPostsIndex _$NetworkPostsIndexFromJson(Map<String, dynamic> json) {
  return _NetworkPostsIndex.fromJson(json);
}

/// @nodoc
mixin _$NetworkPostsIndex {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get lastIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkPostsIndexCopyWith<NetworkPostsIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPostsIndexCopyWith<$Res> {
  factory $NetworkPostsIndexCopyWith(
          NetworkPostsIndex value, $Res Function(NetworkPostsIndex) then) =
      _$NetworkPostsIndexCopyWithImpl<$Res>;
  $Res call({@HiveField(0) int? id, @HiveField(1) int lastIndex});
}

/// @nodoc
class _$NetworkPostsIndexCopyWithImpl<$Res>
    implements $NetworkPostsIndexCopyWith<$Res> {
  _$NetworkPostsIndexCopyWithImpl(this._value, this._then);

  final NetworkPostsIndex _value;
  // ignore: unused_field
  final $Res Function(NetworkPostsIndex) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastIndex = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastIndex: lastIndex == freezed
          ? _value.lastIndex
          : lastIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkPostsIndexCopyWith<$Res>
    implements $NetworkPostsIndexCopyWith<$Res> {
  factory _$$_NetworkPostsIndexCopyWith(_$_NetworkPostsIndex value,
          $Res Function(_$_NetworkPostsIndex) then) =
      __$$_NetworkPostsIndexCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) int? id, @HiveField(1) int lastIndex});
}

/// @nodoc
class __$$_NetworkPostsIndexCopyWithImpl<$Res>
    extends _$NetworkPostsIndexCopyWithImpl<$Res>
    implements _$$_NetworkPostsIndexCopyWith<$Res> {
  __$$_NetworkPostsIndexCopyWithImpl(
      _$_NetworkPostsIndex _value, $Res Function(_$_NetworkPostsIndex) _then)
      : super(_value, (v) => _then(v as _$_NetworkPostsIndex));

  @override
  _$_NetworkPostsIndex get _value => super._value as _$_NetworkPostsIndex;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastIndex = freezed,
  }) {
    return _then(_$_NetworkPostsIndex(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastIndex: lastIndex == freezed
          ? _value.lastIndex
          : lastIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 14, adapterName: 'NetworkPostsIndexClassAdapter')
class _$_NetworkPostsIndex extends _NetworkPostsIndex {
  const _$_NetworkPostsIndex(
      {@HiveField(0) this.id, @HiveField(1) required this.lastIndex})
      : super._();

  factory _$_NetworkPostsIndex.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkPostsIndexFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final int lastIndex;

  @override
  String toString() {
    return 'NetworkPostsIndex(id: $id, lastIndex: $lastIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPostsIndex &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lastIndex, lastIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lastIndex));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkPostsIndexCopyWith<_$_NetworkPostsIndex> get copyWith =>
      __$$_NetworkPostsIndexCopyWithImpl<_$_NetworkPostsIndex>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkPostsIndexToJson(this);
  }
}

abstract class _NetworkPostsIndex extends NetworkPostsIndex {
  const factory _NetworkPostsIndex(
      {@HiveField(0) final int? id,
      @HiveField(1) required final int lastIndex}) = _$_NetworkPostsIndex;
  const _NetworkPostsIndex._() : super._();

  factory _NetworkPostsIndex.fromJson(Map<String, dynamic> json) =
      _$_NetworkPostsIndex.fromJson;

  @override
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get lastIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPostsIndexCopyWith<_$_NetworkPostsIndex> get copyWith =>
      throw _privateConstructorUsedError;
}
