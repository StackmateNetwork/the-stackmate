// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InfoState implements DiagnosticableTreeMixin {

 Wallet? get wallet; bool get loadingTransactions; String get errLoadingTransactions; bool get loadingBalance; String get errLoadingBalance; int get balance; int get uconfBalance; List<Transaction> get transactions; String get errDeleting; bool get deleted; bool get showInfo; int get currentHeight; String get passPhraseTest; bool get ppTestPassed; String get errorPPTest;
/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoStateCopyWith<InfoState> get copyWith => _$InfoStateCopyWithImpl<InfoState>(this as InfoState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'InfoState'))
    ..add(DiagnosticsProperty('wallet', wallet))..add(DiagnosticsProperty('loadingTransactions', loadingTransactions))..add(DiagnosticsProperty('errLoadingTransactions', errLoadingTransactions))..add(DiagnosticsProperty('loadingBalance', loadingBalance))..add(DiagnosticsProperty('errLoadingBalance', errLoadingBalance))..add(DiagnosticsProperty('balance', balance))..add(DiagnosticsProperty('uconfBalance', uconfBalance))..add(DiagnosticsProperty('transactions', transactions))..add(DiagnosticsProperty('errDeleting', errDeleting))..add(DiagnosticsProperty('deleted', deleted))..add(DiagnosticsProperty('showInfo', showInfo))..add(DiagnosticsProperty('currentHeight', currentHeight))..add(DiagnosticsProperty('passPhraseTest', passPhraseTest))..add(DiagnosticsProperty('ppTestPassed', ppTestPassed))..add(DiagnosticsProperty('errorPPTest', errorPPTest));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.loadingTransactions, loadingTransactions) || other.loadingTransactions == loadingTransactions)&&(identical(other.errLoadingTransactions, errLoadingTransactions) || other.errLoadingTransactions == errLoadingTransactions)&&(identical(other.loadingBalance, loadingBalance) || other.loadingBalance == loadingBalance)&&(identical(other.errLoadingBalance, errLoadingBalance) || other.errLoadingBalance == errLoadingBalance)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.uconfBalance, uconfBalance) || other.uconfBalance == uconfBalance)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.errDeleting, errDeleting) || other.errDeleting == errDeleting)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.showInfo, showInfo) || other.showInfo == showInfo)&&(identical(other.currentHeight, currentHeight) || other.currentHeight == currentHeight)&&(identical(other.passPhraseTest, passPhraseTest) || other.passPhraseTest == passPhraseTest)&&(identical(other.ppTestPassed, ppTestPassed) || other.ppTestPassed == ppTestPassed)&&(identical(other.errorPPTest, errorPPTest) || other.errorPPTest == errorPPTest));
}


@override
int get hashCode => Object.hash(runtimeType,wallet,loadingTransactions,errLoadingTransactions,loadingBalance,errLoadingBalance,balance,uconfBalance,const DeepCollectionEquality().hash(transactions),errDeleting,deleted,showInfo,currentHeight,passPhraseTest,ppTestPassed,errorPPTest);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'InfoState(wallet: $wallet, loadingTransactions: $loadingTransactions, errLoadingTransactions: $errLoadingTransactions, loadingBalance: $loadingBalance, errLoadingBalance: $errLoadingBalance, balance: $balance, uconfBalance: $uconfBalance, transactions: $transactions, errDeleting: $errDeleting, deleted: $deleted, showInfo: $showInfo, currentHeight: $currentHeight, passPhraseTest: $passPhraseTest, ppTestPassed: $ppTestPassed, errorPPTest: $errorPPTest)';
}


}

