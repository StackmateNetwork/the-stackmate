// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'send.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SendStateTearOff {
  const _$SendStateTearOff();

  _SendState call(
      {SendSteps currentStep = SendSteps.address,
      bool loadingStart = true,
      bool calculatingFees = false,
      bool buildingTx = false,
      bool sendingTx = false,
      String errLoading = '',
      String errAddress = '',
      String errSending = '',
      String errAmount = '',
      String errFees = '',
      String policyPath = '',
      String txOutputs = '',
      String address = '',
      String amount = '',
      int weight = 0,
      String fees = '',
      int? feeSlow,
      int? feeMedium,
      int? feeFast,
      int? balance,
      int feesOption = 1,
      String psbt = '',
      String txId = '',
      int? finalFee,
      int? finalAmount,
      bool sweepWallet = false}) {
    return _SendState(
      currentStep: currentStep,
      loadingStart: loadingStart,
      calculatingFees: calculatingFees,
      buildingTx: buildingTx,
      sendingTx: sendingTx,
      errLoading: errLoading,
      errAddress: errAddress,
      errSending: errSending,
      errAmount: errAmount,
      errFees: errFees,
      policyPath: policyPath,
      txOutputs: txOutputs,
      address: address,
      amount: amount,
      weight: weight,
      fees: fees,
      feeSlow: feeSlow,
      feeMedium: feeMedium,
      feeFast: feeFast,
      balance: balance,
      feesOption: feesOption,
      psbt: psbt,
      txId: txId,
      finalFee: finalFee,
      finalAmount: finalAmount,
      sweepWallet: sweepWallet,
    );
  }
}

/// @nodoc
const $SendState = _$SendStateTearOff();

