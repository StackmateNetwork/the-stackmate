// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-chat-history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkChatHistory {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Map<String, dynamic>> get verifiedPosts =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  int get latestGenesis => throw _privateConstructorUsedError;
  @HiveField(3)
  List<String> get corruptedPostIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkChatHistoryCopyWith<NetworkChatHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkChatHistoryCopyWith<$Res> {
  factory $NetworkChatHistoryCopyWith(
          NetworkChatHistory value, $Res Function(NetworkChatHistory) then) =
      _$NetworkChatHistoryCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) List<Map<String, dynamic>> verifiedPosts,
      @HiveField(2) int latestGenesis,
      @HiveField(3) List<String> corruptedPostIds});
}

/// @nodoc
class _$NetworkChatHistoryCopyWithImpl<$Res>
    implements $NetworkChatHistoryCopyWith<$Res> {
  _$NetworkChatHistoryCopyWithImpl(this._value, this._then);

  final NetworkChatHistory _value;
  // ignore: unused_field
  final $Res Function(NetworkChatHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? verifiedPosts = freezed,
    Object? latestGenesis = freezed,
    Object? corruptedPostIds = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      verifiedPosts: verifiedPosts == freezed
          ? _value.verifiedPosts
          : verifiedPosts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      latestGenesis: latestGenesis == freezed
          ? _value.latestGenesis
          : latestGenesis // ignore: cast_nullable_to_non_nullable
              as int,
      corruptedPostIds: corruptedPostIds == freezed
          ? _value.corruptedPostIds
          : corruptedPostIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkChatHistoryCopyWith<$Res>
    implements $NetworkChatHistoryCopyWith<$Res> {
  factory _$$_NetworkChatHistoryCopyWith(_$_NetworkChatHistory value,
          $Res Function(_$_NetworkChatHistory) then) =
      __$$_NetworkChatHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) List<Map<String, dynamic>> verifiedPosts,
      @HiveField(2) int latestGenesis,
      @HiveField(3) List<String> corruptedPostIds});
}

/// @nodoc
class __$$_NetworkChatHistoryCopyWithImpl<$Res>
    extends _$NetworkChatHistoryCopyWithImpl<$Res>
    implements _$$_NetworkChatHistoryCopyWith<$Res> {
  __$$_NetworkChatHistoryCopyWithImpl(
      _$_NetworkChatHistory _value, $Res Function(_$_NetworkChatHistory) _then)
      : super(_value, (v) => _then(v as _$_NetworkChatHistory));

  @override
  _$_NetworkChatHistory get _value => super._value as _$_NetworkChatHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? verifiedPosts = freezed,
    Object? latestGenesis = freezed,
    Object? corruptedPostIds = freezed,
  }) {
    return _then(_$_NetworkChatHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      verifiedPosts: verifiedPosts == freezed
          ? _value._verifiedPosts
          : verifiedPosts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      latestGenesis: latestGenesis == freezed
          ? _value.latestGenesis
          : latestGenesis // ignore: cast_nullable_to_non_nullable
              as int,
      corruptedPostIds: corruptedPostIds == freezed
          ? _value._corruptedPostIds
          : corruptedPostIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 13, adapterName: 'NetworkChatHistoryClassAdapter')
class _$_NetworkChatHistory extends _NetworkChatHistory {
  const _$_NetworkChatHistory(
      {@HiveField(0) this.id,
      @HiveField(1) required final List<Map<String, dynamic>> verifiedPosts,
      @HiveField(2) required this.latestGenesis,
      @HiveField(3) required final List<String> corruptedPostIds})
      : _verifiedPosts = verifiedPosts,
        _corruptedPostIds = corruptedPostIds,
        super._();

  @override
  @HiveField(0)
  final int? id;
  final List<Map<String, dynamic>> _verifiedPosts;
  @override
  @HiveField(1)
  List<Map<String, dynamic>> get verifiedPosts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verifiedPosts);
  }

  @override
  @HiveField(2)
  final int latestGenesis;
  final List<String> _corruptedPostIds;
  @override
  @HiveField(3)
  List<String> get corruptedPostIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_corruptedPostIds);
  }

  @override
  String toString() {
    return 'NetworkChatHistory(id: $id, verifiedPosts: $verifiedPosts, latestGenesis: $latestGenesis, corruptedPostIds: $corruptedPostIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkChatHistory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other._verifiedPosts, _verifiedPosts) &&
            const DeepCollectionEquality()
                .equals(other.latestGenesis, latestGenesis) &&
            const DeepCollectionEquality()
                .equals(other._corruptedPostIds, _corruptedPostIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_verifiedPosts),
      const DeepCollectionEquality().hash(latestGenesis),
      const DeepCollectionEquality().hash(_corruptedPostIds));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkChatHistoryCopyWith<_$_NetworkChatHistory> get copyWith =>
      __$$_NetworkChatHistoryCopyWithImpl<_$_NetworkChatHistory>(
          this, _$identity);
}

abstract class _NetworkChatHistory extends NetworkChatHistory {
  const factory _NetworkChatHistory(
          {@HiveField(0) final int? id,
          @HiveField(1) required final List<Map<String, dynamic>> verifiedPosts,
          @HiveField(2) required final int latestGenesis,
          @HiveField(3) required final List<String> corruptedPostIds}) =
      _$_NetworkChatHistory;
  const _NetworkChatHistory._() : super._();

  @override
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<Map<String, dynamic>> get verifiedPosts =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int get latestGenesis => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<String> get corruptedPostIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkChatHistoryCopyWith<_$_NetworkChatHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