/// @nodoc
abstract mixin class $InfoStateCopyWith<$Res>  {
  factory $InfoStateCopyWith(InfoState value, $Res Function(InfoState) _then) = _$InfoStateCopyWithImpl;
@useResult
$Res call({
 Wallet? wallet, bool loadingTransactions, String errLoadingTransactions, bool loadingBalance, String errLoadingBalance, int balance, int uconfBalance, List<Transaction> transactions, String errDeleting, bool deleted, bool showInfo, int currentHeight, String passPhraseTest, bool ppTestPassed, String errorPPTest
});


$WalletCopyWith<$Res>? get wallet;

}
/// @nodoc
class _$InfoStateCopyWithImpl<$Res>
    implements $InfoStateCopyWith<$Res> {
  _$InfoStateCopyWithImpl(this._self, this._then);

  final InfoState _self;
  final $Res Function(InfoState) _then;

/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wallet = freezed,Object? loadingTransactions = null,Object? errLoadingTransactions = null,Object? loadingBalance = null,Object? errLoadingBalance = null,Object? balance = null,Object? uconfBalance = null,Object? transactions = null,Object? errDeleting = null,Object? deleted = null,Object? showInfo = null,Object? currentHeight = null,Object? passPhraseTest = null,Object? ppTestPassed = null,Object? errorPPTest = null,}) {
  return _then(_self.copyWith(
wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet?,loadingTransactions: null == loadingTransactions ? _self.loadingTransactions : loadingTransactions // ignore: cast_nullable_to_non_nullable
as bool,errLoadingTransactions: null == errLoadingTransactions ? _self.errLoadingTransactions : errLoadingTransactions // ignore: cast_nullable_to_non_nullable
as String,loadingBalance: null == loadingBalance ? _self.loadingBalance : loadingBalance // ignore: cast_nullable_to_non_nullable
as bool,errLoadingBalance: null == errLoadingBalance ? _self.errLoadingBalance : errLoadingBalance // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,uconfBalance: null == uconfBalance ? _self.uconfBalance : uconfBalance // ignore: cast_nullable_to_non_nullable
as int,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,errDeleting: null == errDeleting ? _self.errDeleting : errDeleting // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,showInfo: null == showInfo ? _self.showInfo : showInfo // ignore: cast_nullable_to_non_nullable
as bool,currentHeight: null == currentHeight ? _self.currentHeight : currentHeight // ignore: cast_nullable_to_non_nullable
as int,passPhraseTest: null == passPhraseTest ? _self.passPhraseTest : passPhraseTest // ignore: cast_nullable_to_non_nullable
as String,ppTestPassed: null == ppTestPassed ? _self.ppTestPassed : ppTestPassed // ignore: cast_nullable_to_non_nullable
as bool,errorPPTest: null == errorPPTest ? _self.errorPPTest : errorPPTest // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res>? get wallet {
    if (_self.wallet == null) {
    return null;
  }

  return $WalletCopyWith<$Res>(_self.wallet!, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfoState].
extension InfoStatePatterns on InfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoState value)  $default,){
final _that = this;
switch (_that) {
case _InfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoState value)?  $default,){
final _that = this;
switch (_that) {
case _InfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Wallet? wallet,  bool loadingTransactions,  String errLoadingTransactions,  bool loadingBalance,  String errLoadingBalance,  int balance,  int uconfBalance,  List<Transaction> transactions,  String errDeleting,  bool deleted,  bool showInfo,  int currentHeight,  String passPhraseTest,  bool ppTestPassed,  String errorPPTest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoState() when $default != null:
return $default(_that.wallet,_that.loadingTransactions,_that.errLoadingTransactions,_that.loadingBalance,_that.errLoadingBalance,_that.balance,_that.uconfBalance,_that.transactions,_that.errDeleting,_that.deleted,_that.showInfo,_that.currentHeight,_that.passPhraseTest,_that.ppTestPassed,_that.errorPPTest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Wallet? wallet,  bool loadingTransactions,  String errLoadingTransactions,  bool loadingBalance,  String errLoadingBalance,  int balance,  int uconfBalance,  List<Transaction> transactions,  String errDeleting,  bool deleted,  bool showInfo,  int currentHeight,  String passPhraseTest,  bool ppTestPassed,  String errorPPTest)  $default,) {final _that = this;
switch (_that) {
case _InfoState():
return $default(_that.wallet,_that.loadingTransactions,_that.errLoadingTransactions,_that.loadingBalance,_that.errLoadingBalance,_that.balance,_that.uconfBalance,_that.transactions,_that.errDeleting,_that.deleted,_that.showInfo,_that.currentHeight,_that.passPhraseTest,_that.ppTestPassed,_that.errorPPTest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Wallet? wallet,  bool loadingTransactions,  String errLoadingTransactions,  bool loadingBalance,  String errLoadingBalance,  int balance,  int uconfBalance,  List<Transaction> transactions,  String errDeleting,  bool deleted,  bool showInfo,  int currentHeight,  String passPhraseTest,  bool ppTestPassed,  String errorPPTest)?  $default,) {final _that = this;
switch (_that) {
case _InfoState() when $default != null:
return $default(_that.wallet,_that.loadingTransactions,_that.errLoadingTransactions,_that.loadingBalance,_that.errLoadingBalance,_that.balance,_that.uconfBalance,_that.transactions,_that.errDeleting,_that.deleted,_that.showInfo,_that.currentHeight,_that.passPhraseTest,_that.ppTestPassed,_that.errorPPTest);case _:
  return null;

}
}

}

/// @nodoc


class _InfoState extends InfoState with DiagnosticableTreeMixin {
  const _InfoState({required this.wallet, this.loadingTransactions = false, this.errLoadingTransactions = '', this.loadingBalance = false, this.errLoadingBalance = '', this.balance = 0, this.uconfBalance = 0, final  List<Transaction> transactions = const [], this.errDeleting = '', this.deleted = false, this.showInfo = false, this.currentHeight = 0, this.passPhraseTest = '', this.ppTestPassed = false, this.errorPPTest = ''}): _transactions = transactions,super._();
  

@override final  Wallet? wallet;
@override@JsonKey() final  bool loadingTransactions;
@override@JsonKey() final  String errLoadingTransactions;
@override@JsonKey() final  bool loadingBalance;
@override@JsonKey() final  String errLoadingBalance;
@override@JsonKey() final  int balance;
@override@JsonKey() final  int uconfBalance;
 final  List<Transaction> _transactions;
@override@JsonKey() List<Transaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey() final  String errDeleting;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool showInfo;
@override@JsonKey() final  int currentHeight;
@override@JsonKey() final  String passPhraseTest;
@override@JsonKey() final  bool ppTestPassed;
@override@JsonKey() final  String errorPPTest;

/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoStateCopyWith<_InfoState> get copyWith => __$InfoStateCopyWithImpl<_InfoState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'InfoState'))
    ..add(DiagnosticsProperty('wallet', wallet))..add(DiagnosticsProperty('loadingTransactions', loadingTransactions))..add(DiagnosticsProperty('errLoadingTransactions', errLoadingTransactions))..add(DiagnosticsProperty('loadingBalance', loadingBalance))..add(DiagnosticsProperty('errLoadingBalance', errLoadingBalance))..add(DiagnosticsProperty('balance', balance))..add(DiagnosticsProperty('uconfBalance', uconfBalance))..add(DiagnosticsProperty('transactions', transactions))..add(DiagnosticsProperty('errDeleting', errDeleting))..add(DiagnosticsProperty('deleted', deleted))..add(DiagnosticsProperty('showInfo', showInfo))..add(DiagnosticsProperty('currentHeight', currentHeight))..add(DiagnosticsProperty('passPhraseTest', passPhraseTest))..add(DiagnosticsProperty('ppTestPassed', ppTestPassed))..add(DiagnosticsProperty('errorPPTest', errorPPTest));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.loadingTransactions, loadingTransactions) || other.loadingTransactions == loadingTransactions)&&(identical(other.errLoadingTransactions, errLoadingTransactions) || other.errLoadingTransactions == errLoadingTransactions)&&(identical(other.loadingBalance, loadingBalance) || other.loadingBalance == loadingBalance)&&(identical(other.errLoadingBalance, errLoadingBalance) || other.errLoadingBalance == errLoadingBalance)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.uconfBalance, uconfBalance) || other.uconfBalance == uconfBalance)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.errDeleting, errDeleting) || other.errDeleting == errDeleting)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.showInfo, showInfo) || other.showInfo == showInfo)&&(identical(other.currentHeight, currentHeight) || other.currentHeight == currentHeight)&&(identical(other.passPhraseTest, passPhraseTest) || other.passPhraseTest == passPhraseTest)&&(identical(other.ppTestPassed, ppTestPassed) || other.ppTestPassed == ppTestPassed)&&(identical(other.errorPPTest, errorPPTest) || other.errorPPTest == errorPPTest));
}


