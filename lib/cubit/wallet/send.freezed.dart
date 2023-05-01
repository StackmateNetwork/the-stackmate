// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SendState {
  Wallet get wallet => throw _privateConstructorUsedError;
  SendSteps get currentStep => throw _privateConstructorUsedError;
  bool get loadingStart => throw _privateConstructorUsedError;
  bool get calculatingFees => throw _privateConstructorUsedError;
  bool get buildingTx => throw _privateConstructorUsedError;
  bool get sendingTx => throw _privateConstructorUsedError;
  bool? get permissionGranted => throw _privateConstructorUsedError;
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
      _$SendStateCopyWithImpl<$Res, SendState>;
  @useResult
  $Res call(
      {Wallet wallet,
      SendSteps currentStep,
      bool loadingStart,
      bool calculatingFees,
      bool buildingTx,
      bool sendingTx,
      bool? permissionGranted,
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

  $WalletCopyWith<$Res> get wallet;
}

/// @nodoc
class _$SendStateCopyWithImpl<$Res, $Val extends SendState>
    implements $SendStateCopyWith<$Res> {
  _$SendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? currentStep = null,
    Object? loadingStart = null,
    Object? calculatingFees = null,
    Object? buildingTx = null,
    Object? sendingTx = null,
    Object? permissionGranted = freezed,
    Object? errLoading = null,
    Object? errAddress = null,
    Object? errSending = null,
    Object? errAmount = null,
    Object? errFees = null,
    Object? policyPath = null,
    Object? txOutputs = null,
    Object? address = null,
    Object? amount = null,
    Object? weight = null,
    Object? fees = null,
    Object? feeSlow = freezed,
    Object? feeMedium = freezed,
    Object? feeFast = freezed,
    Object? balance = freezed,
    Object? feesOption = null,
    Object? psbt = null,
    Object? txId = null,
    Object? finalFee = freezed,
    Object? finalAmount = freezed,
    Object? sweepWallet = null,
  }) {
    return _then(_value.copyWith(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as SendSteps,
      loadingStart: null == loadingStart
          ? _value.loadingStart
          : loadingStart // ignore: cast_nullable_to_non_nullable
              as bool,
      calculatingFees: null == calculatingFees
          ? _value.calculatingFees
          : calculatingFees // ignore: cast_nullable_to_non_nullable
              as bool,
      buildingTx: null == buildingTx
          ? _value.buildingTx
          : buildingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      sendingTx: null == sendingTx
          ? _value.sendingTx
          : sendingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionGranted: freezed == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
      errLoading: null == errLoading
          ? _value.errLoading
          : errLoading // ignore: cast_nullable_to_non_nullable
              as String,
      errAddress: null == errAddress
          ? _value.errAddress
          : errAddress // ignore: cast_nullable_to_non_nullable
              as String,
      errSending: null == errSending
          ? _value.errSending
          : errSending // ignore: cast_nullable_to_non_nullable
              as String,
      errAmount: null == errAmount
          ? _value.errAmount
          : errAmount // ignore: cast_nullable_to_non_nullable
              as String,
      errFees: null == errFees
          ? _value.errFees
          : errFees // ignore: cast_nullable_to_non_nullable
              as String,
      policyPath: null == policyPath
          ? _value.policyPath
          : policyPath // ignore: cast_nullable_to_non_nullable
              as String,
      txOutputs: null == txOutputs
          ? _value.txOutputs
          : txOutputs // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String,
      feeSlow: freezed == feeSlow
          ? _value.feeSlow
          : feeSlow // ignore: cast_nullable_to_non_nullable
              as int?,
      feeMedium: freezed == feeMedium
          ? _value.feeMedium
          : feeMedium // ignore: cast_nullable_to_non_nullable
              as int?,
      feeFast: freezed == feeFast
          ? _value.feeFast
          : feeFast // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      feesOption: null == feesOption
          ? _value.feesOption
          : feesOption // ignore: cast_nullable_to_non_nullable
              as int,
      psbt: null == psbt
          ? _value.psbt
          : psbt // ignore: cast_nullable_to_non_nullable
              as String,
      txId: null == txId
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String,
      finalFee: freezed == finalFee
          ? _value.finalFee
          : finalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      sweepWallet: null == sweepWallet
          ? _value.sweepWallet
          : sweepWallet // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res> get wallet {
    return $WalletCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SendStateCopyWith<$Res> implements $SendStateCopyWith<$Res> {
  factory _$$_SendStateCopyWith(
          _$_SendState value, $Res Function(_$_SendState) then) =
      __$$_SendStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Wallet wallet,
      SendSteps currentStep,
      bool loadingStart,
      bool calculatingFees,
      bool buildingTx,
      bool sendingTx,
      bool? permissionGranted,
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

  @override
  $WalletCopyWith<$Res> get wallet;
}

/// @nodoc
class __$$_SendStateCopyWithImpl<$Res>
    extends _$SendStateCopyWithImpl<$Res, _$_SendState>
    implements _$$_SendStateCopyWith<$Res> {
  __$$_SendStateCopyWithImpl(
      _$_SendState _value, $Res Function(_$_SendState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? currentStep = null,
    Object? loadingStart = null,
    Object? calculatingFees = null,
    Object? buildingTx = null,
    Object? sendingTx = null,
    Object? permissionGranted = freezed,
    Object? errLoading = null,
    Object? errAddress = null,
    Object? errSending = null,
    Object? errAmount = null,
    Object? errFees = null,
    Object? policyPath = null,
    Object? txOutputs = null,
    Object? address = null,
    Object? amount = null,
    Object? weight = null,
    Object? fees = null,
    Object? feeSlow = freezed,
    Object? feeMedium = freezed,
    Object? feeFast = freezed,
    Object? balance = freezed,
    Object? feesOption = null,
    Object? psbt = null,
    Object? txId = null,
    Object? finalFee = freezed,
    Object? finalAmount = freezed,
    Object? sweepWallet = null,
  }) {
    return _then(_$_SendState(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as SendSteps,
      loadingStart: null == loadingStart
          ? _value.loadingStart
          : loadingStart // ignore: cast_nullable_to_non_nullable
              as bool,
      calculatingFees: null == calculatingFees
          ? _value.calculatingFees
          : calculatingFees // ignore: cast_nullable_to_non_nullable
              as bool,
      buildingTx: null == buildingTx
          ? _value.buildingTx
          : buildingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      sendingTx: null == sendingTx
          ? _value.sendingTx
          : sendingTx // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionGranted: freezed == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
      errLoading: null == errLoading
          ? _value.errLoading
          : errLoading // ignore: cast_nullable_to_non_nullable
              as String,
      errAddress: null == errAddress
          ? _value.errAddress
          : errAddress // ignore: cast_nullable_to_non_nullable
              as String,
      errSending: null == errSending
          ? _value.errSending
          : errSending // ignore: cast_nullable_to_non_nullable
              as String,
      errAmount: null == errAmount
          ? _value.errAmount
          : errAmount // ignore: cast_nullable_to_non_nullable
              as String,
      errFees: null == errFees
          ? _value.errFees
          : errFees // ignore: cast_nullable_to_non_nullable
              as String,
      policyPath: null == policyPath
          ? _value.policyPath
          : policyPath // ignore: cast_nullable_to_non_nullable
              as String,
      txOutputs: null == txOutputs
          ? _value.txOutputs
          : txOutputs // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String,
      feeSlow: freezed == feeSlow
          ? _value.feeSlow
          : feeSlow // ignore: cast_nullable_to_non_nullable
              as int?,
      feeMedium: freezed == feeMedium
          ? _value.feeMedium
          : feeMedium // ignore: cast_nullable_to_non_nullable
              as int?,
      feeFast: freezed == feeFast
          ? _value.feeFast
          : feeFast // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      feesOption: null == feesOption
          ? _value.feesOption
          : feesOption // ignore: cast_nullable_to_non_nullable
              as int,
      psbt: null == psbt
          ? _value.psbt
          : psbt // ignore: cast_nullable_to_non_nullable
              as String,
      txId: null == txId
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String,
      finalFee: freezed == finalFee
          ? _value.finalFee
          : finalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      sweepWallet: null == sweepWallet
          ? _value.sweepWallet
          : sweepWallet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SendState extends _SendState with DiagnosticableTreeMixin {
  const _$_SendState(
      {required this.wallet,
      this.currentStep = SendSteps.address,
      this.loadingStart = true,
      this.calculatingFees = false,
      this.buildingTx = false,
      this.sendingTx = false,
      this.permissionGranted,
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

  @override
  final Wallet wallet;
  @override
  @JsonKey()
  final SendSteps currentStep;
  @override
  @JsonKey()
  final bool loadingStart;
  @override
  @JsonKey()
  final bool calculatingFees;
  @override
  @JsonKey()
  final bool buildingTx;
  @override
  @JsonKey()
  final bool sendingTx;
  @override
  final bool? permissionGranted;
  @override
  @JsonKey()
  final String errLoading;
  @override
  @JsonKey()
  final String errAddress;
  @override
  @JsonKey()
  final String errSending;
  @override
  @JsonKey()
  final String errAmount;
  @override
  @JsonKey()
  final String errFees;
  @override
  @JsonKey()
  final String policyPath;
  @override
  @JsonKey()
  final String txOutputs;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final int weight;
  @override
  @JsonKey()
  final String fees;
  @override
  final int? feeSlow;
  @override
  final int? feeMedium;
  @override
  final int? feeFast;
  @override
  final int? balance;
  @override
  @JsonKey()
  final int feesOption;
  @override
  @JsonKey()
  final String psbt;
  @override
  @JsonKey()
  final String txId;
  @override
  final int? finalFee;
  @override
  final int? finalAmount;
  @override
  @JsonKey()
  final bool sweepWallet;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendState(wallet: $wallet, currentStep: $currentStep, loadingStart: $loadingStart, calculatingFees: $calculatingFees, buildingTx: $buildingTx, sendingTx: $sendingTx, permissionGranted: $permissionGranted, errLoading: $errLoading, errAddress: $errAddress, errSending: $errSending, errAmount: $errAmount, errFees: $errFees, policyPath: $policyPath, txOutputs: $txOutputs, address: $address, amount: $amount, weight: $weight, fees: $fees, feeSlow: $feeSlow, feeMedium: $feeMedium, feeFast: $feeFast, balance: $balance, feesOption: $feesOption, psbt: $psbt, txId: $txId, finalFee: $finalFee, finalAmount: $finalAmount, sweepWallet: $sweepWallet)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendState'))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('loadingStart', loadingStart))
      ..add(DiagnosticsProperty('calculatingFees', calculatingFees))
      ..add(DiagnosticsProperty('buildingTx', buildingTx))
      ..add(DiagnosticsProperty('sendingTx', sendingTx))
      ..add(DiagnosticsProperty('permissionGranted', permissionGranted))
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
        (other.runtimeType == runtimeType &&
            other is _$_SendState &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.loadingStart, loadingStart) ||
                other.loadingStart == loadingStart) &&
            (identical(other.calculatingFees, calculatingFees) ||
                other.calculatingFees == calculatingFees) &&
            (identical(other.buildingTx, buildingTx) ||
                other.buildingTx == buildingTx) &&
            (identical(other.sendingTx, sendingTx) ||
                other.sendingTx == sendingTx) &&
            (identical(other.permissionGranted, permissionGranted) ||
                other.permissionGranted == permissionGranted) &&
            (identical(other.errLoading, errLoading) ||
                other.errLoading == errLoading) &&
            (identical(other.errAddress, errAddress) ||
                other.errAddress == errAddress) &&
            (identical(other.errSending, errSending) ||
                other.errSending == errSending) &&
            (identical(other.errAmount, errAmount) ||
                other.errAmount == errAmount) &&
            (identical(other.errFees, errFees) || other.errFees == errFees) &&
            (identical(other.policyPath, policyPath) ||
                other.policyPath == policyPath) &&
            (identical(other.txOutputs, txOutputs) ||
                other.txOutputs == txOutputs) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.feeSlow, feeSlow) || other.feeSlow == feeSlow) &&
            (identical(other.feeMedium, feeMedium) ||
                other.feeMedium == feeMedium) &&
            (identical(other.feeFast, feeFast) || other.feeFast == feeFast) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.feesOption, feesOption) ||
                other.feesOption == feesOption) &&
            (identical(other.psbt, psbt) || other.psbt == psbt) &&
            (identical(other.txId, txId) || other.txId == txId) &&
            (identical(other.finalFee, finalFee) ||
                other.finalFee == finalFee) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.sweepWallet, sweepWallet) ||
                other.sweepWallet == sweepWallet));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        wallet,
        currentStep,
        loadingStart,
        calculatingFees,
        buildingTx,
        sendingTx,
        permissionGranted,
        errLoading,
        errAddress,
        errSending,
        errAmount,
        errFees,
        policyPath,
        txOutputs,
        address,
        amount,
        weight,
        fees,
        feeSlow,
        feeMedium,
        feeFast,
        balance,
        feesOption,
        psbt,
        txId,
        finalFee,
        finalAmount,
        sweepWallet
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendStateCopyWith<_$_SendState> get copyWith =>
      __$$_SendStateCopyWithImpl<_$_SendState>(this, _$identity);
}

abstract class _SendState extends SendState {
  const factory _SendState(
      {required final Wallet wallet,
      final SendSteps currentStep,
      final bool loadingStart,
      final bool calculatingFees,
      final bool buildingTx,
      final bool sendingTx,
      final bool? permissionGranted,
      final String errLoading,
      final String errAddress,
      final String errSending,
      final String errAmount,
      final String errFees,
      final String policyPath,
      final String txOutputs,
      final String address,
      final String amount,
      final int weight,
      final String fees,
      final int? feeSlow,
      final int? feeMedium,
      final int? feeFast,
      final int? balance,
      final int feesOption,
      final String psbt,
      final String txId,
      final int? finalFee,
      final int? finalAmount,
      final bool sweepWallet}) = _$_SendState;
  const _SendState._() : super._();

  @override
  Wallet get wallet;
  @override
  SendSteps get currentStep;
  @override
  bool get loadingStart;
  @override
  bool get calculatingFees;
  @override
  bool get buildingTx;
  @override
  bool get sendingTx;
  @override
  bool? get permissionGranted;
  @override
  String get errLoading;
  @override
  String get errAddress;
  @override
  String get errSending;
  @override
  String get errAmount;
  @override
  String get errFees;
  @override
  String get policyPath;
  @override
  String get txOutputs;
  @override
  String get address;
  @override
  String get amount;
  @override
  int get weight;
  @override
  String get fees;
  @override
  int? get feeSlow;
  @override
  int? get feeMedium;
  @override
  int? get feeFast;
  @override
  int? get balance;
  @override
  int get feesOption;
  @override
  String get psbt;
  @override
  String get txId;
  @override
  int? get finalFee;
  @override
  int? get finalAmount;
  @override
  bool get sweepWallet;
  @override
  @JsonKey(ignore: true)
  _$$_SendStateCopyWith<_$_SendState> get copyWith =>
      throw _privateConstructorUsedError;
}
