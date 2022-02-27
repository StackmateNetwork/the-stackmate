// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calculator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalculatorStateTearOff {
  const _$CalculatorStateTearOff();

  _CalculatorState call(
      {bool btcSelected = false,
      Rate? selectedRate,
      String currencyAmt = '0',
      String satsAmt = '0',
      bool editingBtc = true,
      List<Rate>? rates,
      bool loadingRates = false,
      String loadingRatesError = ''}) {
    return _CalculatorState(
      btcSelected: btcSelected,
      selectedRate: selectedRate,
      currencyAmt: currencyAmt,
      satsAmt: satsAmt,
      editingBtc: editingBtc,
      rates: rates,
      loadingRates: loadingRates,
      loadingRatesError: loadingRatesError,
    );
  }
}

/// @nodoc
const $CalculatorState = _$CalculatorStateTearOff();

/// @nodoc
mixin _$CalculatorState {
  bool get btcSelected => throw _privateConstructorUsedError;
  Rate? get selectedRate => throw _privateConstructorUsedError;
  String get currencyAmt => throw _privateConstructorUsedError;
  String get satsAmt => throw _privateConstructorUsedError;
  bool get editingBtc => throw _privateConstructorUsedError;
  List<Rate>? get rates => throw _privateConstructorUsedError;
  bool get loadingRates => throw _privateConstructorUsedError;
  String get loadingRatesError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res>;
  $Res call(
      {bool btcSelected,
      Rate? selectedRate,
      String currencyAmt,
      String satsAmt,
      bool editingBtc,
      List<Rate>? rates,
      bool loadingRates,
      String loadingRatesError});

  $RateCopyWith<$Res>? get selectedRate;
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  final CalculatorState _value;
  // ignore: unused_field
  final $Res Function(CalculatorState) _then;

  @override
  $Res call({
    Object? btcSelected = freezed,
    Object? selectedRate = freezed,
    Object? currencyAmt = freezed,
    Object? satsAmt = freezed,
    Object? editingBtc = freezed,
    Object? rates = freezed,
    Object? loadingRates = freezed,
    Object? loadingRatesError = freezed,
  }) {
    return _then(_value.copyWith(
      btcSelected: btcSelected == freezed
          ? _value.btcSelected
          : btcSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRate: selectedRate == freezed
          ? _value.selectedRate
          : selectedRate // ignore: cast_nullable_to_non_nullable
              as Rate?,
      currencyAmt: currencyAmt == freezed
          ? _value.currencyAmt
          : currencyAmt // ignore: cast_nullable_to_non_nullable
              as String,
      satsAmt: satsAmt == freezed
          ? _value.satsAmt
          : satsAmt // ignore: cast_nullable_to_non_nullable
              as String,
      editingBtc: editingBtc == freezed
          ? _value.editingBtc
          : editingBtc // ignore: cast_nullable_to_non_nullable
              as bool,
      rates: rates == freezed
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>?,
      loadingRates: loadingRates == freezed
          ? _value.loadingRates
          : loadingRates // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingRatesError: loadingRatesError == freezed
          ? _value.loadingRatesError
          : loadingRatesError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $RateCopyWith<$Res>? get selectedRate {
    if (_value.selectedRate == null) {
      return null;
    }

    return $RateCopyWith<$Res>(_value.selectedRate!, (value) {
      return _then(_value.copyWith(selectedRate: value));
    });
  }
}

/// @nodoc
abstract class _$CalculatorStateCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$CalculatorStateCopyWith(
          _CalculatorState value, $Res Function(_CalculatorState) then) =
      __$CalculatorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool btcSelected,
      Rate? selectedRate,
      String currencyAmt,
      String satsAmt,
      bool editingBtc,
      List<Rate>? rates,
      bool loadingRates,
      String loadingRatesError});

  @override
  $RateCopyWith<$Res>? get selectedRate;
}

