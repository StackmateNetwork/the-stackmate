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

/// @nodoc
mixin _$PreferencesState {
  bool get incognito => throw _privateConstructorUsedError;
  bool get bitcoinStandard => throw _privateConstructorUsedError;
  String get preferredBitcoinUnit => throw _privateConstructorUsedError;
  String get preferredExchange => throw _privateConstructorUsedError;
  String get preferredFiatUnit => throw _privateConstructorUsedError;
  String get errorPreferencesState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferencesStateCopyWith<PreferencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesStateCopyWith<$Res> {
  factory $PreferencesStateCopyWith(
          PreferencesState value, $Res Function(PreferencesState) then) =
      _$PreferencesStateCopyWithImpl<$Res>;
  $Res call(
      {bool incognito,
      bool bitcoinStandard,
      String preferredBitcoinUnit,
      String preferredExchange,
      String preferredFiatUnit,
      String errorPreferencesState});
}

/// @nodoc
class _$PreferencesStateCopyWithImpl<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  _$PreferencesStateCopyWithImpl(this._value, this._then);

  final PreferencesState _value;
  // ignore: unused_field
  final $Res Function(PreferencesState) _then;

  @override
  $Res call({
    Object? incognito = freezed,
    Object? bitcoinStandard = freezed,
    Object? preferredBitcoinUnit = freezed,
    Object? preferredExchange = freezed,
    Object? preferredFiatUnit = freezed,
    Object? errorPreferencesState = freezed,
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
      errorPreferencesState: errorPreferencesState == freezed
          ? _value.errorPreferencesState
          : errorPreferencesState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PreferencesStateCopyWith<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  factory _$$_PreferencesStateCopyWith(
          _$_PreferencesState value, $Res Function(_$_PreferencesState) then) =
      __$$_PreferencesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool incognito,
      bool bitcoinStandard,
      String preferredBitcoinUnit,
      String preferredExchange,
      String preferredFiatUnit,
      String errorPreferencesState});
}

/// @nodoc
class __$$_PreferencesStateCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res>
    implements _$$_PreferencesStateCopyWith<$Res> {
  __$$_PreferencesStateCopyWithImpl(
      _$_PreferencesState _value, $Res Function(_$_PreferencesState) _then)
      : super(_value, (v) => _then(v as _$_PreferencesState));

  @override
  _$_PreferencesState get _value => super._value as _$_PreferencesState;

  @override
  $Res call({
    Object? incognito = freezed,
    Object? bitcoinStandard = freezed,
    Object? preferredBitcoinUnit = freezed,
    Object? preferredExchange = freezed,
    Object? preferredFiatUnit = freezed,
    Object? errorPreferencesState = freezed,
  }) {
    return _then(_$_PreferencesState(
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
      errorPreferencesState: errorPreferencesState == freezed
          ? _value.errorPreferencesState
          : errorPreferencesState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PreferencesState extends _PreferencesState {
  const _$_PreferencesState(
      {this.incognito = false,
      this.bitcoinStandard = false,
      this.preferredBitcoinUnit = 'sats',
      this.preferredExchange = 'CoinCap',
      this.preferredFiatUnit = 'USD',
      this.errorPreferencesState = ''})
      : super._();

  @override
  @JsonKey()
  final bool incognito;
  @override
  @JsonKey()
  final bool bitcoinStandard;
  @override
  @JsonKey()
  final String preferredBitcoinUnit;
  @override
  @JsonKey()
  final String preferredExchange;
  @override
  @JsonKey()
  final String preferredFiatUnit;
  @override
  @JsonKey()
  final String errorPreferencesState;

  @override
  String toString() {
    return 'PreferencesState(incognito: $incognito, bitcoinStandard: $bitcoinStandard, preferredBitcoinUnit: $preferredBitcoinUnit, preferredExchange: $preferredExchange, preferredFiatUnit: $preferredFiatUnit, errorPreferencesState: $errorPreferencesState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreferencesState &&
            const DeepCollectionEquality().equals(other.incognito, incognito) &&
            const DeepCollectionEquality()
                .equals(other.bitcoinStandard, bitcoinStandard) &&
            const DeepCollectionEquality()
                .equals(other.preferredBitcoinUnit, preferredBitcoinUnit) &&
            const DeepCollectionEquality()
                .equals(other.preferredExchange, preferredExchange) &&
            const DeepCollectionEquality()
                .equals(other.preferredFiatUnit, preferredFiatUnit) &&
            const DeepCollectionEquality()
                .equals(other.errorPreferencesState, errorPreferencesState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(incognito),
      const DeepCollectionEquality().hash(bitcoinStandard),
      const DeepCollectionEquality().hash(preferredBitcoinUnit),
      const DeepCollectionEquality().hash(preferredExchange),
      const DeepCollectionEquality().hash(preferredFiatUnit),
      const DeepCollectionEquality().hash(errorPreferencesState));

  @JsonKey(ignore: true)
  @override
  _$$_PreferencesStateCopyWith<_$_PreferencesState> get copyWith =>
      __$$_PreferencesStateCopyWithImpl<_$_PreferencesState>(this, _$identity);
}

abstract class _PreferencesState extends PreferencesState {
  const factory _PreferencesState(
      {final bool incognito,
      final bool bitcoinStandard,
      final String preferredBitcoinUnit,
      final String preferredExchange,
      final String preferredFiatUnit,
      final String errorPreferencesState}) = _$_PreferencesState;
  const _PreferencesState._() : super._();

  @override
  bool get incognito => throw _privateConstructorUsedError;
  @override
  bool get bitcoinStandard => throw _privateConstructorUsedError;
  @override
  String get preferredBitcoinUnit => throw _privateConstructorUsedError;
  @override
  String get preferredExchange => throw _privateConstructorUsedError;
  @override
  String get preferredFiatUnit => throw _privateConstructorUsedError;
  @override
  String get errorPreferencesState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PreferencesStateCopyWith<_$_PreferencesState> get copyWith =>
      throw _privateConstructorUsedError;
}