/// @nodoc
mixin _$SendState {
  SendSteps get currentStep => throw _privateConstructorUsedError;
  bool get loadingStart => throw _privateConstructorUsedError;
  bool get calculatingFees => throw _privateConstructorUsedError;
  bool get buildingTx => throw _privateConstructorUsedError;
  bool get sendingTx => throw _privateConstructorUsedError;
  String get errLoading => throw _privateConstructorUsedError;
  String get errAddress => throw _privateConstructorUsedError;
  String get errSending => throw _privateConstructorUsedError;
  String get errAmount => throw _privateConstructorUsedError;
  String get errFees => throw _privateConstructorUsedError;
  String get policyPath => throw _privateConstructorUsedError;
  String get txOutputs => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get fees => throw _privateConstructorUsedError;
  int? get feeSlow => throw _privateConstructorUsedError;
  int? get feeMedium => throw _privateConstructorUsedError;
  int? get feeFast => throw _privateConstructorUsedError;
  int? get balance => throw _privateConstructorUsedError;
  int get feesOption => throw _privateConstructorUsedError;
  String get psbt => throw _privateConstructorUsedError;
  String get txId => throw _privateConstructorUsedError;
  int? get finalFee => throw _privateConstructorUsedError;
  int? get finalAmount => throw _privateConstructorUsedError;
  bool get sweepWallet => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendStateCopyWith<SendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendStateCopyWith<$Res> {
  factory $SendStateCopyWith(SendState value, $Res Function(SendState) then) =
      _$SendStateCopyWithImpl<$Res>;
  $Res call(
      {SendSteps currentStep,
      bool loadingStart,
      bool calculatingFees,
      bool buildingTx,
      bool sendingTx,
      String errLoading,
      String errAddress,
      String errSending,
      String errAmount,
      String errFees,
      String policyPath,
      String txOutputs,
      String address,
      String amount,
      int weight,
      String fees,
      int? feeSlow,
      int? feeMedium,
      int? feeFast,
      int? balance,
      int feesOption,
      String psbt,
      String txId,
      int? finalFee,
      int? finalAmount,
      bool sweepWallet});
}

/// @nodoc
class _$SendStateCopyWithImpl<$Res> implements $SendStateCopyWith<$Res> {
  _$SendStateCopyWithImpl(this._value, this._then);

  final SendState _value;
  // ignore: unused_field
  final $Res Function(SendState) _then;

  @override
  $Res call({
    Object? currentStep = freezed,
    Object? loadingStart = freezed,
    Object? calculatingFees = freezed,
    Object? buildingTx = freezed,
    Object? sendingTx = freezed,
    Object? errLoading = freezed,
    Object? errAddress = freezed,
    Object? errSending = freezed,
    Object? errAmount = freezed,
    Object? errFees = freezed,
    Object? policyPath = freezed,
    Object? txOutputs = freezed,
    Object? address = freezed,
    Object? amount = freezed,
    Object? weight = freezed,
    Object? fees = freezed,
    Object? feeSlow = freezed,
    Object? feeMedium = freezed,
    Object? feeFast = freezed,
    Object? balance = freezed,
    Object? feesOption = freezed,
    Object? psbt = freezed,
    Object? txId = freezed,
    Object? finalFee = freezed,
    Object? finalAmount = freezed,
    Object? sweepWallet = freezed,
  }) {
    return _then(_value.copyWith(
      currentStep: currentStep == freezed
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as SendSteps,
      loadingStart: loadingStart == freezed
          ? _value.loadingStart
          : loadingStart // ignore: cast_nullable_to_non_nullable
              as bool,
      calculatingFees: calculatingFees == freezed
          ? _value.calculatingFees
          : calculatingFees // ignore: cast_nullable_to_non_nullable
              as bool,
      buildingTx: buildingTx == freezed
          ? _value.buildingTx
          : buildingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      sendingTx: sendingTx == freezed
          ? _value.sendingTx
          : sendingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoading: errLoading == freezed
          ? _value.errLoading
          : errLoading // ignore: cast_nullable_to_non_nullable
              as String,
      errAddress: errAddress == freezed
          ? _value.errAddress
          : errAddress // ignore: cast_nullable_to_non_nullable
              as String,
      errSending: errSending == freezed
          ? _value.errSending
          : errSending // ignore: cast_nullable_to_non_nullable
              as String,
      errAmount: errAmount == freezed
          ? _value.errAmount
          : errAmount // ignore: cast_nullable_to_non_nullable
              as String,
      errFees: errFees == freezed
          ? _value.errFees
          : errFees // ignore: cast_nullable_to_non_nullable
              as String,
      policyPath: policyPath == freezed
          ? _value.policyPath
          : policyPath // ignore: cast_nullable_to_non_nullable
              as String,
      txOutputs: txOutputs == freezed
          ? _value.txOutputs
          : txOutputs // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      fees: fees == freezed
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String,
      feeSlow: feeSlow == freezed
          ? _value.feeSlow
          : feeSlow // ignore: cast_nullable_to_non_nullable
              as int?,
      feeMedium: feeMedium == freezed
          ? _value.feeMedium
          : feeMedium // ignore: cast_nullable_to_non_nullable
              as int?,
      feeFast: feeFast == freezed
          ? _value.feeFast
          : feeFast // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      feesOption: feesOption == freezed
          ? _value.feesOption
          : feesOption // ignore: cast_nullable_to_non_nullable
              as int,
      psbt: psbt == freezed
          ? _value.psbt
          : psbt // ignore: cast_nullable_to_non_nullable
              as String,
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String,
      finalFee: finalFee == freezed
          ? _value.finalFee
          : finalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: finalAmount == freezed
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      sweepWallet: sweepWallet == freezed
          ? _value.sweepWallet
          : sweepWallet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SendStateCopyWith<$Res> implements $SendStateCopyWith<$Res> {
  factory _$SendStateCopyWith(
          _SendState value, $Res Function(_SendState) then) =
      __$SendStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SendSteps currentStep,
      bool loadingStart,
      bool calculatingFees,
      bool buildingTx,
      bool sendingTx,
      String errLoading,
      String errAddress,
      String errSending,
      String errAmount,
      String errFees,
      String policyPath,
      String txOutputs,
      String address,
      String amount,
      int weight,
      String fees,
      int? feeSlow,
      int? feeMedium,
      int? feeFast,
      int? balance,
      int feesOption,
      String psbt,
      String txId,
      int? finalFee,
      int? finalAmount,
      bool sweepWallet});
}

/// @nodoc
class __$SendStateCopyWithImpl<$Res> extends _$SendStateCopyWithImpl<$Res>
    implements _$SendStateCopyWith<$Res> {
  __$SendStateCopyWithImpl(_SendState _value, $Res Function(_SendState) _then)
      : super(_value, (v) => _then(v as _SendState));

  @override
  _SendState get _value => super._value as _SendState;

  @override
  $Res call({
    Object? currentStep = freezed,
    Object? loadingStart = freezed,
    Object? calculatingFees = freezed,
    Object? buildingTx = freezed,
    Object? sendingTx = freezed,
    Object? errLoading = freezed,
    Object? errAddress = freezed,
    Object? errSending = freezed,
    Object? errAmount = freezed,
    Object? errFees = freezed,
    Object? policyPath = freezed,
    Object? txOutputs = freezed,
    Object? address = freezed,
    Object? amount = freezed,
    Object? weight = freezed,
    Object? fees = freezed,
    Object? feeSlow = freezed,
    Object? feeMedium = freezed,
    Object? feeFast = freezed,
    Object? balance = freezed,
    Object? feesOption = freezed,
    Object? psbt = freezed,
    Object? txId = freezed,
    Object? finalFee = freezed,
    Object? finalAmount = freezed,
    Object? sweepWallet = freezed,
  }) {
    return _then(_SendState(
      currentStep: currentStep == freezed
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as SendSteps,
      loadingStart: loadingStart == freezed
          ? _value.loadingStart
          : loadingStart // ignore: cast_nullable_to_non_nullable
              as bool,
      calculatingFees: calculatingFees == freezed
          ? _value.calculatingFees
          : calculatingFees // ignore: cast_nullable_to_non_nullable
              as bool,
      buildingTx: buildingTx == freezed
          ? _value.buildingTx
          : buildingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      sendingTx: sendingTx == freezed
          ? _value.sendingTx
          : sendingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoading: errLoading == freezed
          ? _value.errLoading
          : errLoading // ignore: cast_nullable_to_non_nullable
              as String,
      errAddress: errAddress == freezed
          ? _value.errAddress
          : errAddress // ignore: cast_nullable_to_non_nullable
              as String,
      errSending: errSending == freezed
          ? _value.errSending
          : errSending // ignore: cast_nullable_to_non_nullable
              as String,
      errAmount: errAmount == freezed
          ? _value.errAmount
          : errAmount // ignore: cast_nullable_to_non_nullable
              as String,
      errFees: errFees == freezed
          ? _value.errFees
          : errFees // ignore: cast_nullable_to_non_nullable
              as String,
      policyPath: policyPath == freezed
          ? _value.policyPath
          : policyPath // ignore: cast_nullable_to_non_nullable
              as String,
      txOutputs: txOutputs == freezed
          ? _value.txOutputs
          : txOutputs // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      fees: fees == freezed
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String,
      feeSlow: feeSlow == freezed
          ? _value.feeSlow
          : feeSlow // ignore: cast_nullable_to_non_nullable
              as int?,
      feeMedium: feeMedium == freezed
          ? _value.feeMedium
          : feeMedium // ignore: cast_nullable_to_non_nullable
              as int?,
      feeFast: feeFast == freezed
          ? _value.feeFast
          : feeFast // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      feesOption: feesOption == freezed
          ? _value.feesOption
          : feesOption // ignore: cast_nullable_to_non_nullable
              as int,
      psbt: psbt == freezed
          ? _value.psbt
          : psbt // ignore: cast_nullable_to_non_nullable
              as String,
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String,
      finalFee: finalFee == freezed
          ? _value.finalFee
          : finalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: finalAmount == freezed
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      sweepWallet: sweepWallet == freezed
          ? _value.sweepWallet
          : sweepWallet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SendState extends _SendState with DiagnosticableTreeMixin {
  const _$_SendState(
      {this.currentStep = SendSteps.address,
      this.loadingStart = true,
      this.calculatingFees = false,
      this.buildingTx = false,
      this.sendingTx = false,
      this.errLoading = '',
      this.errAddress = '',
      this.errSending = '',
      this.errAmount = '',
      this.errFees = '',
      this.policyPath = '',
      this.txOutputs = '',
      this.address = '',
      this.amount = '',
      this.weight = 0,
      this.fees = '',
      this.feeSlow,
      this.feeMedium,
      this.feeFast,
      this.balance,
      this.feesOption = 1,
      this.psbt = '',
      this.txId = '',
      this.finalFee,
      this.finalAmount,
      this.sweepWallet = false})
      : super._();

  @JsonKey(defaultValue: SendSteps.address)
  @override
  final SendSteps currentStep;
  @JsonKey(defaultValue: true)
  @override
  final bool loadingStart;
  @JsonKey(defaultValue: false)
  @override
  final bool calculatingFees;
  @JsonKey(defaultValue: false)
  @override
  final bool buildingTx;
  @JsonKey(defaultValue: false)
  @override
  final bool sendingTx;
  @JsonKey(defaultValue: '')
  @override
  final String errLoading;
  @JsonKey(defaultValue: '')
  @override
  final String errAddress;
  @JsonKey(defaultValue: '')
  @override
  final String errSending;
  @JsonKey(defaultValue: '')
  @override
  final String errAmount;
  @JsonKey(defaultValue: '')
  @override
  final String errFees;
  @JsonKey(defaultValue: '')
  @override
  final String policyPath;
  @JsonKey(defaultValue: '')
  @override
  final String txOutputs;
  @JsonKey(defaultValue: '')
  @override
  final String address;
  @JsonKey(defaultValue: '')
  @override
  final String amount;
  @JsonKey(defaultValue: 0)
  @override
  final int weight;
  @JsonKey(defaultValue: '')
  @override
  final String fees;
  @override
  final int? feeSlow;
  @override
  final int? feeMedium;
  @override
  final int? feeFast;
  @override
  final int? balance;
  @JsonKey(defaultValue: 1)
  @override
  final int feesOption;
  @JsonKey(defaultValue: '')
  @override
  final String psbt;
  @JsonKey(defaultValue: '')
  @override
  final String txId;
  @override
  final int? finalFee;
  @override
  final int? finalAmount;
  @JsonKey(defaultValue: false)
  @override
  final bool sweepWallet;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendState(currentStep: $currentStep, loadingStart: $loadingStart, calculatingFees: $calculatingFees, buildingTx: $buildingTx, sendingTx: $sendingTx, errLoading: $errLoading, errAddress: $errAddress, errSending: $errSending, errAmount: $errAmount, errFees: $errFees, policyPath: $policyPath, txOutputs: $txOutputs, address: $address, amount: $amount, weight: $weight, fees: $fees, feeSlow: $feeSlow, feeMedium: $feeMedium, feeFast: $feeFast, balance: $balance, feesOption: $feesOption, psbt: $psbt, txId: $txId, finalFee: $finalFee, finalAmount: $finalAmount, sweepWallet: $sweepWallet)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendState'))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('loadingStart', loadingStart))
      ..add(DiagnosticsProperty('calculatingFees', calculatingFees))
      ..add(DiagnosticsProperty('buildingTx', buildingTx))
      ..add(DiagnosticsProperty('sendingTx', sendingTx))
      ..add(DiagnosticsProperty('errLoading', errLoading))
      ..add(DiagnosticsProperty('errAddress', errAddress))
      ..add(DiagnosticsProperty('errSending', errSending))
      ..add(DiagnosticsProperty('errAmount', errAmount))
      ..add(DiagnosticsProperty('errFees', errFees))
      ..add(DiagnosticsProperty('policyPath', policyPath))
      ..add(DiagnosticsProperty('txOutputs', txOutputs))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('fees', fees))
      ..add(DiagnosticsProperty('feeSlow', feeSlow))
      ..add(DiagnosticsProperty('feeMedium', feeMedium))
      ..add(DiagnosticsProperty('feeFast', feeFast))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('feesOption', feesOption))
      ..add(DiagnosticsProperty('psbt', psbt))
      ..add(DiagnosticsProperty('txId', txId))
      ..add(DiagnosticsProperty('finalFee', finalFee))
      ..add(DiagnosticsProperty('finalAmount', finalAmount))
      ..add(DiagnosticsProperty('sweepWallet', sweepWallet));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendState &&
            (identical(other.currentStep, currentStep) ||
                const DeepCollectionEquality()
                    .equals(other.currentStep, currentStep)) &&
            (identical(other.loadingStart, loadingStart) ||
                const DeepCollectionEquality()
                    .equals(other.loadingStart, loadingStart)) &&
            (identical(other.calculatingFees, calculatingFees) ||
                const DeepCollectionEquality()
                    .equals(other.calculatingFees, calculatingFees)) &&
            (identical(other.buildingTx, buildingTx) ||
                const DeepCollectionEquality()
                    .equals(other.buildingTx, buildingTx)) &&
            (identical(other.sendingTx, sendingTx) ||
                const DeepCollectionEquality()
                    .equals(other.sendingTx, sendingTx)) &&
            (identical(other.errLoading, errLoading) ||
                const DeepCollectionEquality()
                    .equals(other.errLoading, errLoading)) &&
            (identical(other.errAddress, errAddress) ||
                const DeepCollectionEquality()
                    .equals(other.errAddress, errAddress)) &&
            (identical(other.errSending, errSending) ||
                const DeepCollectionEquality()
                    .equals(other.errSending, errSending)) &&
            (identical(other.errAmount, errAmount) ||
                const DeepCollectionEquality()
                    .equals(other.errAmount, errAmount)) &&
            (identical(other.errFees, errFees) ||
                const DeepCollectionEquality()
                    .equals(other.errFees, errFees)) &&
            (identical(other.policyPath, policyPath) ||
                const DeepCollectionEquality()
                    .equals(other.policyPath, policyPath)) &&
            (identical(other.txOutputs, txOutputs) ||
                const DeepCollectionEquality()
                    .equals(other.txOutputs, txOutputs)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.fees, fees) ||
                const DeepCollectionEquality().equals(other.fees, fees)) &&
            (identical(other.feeSlow, feeSlow) ||
                const DeepCollectionEquality()
                    .equals(other.feeSlow, feeSlow)) &&
            (identical(other.feeMedium, feeMedium) ||
                const DeepCollectionEquality()
                    .equals(other.feeMedium, feeMedium)) &&
            (identical(other.feeFast, feeFast) ||
                const DeepCollectionEquality()
                    .equals(other.feeFast, feeFast)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.feesOption, feesOption) ||
                const DeepCollectionEquality()
                    .equals(other.feesOption, feesOption)) &&
            (identical(other.psbt, psbt) ||
                const DeepCollectionEquality().equals(other.psbt, psbt)) &&
            (identical(other.txId, txId) ||
                const DeepCollectionEquality().equals(other.txId, txId)) &&
            (identical(other.finalFee, finalFee) ||
                const DeepCollectionEquality()
                    .equals(other.finalFee, finalFee)) &&
            (identical(other.finalAmount, finalAmount) || const DeepCollectionEquality().equals(other.finalAmount, finalAmount)) &&
            (identical(other.sweepWallet, sweepWallet) || const DeepCollectionEquality().equals(other.sweepWallet, sweepWallet)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentStep) ^
      const DeepCollectionEquality().hash(loadingStart) ^
      const DeepCollectionEquality().hash(calculatingFees) ^
      const DeepCollectionEquality().hash(buildingTx) ^
      const DeepCollectionEquality().hash(sendingTx) ^
      const DeepCollectionEquality().hash(errLoading) ^
      const DeepCollectionEquality().hash(errAddress) ^
      const DeepCollectionEquality().hash(errSending) ^
      const DeepCollectionEquality().hash(errAmount) ^
      const DeepCollectionEquality().hash(errFees) ^
      const DeepCollectionEquality().hash(policyPath) ^
      const DeepCollectionEquality().hash(txOutputs) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(fees) ^
      const DeepCollectionEquality().hash(feeSlow) ^
      const DeepCollectionEquality().hash(feeMedium) ^
      const DeepCollectionEquality().hash(feeFast) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(feesOption) ^
      const DeepCollectionEquality().hash(psbt) ^
      const DeepCollectionEquality().hash(txId) ^
      const DeepCollectionEquality().hash(finalFee) ^
      const DeepCollectionEquality().hash(finalAmount) ^
      const DeepCollectionEquality().hash(sweepWallet);

  @JsonKey(ignore: true)
  @override
  _$SendStateCopyWith<_SendState> get copyWith =>
      __$SendStateCopyWithImpl<_SendState>(this, _$identity);
}

abstract class _SendState extends SendState {
  const factory _SendState(
      {SendSteps currentStep,
      bool loadingStart,
      bool calculatingFees,
      bool buildingTx,
      bool sendingTx,
      String errLoading,
      String errAddress,
      String errSending,
      String errAmount,
      String errFees,
      String policyPath,
      String txOutputs,
      String address,
      String amount,
      int weight,
      String fees,
      int? feeSlow,
      int? feeMedium,
      int? feeFast,
      int? balance,
      int feesOption,
      String psbt,
      String txId,
      int? finalFee,
      int? finalAmount,
      bool sweepWallet}) = _$_SendState;
  const _SendState._() : super._();

  @override
  SendSteps get currentStep => throw _privateConstructorUsedError;
  @override
  bool get loadingStart => throw _privateConstructorUsedError;
  @override
  bool get calculatingFees => throw _privateConstructorUsedError;
  @override
  bool get buildingTx => throw _privateConstructorUsedError;
  @override
  bool get sendingTx => throw _privateConstructorUsedError;
  @override
  String get errLoading => throw _privateConstructorUsedError;
  @override
  String get errAddress => throw _privateConstructorUsedError;
  @override
  String get errSending => throw _privateConstructorUsedError;
  @override
  String get errAmount => throw _privateConstructorUsedError;
  @override
  String get errFees => throw _privateConstructorUsedError;
  @override
  String get policyPath => throw _privateConstructorUsedError;
  @override
  String get txOutputs => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get amount => throw _privateConstructorUsedError;
  @override
  int get weight => throw _privateConstructorUsedError;
  @override
  String get fees => throw _privateConstructorUsedError;
  @override
  int? get feeSlow => throw _privateConstructorUsedError;
  @override
  int? get feeMedium => throw _privateConstructorUsedError;
  @override
  int? get feeFast => throw _privateConstructorUsedError;
  @override
  int? get balance => throw _privateConstructorUsedError;
  @override
  int get feesOption => throw _privateConstructorUsedError;
  @override
  String get psbt => throw _privateConstructorUsedError;
  @override
  String get txId => throw _privateConstructorUsedError;
  @override
  int? get finalFee => throw _privateConstructorUsedError;
  @override
  int? get finalAmount => throw _privateConstructorUsedError;
  @override
  bool get sweepWallet => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SendStateCopyWith<_SendState> get copyWith =>
      throw _privateConstructorUsedError;
}
