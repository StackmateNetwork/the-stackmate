// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReceiveState implements DiagnosticableTreeMixin {

 Wallet get wallet; bool get loadingAddress; String get errLoadingAddress; String get address; int get index;
/// Create a copy of ReceiveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveStateCopyWith<ReceiveState> get copyWith => _$ReceiveStateCopyWithImpl<ReceiveState>(this as ReceiveState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReceiveState'))
    ..add(DiagnosticsProperty('wallet', wallet))..add(DiagnosticsProperty('loadingAddress', loadingAddress))..add(DiagnosticsProperty('errLoadingAddress', errLoadingAddress))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('index', index));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.loadingAddress, loadingAddress) || other.loadingAddress == loadingAddress)&&(identical(other.errLoadingAddress, errLoadingAddress) || other.errLoadingAddress == errLoadingAddress)&&(identical(other.address, address) || other.address == address)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,wallet,loadingAddress,errLoadingAddress,address,index);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReceiveState(wallet: $wallet, loadingAddress: $loadingAddress, errLoadingAddress: $errLoadingAddress, address: $address, index: $index)';
}


}

/// @nodoc
abstract mixin class $ReceiveStateCopyWith<$Res>  {
  factory $ReceiveStateCopyWith(ReceiveState value, $Res Function(ReceiveState) _then) = _$ReceiveStateCopyWithImpl;
@useResult
$Res call({
 Wallet wallet, bool loadingAddress, String errLoadingAddress, String address, int index
});


$WalletCopyWith<$Res> get wallet;

}
/// @nodoc
class _$ReceiveStateCopyWithImpl<$Res>
    implements $ReceiveStateCopyWith<$Res> {
  _$ReceiveStateCopyWithImpl(this._self, this._then);

  final ReceiveState _self;
  final $Res Function(ReceiveState) _then;

/// Create a copy of ReceiveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wallet = null,Object? loadingAddress = null,Object? errLoadingAddress = null,Object? address = null,Object? index = null,}) {
  return _then(_self.copyWith(
wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet,loadingAddress: null == loadingAddress ? _self.loadingAddress : loadingAddress // ignore: cast_nullable_to_non_nullable
as bool,errLoadingAddress: null == errLoadingAddress ? _self.errLoadingAddress : errLoadingAddress // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ReceiveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res> get wallet {
  
  return $WalletCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReceiveState].
extension ReceiveStatePatterns on ReceiveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiveState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiveState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiveState value)  $default,){
final _that = this;
switch (_that) {
case _ReceiveState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiveState value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiveState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Wallet wallet,  bool loadingAddress,  String errLoadingAddress,  String address,  int index)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiveState() when $default != null:
return $default(_that.wallet,_that.loadingAddress,_that.errLoadingAddress,_that.address,_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Wallet wallet,  bool loadingAddress,  String errLoadingAddress,  String address,  int index)  $default,) {final _that = this;
switch (_that) {
case _ReceiveState():
return $default(_that.wallet,_that.loadingAddress,_that.errLoadingAddress,_that.address,_that.index);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Wallet wallet,  bool loadingAddress,  String errLoadingAddress,  String address,  int index)?  $default,) {final _that = this;
switch (_that) {
case _ReceiveState() when $default != null:
return $default(_that.wallet,_that.loadingAddress,_that.errLoadingAddress,_that.address,_that.index);case _:
  return null;

}
}

}

/// @nodoc


class _ReceiveState extends ReceiveState with DiagnosticableTreeMixin {
  const _ReceiveState({required this.wallet, this.loadingAddress = true, this.errLoadingAddress = '', this.address = '', this.index = 0}): super._();
  

@override final  Wallet wallet;
@override@JsonKey() final  bool loadingAddress;
@override@JsonKey() final  String errLoadingAddress;
@override@JsonKey() final  String address;
@override@JsonKey() final  int index;

/// Create a copy of ReceiveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiveStateCopyWith<_ReceiveState> get copyWith => __$ReceiveStateCopyWithImpl<_ReceiveState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReceiveState'))
    ..add(DiagnosticsProperty('wallet', wallet))..add(DiagnosticsProperty('loadingAddress', loadingAddress))..add(DiagnosticsProperty('errLoadingAddress', errLoadingAddress))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('index', index));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiveState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.loadingAddress, loadingAddress) || other.loadingAddress == loadingAddress)&&(identical(other.errLoadingAddress, errLoadingAddress) || other.errLoadingAddress == errLoadingAddress)&&(identical(other.address, address) || other.address == address)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,wallet,loadingAddress,errLoadingAddress,address,index);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReceiveState(wallet: $wallet, loadingAddress: $loadingAddress, errLoadingAddress: $errLoadingAddress, address: $address, index: $index)';
}


}

/// @nodoc
abstract mixin class _$ReceiveStateCopyWith<$Res> implements $ReceiveStateCopyWith<$Res> {
  factory _$ReceiveStateCopyWith(_ReceiveState value, $Res Function(_ReceiveState) _then) = __$ReceiveStateCopyWithImpl;
@override @useResult
$Res call({
 Wallet wallet, bool loadingAddress, String errLoadingAddress, String address, int index
});


@override $WalletCopyWith<$Res> get wallet;

}
/// @nodoc
class __$ReceiveStateCopyWithImpl<$Res>
    implements _$ReceiveStateCopyWith<$Res> {
  __$ReceiveStateCopyWithImpl(this._self, this._then);

  final _ReceiveState _self;
  final $Res Function(_ReceiveState) _then;

/// Create a copy of ReceiveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wallet = null,Object? loadingAddress = null,Object? errLoadingAddress = null,Object? address = null,Object? index = null,}) {
  return _then(_ReceiveState(
wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet,loadingAddress: null == loadingAddress ? _self.loadingAddress : loadingAddress // ignore: cast_nullable_to_non_nullable
as bool,errLoadingAddress: null == errLoadingAddress ? _self.errLoadingAddress : errLoadingAddress // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ReceiveState
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
