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
mixin _$SocialRoot {
  @HiveField(0)
  String get mnemonic => throw _privateConstructorUsedError;
  @HiveField(2)
  String get xprv => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocialRootCopyWith<SocialRoot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialRootCopyWith<$Res> {
  factory $SocialRootCopyWith(
          SocialRoot value, $Res Function(SocialRoot) then) =
      _$SocialRootCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String mnemonic, @HiveField(2) String xprv});
}

/// @nodoc
class _$SocialRootCopyWithImpl<$Res> implements $SocialRootCopyWith<$Res> {
  _$SocialRootCopyWithImpl(this._value, this._then);

  final SocialRoot _value;
  // ignore: unused_field
  final $Res Function(SocialRoot) _then;

  @override
  $Res call({
    Object? mnemonic = freezed,
    Object? xprv = freezed,
  }) {
    return _then(_value.copyWith(
      mnemonic: mnemonic == freezed
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      xprv: xprv == freezed
          ? _value.xprv
          : xprv // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SocialRootCopyWith<$Res>
    implements $SocialRootCopyWith<$Res> {
  factory _$$_SocialRootCopyWith(
          _$_SocialRoot value, $Res Function(_$_SocialRoot) then) =
      __$$_SocialRootCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String mnemonic, @HiveField(2) String xprv});
}

/// @nodoc
class __$$_SocialRootCopyWithImpl<$Res> extends _$SocialRootCopyWithImpl<$Res>
    implements _$$_SocialRootCopyWith<$Res> {
  __$$_SocialRootCopyWithImpl(
      _$_SocialRoot _value, $Res Function(_$_SocialRoot) _then)
      : super(_value, (v) => _then(v as _$_SocialRoot));

  @override
  _$_SocialRoot get _value => super._value as _$_SocialRoot;

  @override
  $Res call({
    Object? mnemonic = freezed,
    Object? xprv = freezed,
  }) {
    return _then(_$_SocialRoot(
      mnemonic: mnemonic == freezed
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      xprv: xprv == freezed
          ? _value.xprv
          : xprv // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 10, adapterName: 'SocialRootClassAdapter')
class _$_SocialRoot extends _SocialRoot {
  const _$_SocialRoot(
      {@HiveField(0) required this.mnemonic, @HiveField(2) required this.xprv})
      : super._();

  @override
  @HiveField(0)
  final String mnemonic;
  @override
  @HiveField(2)
  final String xprv;

  @override
  String toString() {
    return 'SocialRoot(mnemonic: $mnemonic, xprv: $xprv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocialRoot &&
            const DeepCollectionEquality().equals(other.mnemonic, mnemonic) &&
            const DeepCollectionEquality().equals(other.xprv, xprv));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mnemonic),
      const DeepCollectionEquality().hash(xprv));

  @JsonKey(ignore: true)
  @override
  _$$_SocialRootCopyWith<_$_SocialRoot> get copyWith =>
      __$$_SocialRootCopyWithImpl<_$_SocialRoot>(this, _$identity);
}

abstract class _SocialRoot extends SocialRoot {
  const factory _SocialRoot(
      {@HiveField(0) required final String mnemonic,
      @HiveField(2) required final String xprv}) = _$_SocialRoot;
  const _SocialRoot._() : super._();

  @override
  @HiveField(0)
  String get mnemonic => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get xprv => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SocialRootCopyWith<_$_SocialRoot> get copyWith =>
      throw _privateConstructorUsedError;
}
