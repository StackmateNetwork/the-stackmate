// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
      _$PreferencesStateCopyWithImpl<$Res, PreferencesState>;
  @useResult
  $Res call(
      {bool incognito,
      bool bitcoinStandard,
      String preferredBitcoinUnit,
      String preferredExchange,
      String preferredFiatUnit,
      String errorPreferencesState});
}

/// @nodoc
class _$PreferencesStateCopyWithImpl<$Res, $Val extends PreferencesState>
    implements $PreferencesStateCopyWith<$Res> {
  _$PreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incognito = null,
    Object? bitcoinStandard = null,
    Object? preferredBitcoinUnit = null,
    Object? preferredExchange = null,
    Object? preferredFiatUnit = null,
    Object? errorPreferencesState = null,
  }) {
    return _then(_value.copyWith(
      incognito: null == incognito
          ? _value.incognito
          : incognito // ignore: cast_nullable_to_non_nullable
              as bool,
      bitcoinStandard: null == bitcoinStandard
          ? _value.bitcoinStandard
          : bitcoinStandard // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredBitcoinUnit: null == preferredBitcoinUnit
          ? _value.preferredBitcoinUnit
          : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
              as String,
      preferredExchange: null == preferredExchange
          ? _value.preferredExchange
          : preferredExchange // ignore: cast_nullable_to_non_nullable
              as String,
      preferredFiatUnit: null == preferredFiatUnit
          ? _value.preferredFiatUnit
          : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
              as String,
      errorPreferencesState: null == errorPreferencesState
          ? _value.errorPreferencesState
          : errorPreferencesState // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferencesStateImplCopyWith<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  factory _$$PreferencesStateImplCopyWith(_$PreferencesStateImpl value,
          $Res Function(_$PreferencesStateImpl) then) =
      __$$PreferencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool incognito,
      bool bitcoinStandard,
      String preferredBitcoinUnit,
      String preferredExchange,
      String preferredFiatUnit,
      String errorPreferencesState});
}

/// @nodoc
class __$$PreferencesStateImplCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res, _$PreferencesStateImpl>
    implements _$$PreferencesStateImplCopyWith<$Res> {
  __$$PreferencesStateImplCopyWithImpl(_$PreferencesStateImpl _value,
      $Res Function(_$PreferencesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incognito = null,
    Object? bitcoinStandard = null,
    Object? preferredBitcoinUnit = null,
    Object? preferredExchange = null,
    Object? preferredFiatUnit = null,
    Object? errorPreferencesState = null,
  }) {
    return _then(_$PreferencesStateImpl(
      incognito: null == incognito
          ? _value.incognito
          : incognito // ignore: cast_nullable_to_non_nullable
              as bool,
      bitcoinStandard: null == bitcoinStandard
          ? _value.bitcoinStandard
          : bitcoinStandard // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredBitcoinUnit: null == preferredBitcoinUnit
          ? _value.preferredBitcoinUnit
          : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
              as String,
      preferredExchange: null == preferredExchange
          ? _value.preferredExchange
          : preferredExchange // ignore: cast_nullable_to_non_nullable
              as String,
      preferredFiatUnit: null == preferredFiatUnit
          ? _value.preferredFiatUnit
          : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
              as String,
      errorPreferencesState: null == errorPreferencesState
          ? _value.errorPreferencesState
          : errorPreferencesState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PreferencesStateImpl extends _PreferencesState {
  const _$PreferencesStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesStateImpl &&
            (identical(other.incognito, incognito) ||
                other.incognito == incognito) &&
            (identical(other.bitcoinStandard, bitcoinStandard) ||
                other.bitcoinStandard == bitcoinStandard) &&
            (identical(other.preferredBitcoinUnit, preferredBitcoinUnit) ||
                other.preferredBitcoinUnit == preferredBitcoinUnit) &&
            (identical(other.preferredExchange, preferredExchange) ||
                other.preferredExchange == preferredExchange) &&
            (identical(other.preferredFiatUnit, preferredFiatUnit) ||
                other.preferredFiatUnit == preferredFiatUnit) &&
            (identical(other.errorPreferencesState, errorPreferencesState) ||
                other.errorPreferencesState == errorPreferencesState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      incognito,
      bitcoinStandard,
      preferredBitcoinUnit,
      preferredExchange,
      preferredFiatUnit,
      errorPreferencesState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesStateImplCopyWith<_$PreferencesStateImpl> get copyWith =>
      __$$PreferencesStateImplCopyWithImpl<_$PreferencesStateImpl>(
          this, _$identity);
}

abstract class _PreferencesState extends PreferencesState {
  const factory _PreferencesState(
      {final bool incognito,
      final bool bitcoinStandard,
      final String preferredBitcoinUnit,
      final String preferredExchange,
      final String preferredFiatUnit,
      final String errorPreferencesState}) = _$PreferencesStateImpl;
  const _PreferencesState._() : super._();

  @override
  bool get incognito;
  @override
  bool get bitcoinStandard;
  @override
  String get preferredBitcoinUnit;
  @override
  String get preferredExchange;
  @override
  String get preferredFiatUnit;
  @override
  String get errorPreferencesState;
  @override
  @JsonKey(ignore: true)
  _$$PreferencesStateImplCopyWith<_$PreferencesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