@override
int get hashCode => Object.hash(runtimeType,wallet,loadingTransactions,errLoadingTransactions,loadingBalance,errLoadingBalance,balance,uconfBalance,const DeepCollectionEquality().hash(_transactions),errDeleting,deleted,showInfo,currentHeight,passPhraseTest,ppTestPassed,errorPPTest);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'InfoState(wallet: $wallet, loadingTransactions: $loadingTransactions, errLoadingTransactions: $errLoadingTransactions, loadingBalance: $loadingBalance, errLoadingBalance: $errLoadingBalance, balance: $balance, uconfBalance: $uconfBalance, transactions: $transactions, errDeleting: $errDeleting, deleted: $deleted, showInfo: $showInfo, currentHeight: $currentHeight, passPhraseTest: $passPhraseTest, ppTestPassed: $ppTestPassed, errorPPTest: $errorPPTest)';
}


}

/// @nodoc
abstract mixin class _$InfoStateCopyWith<$Res> implements $InfoStateCopyWith<$Res> {
  factory _$InfoStateCopyWith(_InfoState value, $Res Function(_InfoState) _then) = __$InfoStateCopyWithImpl;
@override @useResult
$Res call({
 Wallet? wallet, bool loadingTransactions, String errLoadingTransactions, bool loadingBalance, String errLoadingBalance, int balance, int uconfBalance, List<Transaction> transactions, String errDeleting, bool deleted, bool showInfo, int currentHeight, String passPhraseTest, bool ppTestPassed, String errorPPTest
});


@override $WalletCopyWith<$Res>? get wallet;

}
/// @nodoc
class __$InfoStateCopyWithImpl<$Res>
    implements _$InfoStateCopyWith<$Res> {
  __$InfoStateCopyWithImpl(this._self, this._then);

  final _InfoState _self;
  final $Res Function(_InfoState) _then;

/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wallet = freezed,Object? loadingTransactions = null,Object? errLoadingTransactions = null,Object? loadingBalance = null,Object? errLoadingBalance = null,Object? balance = null,Object? uconfBalance = null,Object? transactions = null,Object? errDeleting = null,Object? deleted = null,Object? showInfo = null,Object? currentHeight = null,Object? passPhraseTest = null,Object? ppTestPassed = null,Object? errorPPTest = null,}) {
  return _then(_InfoState(
wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet?,loadingTransactions: null == loadingTransactions ? _self.loadingTransactions : loadingTransactions // ignore: cast_nullable_to_non_nullable
as bool,errLoadingTransactions: null == errLoadingTransactions ? _self.errLoadingTransactions : errLoadingTransactions // ignore: cast_nullable_to_non_nullable
as String,loadingBalance: null == loadingBalance ? _self.loadingBalance : loadingBalance // ignore: cast_nullable_to_non_nullable
as bool,errLoadingBalance: null == errLoadingBalance ? _self.errLoadingBalance : errLoadingBalance // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,uconfBalance: null == uconfBalance ? _self.uconfBalance : uconfBalance // ignore: cast_nullable_to_non_nullable
as int,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,errDeleting: null == errDeleting ? _self.errDeleting : errDeleting // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,showInfo: null == showInfo ? _self.showInfo : showInfo // ignore: cast_nullable_to_non_nullable
as bool,currentHeight: null == currentHeight ? _self.currentHeight : currentHeight // ignore: cast_nullable_to_non_nullable
as int,passPhraseTest: null == passPhraseTest ? _self.passPhraseTest : passPhraseTest // ignore: cast_nullable_to_non_nullable
as String,ppTestPassed: null == ppTestPassed ? _self.ppTestPassed : ppTestPassed // ignore: cast_nullable_to_non_nullable
as bool,errorPPTest: null == errorPPTest ? _self.errorPPTest : errorPPTest // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res>? get wallet {
    if (_self.wallet == null) {
    return null;
  }

  return $WalletCopyWith<$Res>(_self.wallet!, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}

// dart format on
