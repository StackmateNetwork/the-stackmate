// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Tor {
  @HiveField(0)
  bool get enforced => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get internal => throw _privateConstructorUsedError;
  @HiveField(2)
  int get externalPort => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TorCopyWith<Tor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TorCopyWith<$Res> {
  factory $TorCopyWith(Tor value, $Res Function(Tor) then) =
      _$TorCopyWithImpl<$Res, Tor>;
  @useResult
  $Res call(
      {@HiveField(0) bool enforced,
      @HiveField(1) bool internal,
      @HiveField(2) int externalPort});
}

/// @nodoc
class _$TorCopyWithImpl<$Res, $Val extends Tor> implements $TorCopyWith<$Res> {
  _$TorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enforced = null,
    Object? internal = null,
    Object? externalPort = null,
  }) {
    return _then(_value.copyWith(
      enforced: null == enforced
          ? _value.enforced
          : enforced // ignore: cast_nullable_to_non_nullable
              as bool,
      internal: null == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as bool,
      externalPort: null == externalPort
          ? _value.externalPort
          : externalPort // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TorImplCopyWith<$Res> implements $TorCopyWith<$Res> {
  factory _$$TorImplCopyWith(_$TorImpl value, $Res Function(_$TorImpl) then) =
      __$$TorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool enforced,
      @HiveField(1) bool internal,
      @HiveField(2) int externalPort});
}

/// @nodoc
class __$$TorImplCopyWithImpl<$Res> extends _$TorCopyWithImpl<$Res, _$TorImpl>
    implements _$$TorImplCopyWith<$Res> {
  __$$TorImplCopyWithImpl(_$TorImpl _value, $Res Function(_$TorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enforced = null,
    Object? internal = null,
    Object? externalPort = null,
  }) {
    return _then(_$TorImpl(
      enforced: null == enforced
          ? _value.enforced
          : enforced // ignore: cast_nullable_to_non_nullable
              as bool,
      internal: null == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as bool,
      externalPort: null == externalPort
          ? _value.externalPort
          : externalPort // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 8, adapterName: 'TorClassAdapter')
class _$TorImpl extends _Tor {
  const _$TorImpl(
      {@HiveField(0) required this.enforced,
      @HiveField(1) required this.internal,
      @HiveField(2) required this.externalPort})
      : super._();

  @override
  @HiveField(0)
  final bool enforced;
  @override
  @HiveField(1)
  final bool internal;
  @override
  @HiveField(2)
  final int externalPort;

  @override
  String toString() {
    return 'Tor(enforced: $enforced, internal: $internal, externalPort: $externalPort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TorImpl &&
            (identical(other.enforced, enforced) ||
                other.enforced == enforced) &&
            (identical(other.internal, internal) ||
                other.internal == internal) &&
            (identical(other.externalPort, externalPort) ||
                other.externalPort == externalPort));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, enforced, internal, externalPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TorImplCopyWith<_$TorImpl> get copyWith =>
      __$$TorImplCopyWithImpl<_$TorImpl>(this, _$identity);
}

abstract class _Tor extends Tor {
  const factory _Tor(
      {@HiveField(0) required final bool enforced,
      @HiveField(1) required final bool internal,
      @HiveField(2) required final int externalPort}) = _$TorImpl;
  const _Tor._() : super._();

  @override
  @HiveField(0)
  bool get enforced;
  @override
  @HiveField(1)
  bool get internal;
  @override
  @HiveField(2)
  int get externalPort;
  @override
  @JsonKey(ignore: true)
  _$$TorImplCopyWith<_$TorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
