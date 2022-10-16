// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-posts-info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkPostsInfo _$NetworkPostsInfoFromJson(Map<String, dynamic> json) {
  return _NetworkPostsInfo.fromJson(json);
}

/// @nodoc
mixin _$NetworkPostsInfo {
  @HiveField(0)
  int get lastGenesis => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String> get corruptedPostIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkPostsInfoCopyWith<NetworkPostsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPostsInfoCopyWith<$Res> {
  factory $NetworkPostsInfoCopyWith(
          NetworkPostsInfo value, $Res Function(NetworkPostsInfo) then) =
      _$NetworkPostsInfoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int lastGenesis,
      @HiveField(1) List<String> corruptedPostIds});
}

/// @nodoc
class _$NetworkPostsInfoCopyWithImpl<$Res>
    implements $NetworkPostsInfoCopyWith<$Res> {
  _$NetworkPostsInfoCopyWithImpl(this._value, this._then);

  final NetworkPostsInfo _value;
  // ignore: unused_field
  final $Res Function(NetworkPostsInfo) _then;

  @override
  $Res call({
    Object? lastGenesis = freezed,
    Object? corruptedPostIds = freezed,
  }) {
    return _then(_value.copyWith(
      lastGenesis: lastGenesis == freezed
          ? _value.lastGenesis
          : lastGenesis // ignore: cast_nullable_to_non_nullable
              as int,
      corruptedPostIds: corruptedPostIds == freezed
          ? _value.corruptedPostIds
          : corruptedPostIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkPostsInfoCopyWith<$Res>
    implements $NetworkPostsInfoCopyWith<$Res> {
  factory _$$_NetworkPostsInfoCopyWith(
          _$_NetworkPostsInfo value, $Res Function(_$_NetworkPostsInfo) then) =
      __$$_NetworkPostsInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int lastGenesis,
      @HiveField(1) List<String> corruptedPostIds});
}

/// @nodoc
class __$$_NetworkPostsInfoCopyWithImpl<$Res>
    extends _$NetworkPostsInfoCopyWithImpl<$Res>
    implements _$$_NetworkPostsInfoCopyWith<$Res> {
  __$$_NetworkPostsInfoCopyWithImpl(
      _$_NetworkPostsInfo _value, $Res Function(_$_NetworkPostsInfo) _then)
      : super(_value, (v) => _then(v as _$_NetworkPostsInfo));

  @override
  _$_NetworkPostsInfo get _value => super._value as _$_NetworkPostsInfo;

  @override
  $Res call({
    Object? lastGenesis = freezed,
    Object? corruptedPostIds = freezed,
  }) {
    return _then(_$_NetworkPostsInfo(
      lastGenesis: lastGenesis == freezed
          ? _value.lastGenesis
          : lastGenesis // ignore: cast_nullable_to_non_nullable
              as int,
      corruptedPostIds: corruptedPostIds == freezed
          ? _value._corruptedPostIds
          : corruptedPostIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 13, adapterName: 'NetworkPostsInfoClassAdapter')
class _$_NetworkPostsInfo extends _NetworkPostsInfo {
  const _$_NetworkPostsInfo(
      {@HiveField(0) required this.lastGenesis,
      @HiveField(1) required final List<String> corruptedPostIds})
      : _corruptedPostIds = corruptedPostIds,
        super._();

  factory _$_NetworkPostsInfo.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkPostsInfoFromJson(json);

  @override
  @HiveField(0)
  final int lastGenesis;
  final List<String> _corruptedPostIds;
  @override
  @HiveField(1)
  List<String> get corruptedPostIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_corruptedPostIds);
  }

  @override
  String toString() {
    return 'NetworkPostsInfo(lastGenesis: $lastGenesis, corruptedPostIds: $corruptedPostIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPostsInfo &&
            const DeepCollectionEquality()
                .equals(other.lastGenesis, lastGenesis) &&
            const DeepCollectionEquality()
                .equals(other._corruptedPostIds, _corruptedPostIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lastGenesis),
      const DeepCollectionEquality().hash(_corruptedPostIds));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkPostsInfoCopyWith<_$_NetworkPostsInfo> get copyWith =>
      __$$_NetworkPostsInfoCopyWithImpl<_$_NetworkPostsInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkPostsInfoToJson(this);
  }
}

abstract class _NetworkPostsInfo extends NetworkPostsInfo {
  const factory _NetworkPostsInfo(
          {@HiveField(0) required final int lastGenesis,
          @HiveField(1) required final List<String> corruptedPostIds}) =
      _$_NetworkPostsInfo;
  const _NetworkPostsInfo._() : super._();

  factory _NetworkPostsInfo.fromJson(Map<String, dynamic> json) =
      _$_NetworkPostsInfo.fromJson;

  @override
  @HiveField(0)
  int get lastGenesis => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<String> get corruptedPostIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPostsInfoCopyWith<_$_NetworkPostsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
