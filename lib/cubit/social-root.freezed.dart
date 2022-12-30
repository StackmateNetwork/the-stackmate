// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'social-root.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocialRootState {
  SocialRoot? get key => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocialRootStateCopyWith<SocialRootState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialRootStateCopyWith<$Res> {
  factory $SocialRootStateCopyWith(
          SocialRootState value, $Res Function(SocialRootState) then) =
      _$SocialRootStateCopyWithImpl<$Res>;
  $Res call({SocialRoot? key, String? error});

  $SocialRootCopyWith<$Res>? get key;
}

/// @nodoc
class _$SocialRootStateCopyWithImpl<$Res>
    implements $SocialRootStateCopyWith<$Res> {
  _$SocialRootStateCopyWithImpl(this._value, this._then);

  final SocialRootState _value;
  // ignore: unused_field
  final $Res Function(SocialRootState) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as SocialRoot?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SocialRootCopyWith<$Res>? get key {
    if (_value.key == null) {
      return null;
    }

    return $SocialRootCopyWith<$Res>(_value.key!, (value) {
      return _then(_value.copyWith(key: value));
    });
  }
}

/// @nodoc
abstract class _$$_SocialRootStateCopyWith<$Res>
    implements $SocialRootStateCopyWith<$Res> {
  factory _$$_SocialRootStateCopyWith(
          _$_SocialRootState value, $Res Function(_$_SocialRootState) then) =
      __$$_SocialRootStateCopyWithImpl<$Res>;
  @override
  $Res call({SocialRoot? key, String? error});

  @override
  $SocialRootCopyWith<$Res>? get key;
}

/// @nodoc
class __$$_SocialRootStateCopyWithImpl<$Res>
    extends _$SocialRootStateCopyWithImpl<$Res>
    implements _$$_SocialRootStateCopyWith<$Res> {
  __$$_SocialRootStateCopyWithImpl(
      _$_SocialRootState _value, $Res Function(_$_SocialRootState) _then)
      : super(_value, (v) => _then(v as _$_SocialRootState));

  @override
  _$_SocialRootState get _value => super._value as _$_SocialRootState;

  @override
  $Res call({
    Object? key = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_SocialRootState(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as SocialRoot?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SocialRootState extends _SocialRootState {
  const _$_SocialRootState({this.key, this.error}) : super._();

  @override
  final SocialRoot? key;
  @override
  final String? error;

  @override
  String toString() {
    return 'SocialRootState(key: $key, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocialRootState &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_SocialRootStateCopyWith<_$_SocialRootState> get copyWith =>
      __$$_SocialRootStateCopyWithImpl<_$_SocialRootState>(this, _$identity);
}

abstract class _SocialRootState extends SocialRootState {
  const factory _SocialRootState({final SocialRoot? key, final String? error}) =
      _$_SocialRootState;
  const _SocialRootState._() : super._();

  @override
  SocialRoot? get key => throw _privateConstructorUsedError;
  @override
  String? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SocialRootStateCopyWith<_$_SocialRootState> get copyWith =>
      throw _privateConstructorUsedError;
}