/// @nodoc
class __$CalculatorStateCopyWithImpl<$Res>
    extends _$CalculatorStateCopyWithImpl<$Res>
    implements _$CalculatorStateCopyWith<$Res> {
  __$CalculatorStateCopyWithImpl(
      _CalculatorState _value, $Res Function(_CalculatorState) _then)
      : super(_value, (v) => _then(v as _CalculatorState));

  @override
  _CalculatorState get _value => super._value as _CalculatorState;

  @override
  $Res call({
    Object? btcSelected = freezed,
    Object? selectedRate = freezed,
    Object? currencyAmt = freezed,
    Object? satsAmt = freezed,
    Object? editingBtc = freezed,
    Object? rates = freezed,
    Object? loadingRates = freezed,
    Object? loadingRatesError = freezed,
  }) {
    return _then(_CalculatorState(
      btcSelected: btcSelected == freezed
          ? _value.btcSelected
          : btcSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRate: selectedRate == freezed
          ? _value.selectedRate
          : selectedRate // ignore: cast_nullable_to_non_nullable
              as Rate?,
      currencyAmt: currencyAmt == freezed
          ? _value.currencyAmt
          : currencyAmt // ignore: cast_nullable_to_non_nullable
              as String,
      satsAmt: satsAmt == freezed
          ? _value.satsAmt
          : satsAmt // ignore: cast_nullable_to_non_nullable
              as String,
      editingBtc: editingBtc == freezed
          ? _value.editingBtc
          : editingBtc // ignore: cast_nullable_to_non_nullable
              as bool,
      rates: rates == freezed
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>?,
      loadingRates: loadingRates == freezed
          ? _value.loadingRates
          : loadingRates // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingRatesError: loadingRatesError == freezed
          ? _value.loadingRatesError
          : loadingRatesError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CalculatorState implements _CalculatorState {
  const _$_CalculatorState(
      {this.btcSelected = false,
      this.selectedRate,
      this.currencyAmt = '0',
      this.satsAmt = '0',
      this.editingBtc = true,
      this.rates,
      this.loadingRates = false,
      this.loadingRatesError = ''});

  @JsonKey(defaultValue: false)
  @override
  final bool btcSelected;
  @override
  final Rate? selectedRate;
  @JsonKey(defaultValue: '0')
  @override
  final String currencyAmt;
  @JsonKey(defaultValue: '0')
  @override
  final String satsAmt;
  @JsonKey(defaultValue: true)
  @override
  final bool editingBtc;
  @override
  final List<Rate>? rates;
  @JsonKey(defaultValue: false)
  @override
  final bool loadingRates;
  @JsonKey(defaultValue: '')
  @override
  final String loadingRatesError;

  @override
  String toString() {
    return 'CalculatorState(btcSelected: $btcSelected, selectedRate: $selectedRate, currencyAmt: $currencyAmt, satsAmt: $satsAmt, editingBtc: $editingBtc, rates: $rates, loadingRates: $loadingRates, loadingRatesError: $loadingRatesError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalculatorState &&
            (identical(other.btcSelected, btcSelected) ||
                const DeepCollectionEquality()
                    .equals(other.btcSelected, btcSelected)) &&
            (identical(other.selectedRate, selectedRate) ||
                const DeepCollectionEquality()
                    .equals(other.selectedRate, selectedRate)) &&
            (identical(other.currencyAmt, currencyAmt) ||
                const DeepCollectionEquality()
                    .equals(other.currencyAmt, currencyAmt)) &&
            (identical(other.satsAmt, satsAmt) ||
                const DeepCollectionEquality()
                    .equals(other.satsAmt, satsAmt)) &&
            (identical(other.editingBtc, editingBtc) ||
                const DeepCollectionEquality()
                    .equals(other.editingBtc, editingBtc)) &&
            (identical(other.rates, rates) ||
                const DeepCollectionEquality().equals(other.rates, rates)) &&
            (identical(other.loadingRates, loadingRates) ||
                const DeepCollectionEquality()
                    .equals(other.loadingRates, loadingRates)) &&
            (identical(other.loadingRatesError, loadingRatesError) ||
                const DeepCollectionEquality()
                    .equals(other.loadingRatesError, loadingRatesError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(btcSelected) ^
      const DeepCollectionEquality().hash(selectedRate) ^
      const DeepCollectionEquality().hash(currencyAmt) ^
      const DeepCollectionEquality().hash(satsAmt) ^
      const DeepCollectionEquality().hash(editingBtc) ^
      const DeepCollectionEquality().hash(rates) ^
      const DeepCollectionEquality().hash(loadingRates) ^
      const DeepCollectionEquality().hash(loadingRatesError);

  @JsonKey(ignore: true)
  @override
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      __$CalculatorStateCopyWithImpl<_CalculatorState>(this, _$identity);
}

abstract class _CalculatorState implements CalculatorState {
  const factory _CalculatorState(
      {bool btcSelected,
      Rate? selectedRate,
      String currencyAmt,
      String satsAmt,
      bool editingBtc,
      List<Rate>? rates,
      bool loadingRates,
      String loadingRatesError}) = _$_CalculatorState;

  @override
  bool get btcSelected => throw _privateConstructorUsedError;
  @override
  Rate? get selectedRate => throw _privateConstructorUsedError;
  @override
  String get currencyAmt => throw _privateConstructorUsedError;
  @override
  String get satsAmt => throw _privateConstructorUsedError;
  @override
  bool get editingBtc => throw _privateConstructorUsedError;
  @override
  List<Rate>? get rates => throw _privateConstructorUsedError;
  @override
  bool get loadingRates => throw _privateConstructorUsedError;
  @override
  String get loadingRatesError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
