// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendState implements DiagnosticableTreeMixin {

 Wallet get wallet; SendSteps get currentStep; bool get loadingStart; bool get calculatingFees; bool get buildingTx; bool get sendingTx; bool? get permissionGranted; String get errLoading; String get errAddress; String get errSending; String get errAmount; String get errFees; String get policyPath; String get txOutputs; String get address; String get amount; int get weight; String get fees; int? get feeSlow; int? get feeMedium; int? get feeFast; int? get balance; int get feesOption; String get psbt; String get txId; int? get finalFee; int? get finalAmount; bool get sweepWallet;
/// Create a copy of SendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendStateCopyWith<SendState> get copyWith => _$SendStateCopyWithImpl<SendState>(this as SendState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SendState'))
    ..add(DiagnosticsProperty('wallet', wallet))..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('loadingStart', loadingStart))..add(DiagnosticsProperty('calculatingFees', calculatingFees))..add(DiagnosticsProperty('buildingTx', buildingTx))..add(DiagnosticsProperty('sendingTx', sendingTx))..add(DiagnosticsProperty('permissionGranted', permissionGranted))..add(DiagnosticsProperty('errLoading', errLoading))..add(DiagnosticsProperty('errAddress', errAddress))..add(DiagnosticsProperty('errSending', errSending))..add(DiagnosticsProperty('errAmount', errAmount))..add(DiagnosticsProperty('errFees', errFees))..add(DiagnosticsProperty('policyPath', policyPath))..add(DiagnosticsProperty('txOutputs', txOutputs))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('weight', weight))..add(DiagnosticsProperty('fees', fees))..add(DiagnosticsProperty('feeSlow', feeSlow))..add(DiagnosticsProperty('feeMedium', feeMedium))..add(DiagnosticsProperty('feeFast', feeFast))..add(DiagnosticsProperty('balance', balance))..add(DiagnosticsProperty('feesOption', feesOption))..add(DiagnosticsProperty('psbt', psbt))..add(DiagnosticsProperty('txId', txId))..add(DiagnosticsProperty('finalFee', finalFee))..add(DiagnosticsProperty('finalAmount', finalAmount))..add(DiagnosticsProperty('sweepWallet', sweepWallet));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.loadingStart, loadingStart) || other.loadingStart == loadingStart)&&(identical(other.calculatingFees, calculatingFees) || other.calculatingFees == calculatingFees)&&(identical(other.buildingTx, buildingTx) || other.buildingTx == buildingTx)&&(identical(other.sendingTx, sendingTx) || other.sendingTx == sendingTx)&&(identical(other.permissionGranted, permissionGranted) || other.permissionGranted == permissionGranted)&&(identical(other.errLoading, errLoading) || other.errLoading == errLoading)&&(identical(other.errAddress, errAddress) || other.errAddress == errAddress)&&(identical(other.errSending, errSending) || other.errSending == errSending)&&(identical(other.errAmount, errAmount) || other.errAmount == errAmount)&&(identical(other.errFees, errFees) || other.errFees == errFees)&&(identical(other.policyPath, policyPath) || other.policyPath == policyPath)&&(identical(other.txOutputs, txOutputs) || other.txOutputs == txOutputs)&&(identical(other.address, address) || other.address == address)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.feeSlow, feeSlow) || other.feeSlow == feeSlow)&&(identical(other.feeMedium, feeMedium) || other.feeMedium == feeMedium)&&(identical(other.feeFast, feeFast) || other.feeFast == feeFast)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.feesOption, feesOption) || other.feesOption == feesOption)&&(identical(other.psbt, psbt) || other.psbt == psbt)&&(identical(other.txId, txId) || other.txId == txId)&&(identical(other.finalFee, finalFee) || other.finalFee == finalFee)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.sweepWallet, sweepWallet) || other.sweepWallet == sweepWallet));
}


