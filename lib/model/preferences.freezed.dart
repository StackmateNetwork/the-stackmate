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
      _$PreferencesCopyWithImpl<$Res, Preferences>;
  @useResult
  $Res call(
      {@HiveField(0) bool incognito,
      @HiveField(1) bool bitcoinStandard,
      @HiveField(2) String preferredBitcoinUnit,
      @HiveField(3) String preferredExchange,
      @HiveField(4) String preferredFiatUnit});
}

/// @nodoc
class _$PreferencesCopyWithImpl<$Res, $Val extends Preferences>
    implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferencesImplCopyWith<$Res>
    implements $PreferencesCopyWith<$Res> {
  factory _$$PreferencesImplCopyWith(
          _$PreferencesImpl value, $Res Function(_$PreferencesImpl) then) =
      __$$PreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool incognito,
      @HiveField(1) bool bitcoinStandard,
      @HiveField(2) String preferredBitcoinUnit,
      @HiveField(3) String preferredExchange,
      @HiveField(4) String preferredFiatUnit});
}

/// @nodoc
class __$$PreferencesImplCopyWithImpl<$Res>
    extends _$PreferencesCopyWithImpl<$Res, _$PreferencesImpl>
    implements _$$PreferencesImplCopyWith<$Res> {
  __$$PreferencesImplCopyWithImpl(
      _$PreferencesImpl _value, $Res Function(_$PreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incognito = null,
    Object? bitcoinStandard = null,
    Object? preferredBitcoinUnit = null,
    Object? preferredExchange = null,
    Object? preferredFiatUnit = null,
  }) {
    return _then(_$PreferencesImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'PreferencesClassAdapter')
class _$PreferencesImpl extends _Preferences {
  const _$PreferencesImpl(
      {@HiveField(0) required this.incognito,
      @HiveField(1) required this.bitcoinStandard,
      @HiveField(2) required this.preferredBitcoinUnit,
      @HiveField(3) required this.preferredExchange,
      @HiveField(4) required this.preferredFiatUnit})
      : super._();

  factory _$PreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesImpl &&
            (identical(other.incognito, incognito) ||
                other.incognito == incognito) &&
            (identical(other.bitcoinStandard, bitcoinStandard) ||
                other.bitcoinStandard == bitcoinStandard) &&
            (identical(other.preferredBitcoinUnit, preferredBitcoinUnit) ||
                other.preferredBitcoinUnit == preferredBitcoinUnit) &&
            (identical(other.preferredExchange, preferredExchange) ||
                other.preferredExchange == preferredExchange) &&
            (identical(other.preferredFiatUnit, preferredFiatUnit) ||
                other.preferredFiatUnit == preferredFiatUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, incognito, bitcoinStandard,
      preferredBitcoinUnit, preferredExchange, preferredFiatUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesImplCopyWith<_$PreferencesImpl> get copyWith =>
      __$$PreferencesImplCopyWithImpl<_$PreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesImplToJson(
      this,
    );
  }
}

abstract class _Preferences extends Preferences {
  const factory _Preferences(
          {@HiveField(0) required final bool incognito,
          @HiveField(1) required final bool bitcoinStandard,
          @HiveField(2) required final String preferredBitcoinUnit,
          @HiveField(3) required final String preferredExchange,
          @HiveField(4) required final String preferredFiatUnit}) =
      _$PreferencesImpl;
  const _Preferences._() : super._();

  factory _Preferences.fromJson(Map<String, dynamic> json) =
      _$PreferencesImpl.fromJson;

  @override
  @HiveField(0)
  bool get incognito;
  @override
  @HiveField(1)
  bool get bitcoinStandard;
  @override
  @HiveField(2)
  String get preferredBitcoinUnit;
  @override
  @HiveField(3)
  String get preferredExchange;
  @override
  @HiveField(4)
  String get preferredFiatUnit;
  @override
  @JsonKey(ignore: true)
  _$$PreferencesImplCopyWith<_$PreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
