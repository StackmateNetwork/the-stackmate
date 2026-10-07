// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallets.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletsState implements DiagnosticableTreeMixin {

 List<Wallet> get wallets; Wallet? get selectedWallet; bool get toggler; String get errDeleting; int get networth;
/// Create a copy of WalletsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletsStateCopyWith<WalletsState> get copyWith => _$WalletsStateCopyWithImpl<WalletsState>(this as WalletsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WalletsState'))
    ..add(DiagnosticsProperty('wallets', wallets))..add(DiagnosticsProperty('selectedWallet', selectedWallet))..add(DiagnosticsProperty('toggler', toggler))..add(DiagnosticsProperty('errDeleting', errDeleting))..add(DiagnosticsProperty('networth', networth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletsState&&const DeepCollectionEquality().equals(other.wallets, wallets)&&(identical(other.selectedWallet, selectedWallet) || other.selectedWallet == selectedWallet)&&(identical(other.toggler, toggler) || other.toggler == toggler)&&(identical(other.errDeleting, errDeleting) || other.errDeleting == errDeleting)&&(identical(other.networth, networth) || other.networth == networth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(wallets),selectedWallet,toggler,errDeleting,networth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WalletsState(wallets: $wallets, selectedWallet: $selectedWallet, toggler: $toggler, errDeleting: $errDeleting, networth: $networth)';
}


}

/// @nodoc
abstract mixin class $WalletsStateCopyWith<$Res>  {
  factory $WalletsStateCopyWith(WalletsState value, $Res Function(WalletsState) _then) = _$WalletsStateCopyWithImpl;
@useResult
$Res call({
 List<Wallet> wallets, Wallet? selectedWallet, bool toggler, String errDeleting, int networth
});


$WalletCopyWith<$Res>? get selectedWallet;

}
/// @nodoc
class _$WalletsStateCopyWithImpl<$Res>
    implements $WalletsStateCopyWith<$Res> {
  _$WalletsStateCopyWithImpl(this._self, this._then);

  final WalletsState _self;
  final $Res Function(WalletsState) _then;

/// Create a copy of WalletsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wallets = null,Object? selectedWallet = freezed,Object? toggler = null,Object? errDeleting = null,Object? networth = null,}) {
  return _then(_self.copyWith(
wallets: null == wallets ? _self.wallets : wallets // ignore: cast_nullable_to_non_nullable
as List<Wallet>,selectedWallet: freezed == selectedWallet ? _self.selectedWallet : selectedWallet // ignore: cast_nullable_to_non_nullable
as Wallet?,toggler: null == toggler ? _self.toggler : toggler // ignore: cast_nullable_to_non_nullable
as bool,errDeleting: null == errDeleting ? _self.errDeleting : errDeleting // ignore: cast_nullable_to_non_nullable
as String,networth: null == networth ? _self.networth : networth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of WalletsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res>? get selectedWallet {
    if (_self.selectedWallet == null) {
    return null;
  }

  return $WalletCopyWith<$Res>(_self.selectedWallet!, (value) {
    return _then(_self.copyWith(selectedWallet: value));
  });
}
}


/// Adds pattern-matching-related methods to [WalletsState].
extension WalletsStatePatterns on WalletsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletsState value)  $default,){
final _that = this;
switch (_that) {
case _WalletsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletsState value)?  $default,){
final _that = this;
switch (_that) {
case _WalletsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Wallet> wallets,  Wallet? selectedWallet,  bool toggler,  String errDeleting,  int networth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletsState() when $default != null:
return $default(_that.wallets,_that.selectedWallet,_that.toggler,_that.errDeleting,_that.networth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Wallet> wallets,  Wallet? selectedWallet,  bool toggler,  String errDeleting,  int networth)  $default,) {final _that = this;
switch (_that) {
case _WalletsState():
return $default(_that.wallets,_that.selectedWallet,_that.toggler,_that.errDeleting,_that.networth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Wallet> wallets,  Wallet? selectedWallet,  bool toggler,  String errDeleting,  int networth)?  $default,) {final _that = this;
switch (_that) {
case _WalletsState() when $default != null:
return $default(_that.wallets,_that.selectedWallet,_that.toggler,_that.errDeleting,_that.networth);case _:
  return null;

}
}

}

/// @nodoc


class _WalletsState with DiagnosticableTreeMixin implements WalletsState {
  const _WalletsState({final  List<Wallet> wallets = const [], this.selectedWallet, this.toggler = true, this.errDeleting = '', this.networth = 0}): _wallets = wallets;
  

 final  List<Wallet> _wallets;
@override@JsonKey() List<Wallet> get wallets {
  if (_wallets is EqualUnmodifiableListView) return _wallets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wallets);
}

@override final  Wallet? selectedWallet;
@override@JsonKey() final  bool toggler;
@override@JsonKey() final  String errDeleting;
@override@JsonKey() final  int networth;

/// Create a copy of WalletsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletsStateCopyWith<_WalletsState> get copyWith => __$WalletsStateCopyWithImpl<_WalletsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WalletsState'))
    ..add(DiagnosticsProperty('wallets', wallets))..add(DiagnosticsProperty('selectedWallet', selectedWallet))..add(DiagnosticsProperty('toggler', toggler))..add(DiagnosticsProperty('errDeleting', errDeleting))..add(DiagnosticsProperty('networth', networth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletsState&&const DeepCollectionEquality().equals(other._wallets, _wallets)&&(identical(other.selectedWallet, selectedWallet) || other.selectedWallet == selectedWallet)&&(identical(other.toggler, toggler) || other.toggler == toggler)&&(identical(other.errDeleting, errDeleting) || other.errDeleting == errDeleting)&&(identical(other.networth, networth) || other.networth == networth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_wallets),selectedWallet,toggler,errDeleting,networth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WalletsState(wallets: $wallets, selectedWallet: $selectedWallet, toggler: $toggler, errDeleting: $errDeleting, networth: $networth)';
}


}

/// @nodoc
abstract mixin class _$WalletsStateCopyWith<$Res> implements $WalletsStateCopyWith<$Res> {
  factory _$WalletsStateCopyWith(_WalletsState value, $Res Function(_WalletsState) _then) = __$WalletsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Wallet> wallets, Wallet? selectedWallet, bool toggler, String errDeleting, int networth
});


@override $WalletCopyWith<$Res>? get selectedWallet;

}
/// @nodoc
class __$WalletsStateCopyWithImpl<$Res>
    implements _$WalletsStateCopyWith<$Res> {
  __$WalletsStateCopyWithImpl(this._self, this._then);

  final _WalletsState _self;
  final $Res Function(_WalletsState) _then;

/// Create a copy of WalletsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wallets = null,Object? selectedWallet = freezed,Object? toggler = null,Object? errDeleting = null,Object? networth = null,}) {
  return _then(_WalletsState(
wallets: null == wallets ? _self._wallets : wallets // ignore: cast_nullable_to_non_nullable
as List<Wallet>,selectedWallet: freezed == selectedWallet ? _self.selectedWallet : selectedWallet // ignore: cast_nullable_to_non_nullable
as Wallet?,toggler: null == toggler ? _self.toggler : toggler // ignore: cast_nullable_to_non_nullable
as bool,errDeleting: null == errDeleting ? _self.errDeleting : errDeleting // ignore: cast_nullable_to_non_nullable
as String,networth: null == networth ? _self.networth : networth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of WalletsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res>? get selectedWallet {
    if (_self.selectedWallet == null) {
    return null;
  }

  return $WalletCopyWith<$Res>(_self.selectedWallet!, (value) {
    return _then(_self.copyWith(selectedWallet: value));
  });
}
}

// dart format on