@override
int get hashCode => Object.hashAll([runtimeType,wallet,currentStep,loadingStart,calculatingFees,buildingTx,sendingTx,permissionGranted,errLoading,errAddress,errSending,errAmount,errFees,policyPath,txOutputs,address,amount,weight,fees,feeSlow,feeMedium,feeFast,balance,feesOption,psbt,txId,finalFee,finalAmount,sweepWallet]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SendState(wallet: $wallet, currentStep: $currentStep, loadingStart: $loadingStart, calculatingFees: $calculatingFees, buildingTx: $buildingTx, sendingTx: $sendingTx, permissionGranted: $permissionGranted, errLoading: $errLoading, errAddress: $errAddress, errSending: $errSending, errAmount: $errAmount, errFees: $errFees, policyPath: $policyPath, txOutputs: $txOutputs, address: $address, amount: $amount, weight: $weight, fees: $fees, feeSlow: $feeSlow, feeMedium: $feeMedium, feeFast: $feeFast, balance: $balance, feesOption: $feesOption, psbt: $psbt, txId: $txId, finalFee: $finalFee, finalAmount: $finalAmount, sweepWallet: $sweepWallet)';
}


}

/// @nodoc
abstract mixin class $SendStateCopyWith<$Res>  {
  factory $SendStateCopyWith(SendState value, $Res Function(SendState) _then) = _$SendStateCopyWithImpl;
@useResult
$Res call({
 Wallet wallet, SendSteps currentStep, bool loadingStart, bool calculatingFees, bool buildingTx, bool sendingTx, bool? permissionGranted, String errLoading, String errAddress, String errSending, String errAmount, String errFees, String policyPath, String txOutputs, String address, String amount, int weight, String fees, int? feeSlow, int? feeMedium, int? feeFast, int? balance, int feesOption, String psbt, String txId, int? finalFee, int? finalAmount, bool sweepWallet
});


$WalletCopyWith<$Res> get wallet;

}
/// @nodoc
class _$SendStateCopyWithImpl<$Res>
    implements $SendStateCopyWith<$Res> {
  _$SendStateCopyWithImpl(this._self, this._then);

  final SendState _self;
  final $Res Function(SendState) _then;

/// Create a copy of SendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wallet = null,Object? currentStep = null,Object? loadingStart = null,Object? calculatingFees = null,Object? buildingTx = null,Object? sendingTx = null,Object? permissionGranted = freezed,Object? errLoading = null,Object? errAddress = null,Object? errSending = null,Object? errAmount = null,Object? errFees = null,Object? policyPath = null,Object? txOutputs = null,Object? address = null,Object? amount = null,Object? weight = null,Object? fees = null,Object? feeSlow = freezed,Object? feeMedium = freezed,Object? feeFast = freezed,Object? balance = freezed,Object? feesOption = null,Object? psbt = null,Object? txId = null,Object? finalFee = freezed,Object? finalAmount = freezed,Object? sweepWallet = null,}) {
  return _then(_self.copyWith(
wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SendSteps,loadingStart: null == loadingStart ? _self.loadingStart : loadingStart // ignore: cast_nullable_to_non_nullable
as bool,calculatingFees: null == calculatingFees ? _self.calculatingFees : calculatingFees // ignore: cast_nullable_to_non_nullable
as bool,buildingTx: null == buildingTx ? _self.buildingTx : buildingTx // ignore: cast_nullable_to_non_nullable
as bool,sendingTx: null == sendingTx ? _self.sendingTx : sendingTx // ignore: cast_nullable_to_non_nullable
as bool,permissionGranted: freezed == permissionGranted ? _self.permissionGranted : permissionGranted // ignore: cast_nullable_to_non_nullable
as bool?,errLoading: null == errLoading ? _self.errLoading : errLoading // ignore: cast_nullable_to_non_nullable
as String,errAddress: null == errAddress ? _self.errAddress : errAddress // ignore: cast_nullable_to_non_nullable
as String,errSending: null == errSending ? _self.errSending : errSending // ignore: cast_nullable_to_non_nullable
as String,errAmount: null == errAmount ? _self.errAmount : errAmount // ignore: cast_nullable_to_non_nullable
as String,errFees: null == errFees ? _self.errFees : errFees // ignore: cast_nullable_to_non_nullable
as String,policyPath: null == policyPath ? _self.policyPath : policyPath // ignore: cast_nullable_to_non_nullable
as String,txOutputs: null == txOutputs ? _self.txOutputs : txOutputs // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as String,feeSlow: freezed == feeSlow ? _self.feeSlow : feeSlow // ignore: cast_nullable_to_non_nullable
as int?,feeMedium: freezed == feeMedium ? _self.feeMedium : feeMedium // ignore: cast_nullable_to_non_nullable
as int?,feeFast: freezed == feeFast ? _self.feeFast : feeFast // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,feesOption: null == feesOption ? _self.feesOption : feesOption // ignore: cast_nullable_to_non_nullable
as int,psbt: null == psbt ? _self.psbt : psbt // ignore: cast_nullable_to_non_nullable
as String,txId: null == txId ? _self.txId : txId // ignore: cast_nullable_to_non_nullable
as String,finalFee: freezed == finalFee ? _self.finalFee : finalFee // ignore: cast_nullable_to_non_nullable
as int?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int?,sweepWallet: null == sweepWallet ? _self.sweepWallet : sweepWallet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SendState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res> get wallet {
  
  return $WalletCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendState].
extension SendStatePatterns on SendState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendState value)  $default,){
final _that = this;
switch (_that) {
case _SendState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendState value)?  $default,){
final _that = this;
switch (_that) {
case _SendState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Wallet wallet,  SendSteps currentStep,  bool loadingStart,  bool calculatingFees,  bool buildingTx,  bool sendingTx,  bool? permissionGranted,  String errLoading,  String errAddress,  String errSending,  String errAmount,  String errFees,  String policyPath,  String txOutputs,  String address,  String amount,  int weight,  String fees,  int? feeSlow,  int? feeMedium,  int? feeFast,  int? balance,  int feesOption,  String psbt,  String txId,  int? finalFee,  int? finalAmount,  bool sweepWallet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendState() when $default != null:
return $default(_that.wallet,_that.currentStep,_that.loadingStart,_that.calculatingFees,_that.buildingTx,_that.sendingTx,_that.permissionGranted,_that.errLoading,_that.errAddress,_that.errSending,_that.errAmount,_that.errFees,_that.policyPath,_that.txOutputs,_that.address,_that.amount,_that.weight,_that.fees,_that.feeSlow,_that.feeMedium,_that.feeFast,_that.balance,_that.feesOption,_that.psbt,_that.txId,_that.finalFee,_that.finalAmount,_that.sweepWallet);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Wallet wallet,  SendSteps currentStep,  bool loadingStart,  bool calculatingFees,  bool buildingTx,  bool sendingTx,  bool? permissionGranted,  String errLoading,  String errAddress,  String errSending,  String errAmount,  String errFees,  String policyPath,  String txOutputs,  String address,  String amount,  int weight,  String fees,  int? feeSlow,  int? feeMedium,  int? feeFast,  int? balance,  int feesOption,  String psbt,  String txId,  int? finalFee,  int? finalAmount,  bool sweepWallet)  $default,) {final _that = this;
switch (_that) {
case _SendState():
return $default(_that.wallet,_that.currentStep,_that.loadingStart,_that.calculatingFees,_that.buildingTx,_that.sendingTx,_that.permissionGranted,_that.errLoading,_that.errAddress,_that.errSending,_that.errAmount,_that.errFees,_that.policyPath,_that.txOutputs,_that.address,_that.amount,_that.weight,_that.fees,_that.feeSlow,_that.feeMedium,_that.feeFast,_that.balance,_that.feesOption,_that.psbt,_that.txId,_that.finalFee,_that.finalAmount,_that.sweepWallet);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Wallet wallet,  SendSteps currentStep,  bool loadingStart,  bool calculatingFees,  bool buildingTx,  bool sendingTx,  bool? permissionGranted,  String errLoading,  String errAddress,  String errSending,  String errAmount,  String errFees,  String policyPath,  String txOutputs,  String address,  String amount,  int weight,  String fees,  int? feeSlow,  int? feeMedium,  int? feeFast,  int? balance,  int feesOption,  String psbt,  String txId,  int? finalFee,  int? finalAmount,  bool sweepWallet)?  $default,) {final _that = this;
switch (_that) {
case _SendState() when $default != null:
return $default(_that.wallet,_that.currentStep,_that.loadingStart,_that.calculatingFees,_that.buildingTx,_that.sendingTx,_that.permissionGranted,_that.errLoading,_that.errAddress,_that.errSending,_that.errAmount,_that.errFees,_that.policyPath,_that.txOutputs,_that.address,_that.amount,_that.weight,_that.fees,_that.feeSlow,_that.feeMedium,_that.feeFast,_that.balance,_that.feesOption,_that.psbt,_that.txId,_that.finalFee,_that.finalAmount,_that.sweepWallet);case _:
  return null;

}
}

}

