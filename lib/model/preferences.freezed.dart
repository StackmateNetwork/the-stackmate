// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return _Preferences.fromJson(json);
}

/// @nodoc
mixin _$Preferences {
  @HiveField(0)
  bool get incognito => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get bitcoinStandard => throw _privateConstructorUsedError;
  @HiveField(2)
  String get preferredBitcoinUnit => throw _privateConstructorUsedError;
  @HiveField(3)
  String get preferredExchange => throw _privateConstructorUsedError;
  @HiveField(4)
  String get preferredFiatUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferencesCopyWith<Preferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesCopyWith<$Res> {
  factory $PreferencesCopyWith(
          Preferences value, $Res Function(Preferences) then) =
      _$PreferencesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool incognito,
      @HiveField(1) bool bitcoinStandard,
      @HiveField(2) String preferredBitcoinUnit,
      @HiveField(3) String preferredExchange,
      @HiveField(4) String preferredFiatUnit});
}

/// @nodoc
class _$PreferencesCopyWithImpl<$Res> implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._value, this._then);

  final Preferences _value;
  // ignore: unused_field
  final $Res Function(Preferences) _then;

  @override
  $Res call({
    Object? incognito = freezed,
    Object? bitcoinStandard = freezed,
    Object? preferredBitcoinUnit = freezed,
    Object? preferredExchange = freezed,
    Object? preferredFiatUnit = freezed,
  }) {
    return _then(_value.copyWith(
      incognito: incognito == freezed
          ? _value.incognito
          : incognito // ignore: cast_nullable_to_non_nullable
              as bool,
      bitcoinStandard: bitcoinStandard == freezed
          ? _value.bitcoinStandard
          : bitcoinStandard // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredBitcoinUnit: preferredBitcoinUnit == freezed
          ? _value.preferredBitcoinUnit
          : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
              as String,
      preferredExchange: preferredExchange == freezed
          ? _value.preferredExchange
          : preferredExchange // ignore: cast_nullable_to_non_nullable
              as String,
      preferredFiatUnit: preferredFiatUnit == freezed
          ? _value.preferredFiatUnit
          : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PreferencesCopyWith<$Res>
    implements $PreferencesCopyWith<$Res> {
  factory _$$_PreferencesCopyWith(
          _$_Preferences value, $Res Function(_$_Preferences) then) =
      __$$_PreferencesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool incognito,
      @HiveField(1) bool bitcoinStandard,
      @HiveField(2) String preferredBitcoinUnit,
      @HiveField(3) String preferredExchange,
      @HiveField(4) String preferredFiatUnit});
}

/// @nodoc
class __$$_PreferencesCopyWithImpl<$Res> extends _$PreferencesCopyWithImpl<$Res>
    implements _$$_PreferencesCopyWith<$Res> {
  __$$_PreferencesCopyWithImpl(
      _$_Preferences _value, $Res Function(_$_Preferences) _then)
      : super(_value, (v) => _then(v as _$_Preferences));

  @override
  _$_Preferences get _value => super._value as _$_Preferences;

  @override
  $Res call({
    Object? incognito = freezed,
    Object? bitcoinStandard = freezed,
    Object? preferredBitcoinUnit = freezed,
    Object? preferredExchange = freezed,
    Object? preferredFiatUnit = freezed,
  }) {
    return _then(_$_Preferences(
      incognito: incognito == freezed
          ? _value.incognito
          : incognito // ignore: cast_nullable_to_non_nullable
              as bool,
      bitcoinStandard: bitcoinStandard == freezed
          ? _value.bitcoinStandard
          : bitcoinStandard // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredBitcoinUnit: preferredBitcoinUnit == freezed
          ? _value.preferredBitcoinUnit
          : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
              as String,
      preferredExchange: preferredExchange == freezed
          ? _value.preferredExchange
          : preferredExchange // ignore: cast_nullable_to_non_nullable
              as String,
      preferredFiatUnit: preferredFiatUnit == freezed
          ? _value.preferredFiatUnit
          : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'PreferencesClassAdapter')
class _$_Preferences extends _Preferences {
  const _$_Preferences(
      {@HiveField(0) required this.incognito,
      @HiveField(1) required this.bitcoinStandard,
      @HiveField(2) required this.preferredBitcoinUnit,
      @HiveField(3) required this.preferredExchange,
      @HiveField(4) required this.preferredFiatUnit})
      : super._();

  factory _$_Preferences.fromJson(Map<String, dynamic> json) =>
      _$$_PreferencesFromJson(json);

  @override
  @HiveField(0)
  final bool incognito;
  @override
  @HiveField(1)
  final bool bitcoinStandard;
  @override
  @HiveField(2)
  final String preferredBitcoinUnit;
  @override
  @HiveField(3)
  final String preferredExchange;
  @override
  @HiveField(4)
  final String preferredFiatUnit;

  @override
  String toString() {
    return 'Preferences(incognito: $incognito, bitcoinStandard: $bitcoinStandard, preferredBitcoinUnit: $preferredBitcoinUnit, preferredExchange: $preferredExchange, preferredFiatUnit: $preferredFiatUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preferences &&
            const DeepCollectionEquality().equals(other.incognito, incognito) &&
            const DeepCollectionEquality()
                .equals(other.bitcoinStandard, bitcoinStandard) &&
            const DeepCollectionEquality()
                .equals(other.preferredBitcoinUnit, preferredBitcoinUnit) &&
            const DeepCollectionEquality()
                .equals(other.preferredExchange, preferredExchange) &&
            const DeepCollectionEquality()
                .equals(other.preferredFiatUnit, preferredFiatUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(incognito),
      const DeepCollectionEquality().hash(bitcoinStandard),
      const DeepCollectionEquality().hash(preferredBitcoinUnit),
      const DeepCollectionEquality().hash(preferredExchange),
      const DeepCollectionEquality().hash(preferredFiatUnit));

  @JsonKey(ignore: true)
  @override
  _$$_PreferencesCopyWith<_$_Preferences> get copyWith =>
      __$$_PreferencesCopyWithImpl<_$_Preferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreferencesToJson(this);
  }
}

abstract class _Preferences extends Preferences {
  const factory _Preferences(
      {@HiveField(0) required final bool incognito,
      @HiveField(1) required final bool bitcoinStandard,
      @HiveField(2) required final String preferredBitcoinUnit,
      @HiveField(3) required final String preferredExchange,
      @HiveField(4) required final String preferredFiatUnit}) = _$_Preferences;
  const _Preferences._() : super._();

  factory _Preferences.fromJson(Map<String, dynamic> json) =
      _$_Preferences.fromJson;

  @override
  @HiveField(0)
  bool get incognito => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  bool get bitcoinStandard => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get preferredBitcoinUnit => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get preferredExchange => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get preferredFiatUnit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PreferencesCopyWith<_$_Preferences> get copyWith =>
      throw _privateConstructorUsedError;
}