/// @nodoc


class _SendState extends SendState with DiagnosticableTreeMixin {
  const _SendState({required this.wallet, this.currentStep = SendSteps.address, this.loadingStart = true, this.calculatingFees = false, this.buildingTx = false, this.sendingTx = false, this.permissionGranted, this.errLoading = '', this.errAddress = '', this.errSending = '', this.errAmount = '', this.errFees = '', this.policyPath = '', this.txOutputs = '', this.address = '', this.amount = '', this.weight = 0, this.fees = '', this.feeSlow, this.feeMedium, this.feeFast, this.balance, this.feesOption = 1, this.psbt = '', this.txId = '', this.finalFee, this.finalAmount, this.sweepWallet = false}): super._();
  

@override final  Wallet wallet;
@override@JsonKey() final  SendSteps currentStep;
@override@JsonKey() final  bool loadingStart;
@override@JsonKey() final  bool calculatingFees;
@override@JsonKey() final  bool buildingTx;
@override@JsonKey() final  bool sendingTx;
@override final  bool? permissionGranted;
@override@JsonKey() final  String errLoading;
@override@JsonKey() final  String errAddress;
@override@JsonKey() final  String errSending;
@override@JsonKey() final  String errAmount;
@override@JsonKey() final  String errFees;
@override@JsonKey() final  String policyPath;
@override@JsonKey() final  String txOutputs;
@override@JsonKey() final  String address;
@override@JsonKey() final  String amount;
@override@JsonKey() final  int weight;
@override@JsonKey() final  String fees;
@override final  int? feeSlow;
@override final  int? feeMedium;
@override final  int? feeFast;
@override final  int? balance;
@override@JsonKey() final  int feesOption;
@override@JsonKey() final  String psbt;
@override@JsonKey() final  String txId;
@override final  int? finalFee;
@override final  int? finalAmount;
@override@JsonKey() final  bool sweepWallet;

/// Create a copy of SendState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendStateCopyWith<_SendState> get copyWith => __$SendStateCopyWithImpl<_SendState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SendState'))
    ..add(DiagnosticsProperty('wallet', wallet))..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('loadingStart', loadingStart))..add(DiagnosticsProperty('calculatingFees', calculatingFees))..add(DiagnosticsProperty('buildingTx', buildingTx))..add(DiagnosticsProperty('sendingTx', sendingTx))..add(DiagnosticsProperty('permissionGranted', permissionGranted))..add(DiagnosticsProperty('errLoading', errLoading))..add(DiagnosticsProperty('errAddress', errAddress))..add(DiagnosticsProperty('errSending', errSending))..add(DiagnosticsProperty('errAmount', errAmount))..add(DiagnosticsProperty('errFees', errFees))..add(DiagnosticsProperty('policyPath', policyPath))..add(DiagnosticsProperty('txOutputs', txOutputs))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('weight', weight))..add(DiagnosticsProperty('fees', fees))..add(DiagnosticsProperty('feeSlow', feeSlow))..add(DiagnosticsProperty('feeMedium', feeMedium))..add(DiagnosticsProperty('feeFast', feeFast))..add(DiagnosticsProperty('balance', balance))..add(DiagnosticsProperty('feesOption', feesOption))..add(DiagnosticsProperty('psbt', psbt))..add(DiagnosticsProperty('txId', txId))..add(DiagnosticsProperty('finalFee', finalFee))..add(DiagnosticsProperty('finalAmount', finalAmount))..add(DiagnosticsProperty('sweepWallet', sweepWallet));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.loadingStart, loadingStart) || other.loadingStart == loadingStart)&&(identical(other.calculatingFees, calculatingFees) || other.calculatingFees == calculatingFees)&&(identical(other.buildingTx, buildingTx) || other.buildingTx == buildingTx)&&(identical(other.sendingTx, sendingTx) || other.sendingTx == sendingTx)&&(identical(other.permissionGranted, permissionGranted) || other.permissionGranted == permissionGranted)&&(identical(other.errLoading, errLoading) || other.errLoading == errLoading)&&(identical(other.errAddress, errAddress) || other.errAddress == errAddress)&&(identical(other.errSending, errSending) || other.errSending == errSending)&&(identical(other.errAmount, errAmount) || other.errAmount == errAmount)&&(identical(other.errFees, errFees) || other.errFees == errFees)&&(identical(other.policyPath, policyPath) || other.policyPath == policyPath)&&(identical(other.txOutputs, txOutputs) || other.txOutputs == txOutputs)&&(identical(other.address, address) || other.address == address)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.feeSlow, feeSlow) || other.feeSlow == feeSlow)&&(identical(other.feeMedium, feeMedium) || other.feeMedium == feeMedium)&&(identical(other.feeFast, feeFast) || other.feeFast == feeFast)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.feesOption, feesOption) || other.feesOption == feesOption)&&(identical(other.psbt, psbt) || other.psbt == psbt)&&(identical(other.txId, txId) || other.txId == txId)&&(identical(other.finalFee, finalFee) || other.finalFee == finalFee)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.sweepWallet, sweepWallet) || other.sweepWallet == sweepWallet));
}


@override
int get hashCode => Object.hashAll([runtimeType,wallet,currentStep,loadingStart,calculatingFees,buildingTx,sendingTx,permissionGranted,errLoading,errAddress,errSending,errAmount,errFees,policyPath,txOutputs,address,amount,weight,fees,feeSlow,feeMedium,feeFast,balance,feesOption,psbt,txId,finalFee,finalAmount,sweepWallet]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SendState(wallet: $wallet, currentStep: $currentStep, loadingStart: $loadingStart, calculatingFees: $calculatingFees, buildingTx: $buildingTx, sendingTx: $sendingTx, permissionGranted: $permissionGranted, errLoading: $errLoading, errAddress: $errAddress, errSending: $errSending, errAmount: $errAmount, errFees: $errFees, policyPath: $policyPath, txOutputs: $txOutputs, address: $address, amount: $amount, weight: $weight, fees: $fees, feeSlow: $feeSlow, feeMedium: $feeMedium, feeFast: $feeFast, balance: $balance, feesOption: $feesOption, psbt: $psbt, txId: $txId, finalFee: $finalFee, finalAmount: $finalAmount, sweepWallet: $sweepWallet)';
}


}

/// @nodoc
abstract mixin class _$SendStateCopyWith<$Res> implements $SendStateCopyWith<$Res> {
  factory _$SendStateCopyWith(_SendState value, $Res Function(_SendState) _then) = __$SendStateCopyWithImpl;
@override @useResult
$Res call({
 Wallet wallet, SendSteps currentStep, bool loadingStart, bool calculatingFees, bool buildingTx, bool sendingTx, bool? permissionGranted, String errLoading, String errAddress, String errSending, String errAmount, String errFees, String policyPath, String txOutputs, String address, String amount, int weight, String fees, int? feeSlow, int? feeMedium, int? feeFast, int? balance, int feesOption, String psbt, String txId, int? finalFee, int? finalAmount, bool sweepWallet
});


@override $WalletCopyWith<$Res> get wallet;

}
/// @nodoc
class __$SendStateCopyWithImpl<$Res>
    implements _$SendStateCopyWith<$Res> {
  __$SendStateCopyWithImpl(this._self, this._then);

  final _SendState _self;
  final $Res Function(_SendState) _then;

/// Create a copy of SendState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wallet = null,Object? currentStep = null,Object? loadingStart = null,Object? calculatingFees = null,Object? buildingTx = null,Object? sendingTx = null,Object? permissionGranted = freezed,Object? errLoading = null,Object? errAddress = null,Object? errSending = null,Object? errAmount = null,Object? errFees = null,Object? policyPath = null,Object? txOutputs = null,Object? address = null,Object? amount = null,Object? weight = null,Object? fees = null,Object? feeSlow = freezed,Object? feeMedium = freezed,Object? feeFast = freezed,Object? balance = freezed,Object? feesOption = null,Object? psbt = null,Object? txId = null,Object? finalFee = freezed,Object? finalAmount = freezed,Object? sweepWallet = null,}) {
  return _then(_SendState(
wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SendSteps,loadingStart: null == loadingStart ? _self.loadingStart : loadingStart // ignore: cast_nullable_to_non_nullable
as bool,calculatingFees: null == calculatingFees ? _self.calculatingFees : calculatingFees // ignore: cast_nullable_to_non_nullable
as bool,buildingTx: null == buildingTx ? _self.buildingTx : buildingTx // ignore: cast_nullable_to_non_nullable
as bool,sendingTx: null == sendingTx ? _self.sendingTx : sendingTx // ignore: cast_nullable_to_non_nullable
as bool,permissionGranted: freezed == permissionGranted ? _self.permissionGranted : permissionGranted // ignore: cast_nullable_to_non_nullable
as bool?,errLoading: null == errLoading ? _self.errLoading : errLoading // ignore: cast_nullable_to_non_nullable
as String,errAddress: null == errAddress ? _self.errAddress : errAddress // ignore: cast_nullable_to_non_nullable
as String,errSending: null == errSending ? _self.errSending : errSending // ignore: cast_nullable_to_non_nullable
as String,errAmount: null == errAmount ? _self.errAmount : errAmount // ignore: cast_nullable_to_non_nullable
as String,errFees: null == errFees ? _self.errFees : errFees // ignore: cast_nullable_to_non_nullable
as String,policyPath: null == policyPath ? _self.policyPath : policyPath // ignore: cast_nullable_to_non_nullable
as String,txOutputs: null == txOutputs ? _self.txOutputs : txOutputs // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as String,feeSlow: freezed == feeSlow ? _self.feeSlow : feeSlow // ignore: cast_nullable_to_non_nullable
as int?,feeMedium: freezed == feeMedium ? _self.feeMedium : feeMedium // ignore: cast_nullable_to_non_nullable
as int?,feeFast: freezed == feeFast ? _self.feeFast : feeFast // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,feesOption: null == feesOption ? _self.feesOption : feesOption // ignore: cast_nullable_to_non_nullable
as int,psbt: null == psbt ? _self.psbt : psbt // ignore: cast_nullable_to_non_nullable
as String,txId: null == txId ? _self.txId : txId // ignore: cast_nullable_to_non_nullable
as String,finalFee: freezed == finalFee ? _self.finalFee : finalFee // ignore: cast_nullable_to_non_nullable
as int?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int?,sweepWallet: null == sweepWallet ? _self.sweepWallet : sweepWallet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SendState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res> get wallet {
  
  return $WalletCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}

// dart format on
