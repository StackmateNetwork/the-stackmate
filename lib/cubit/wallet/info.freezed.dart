// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InfoState {
  Wallet? get wallet => throw _privateConstructorUsedError;
  bool get loadingTransactions => throw _privateConstructorUsedError;
  String get errLoadingTransactions => throw _privateConstructorUsedError;
  bool get loadingBalance => throw _privateConstructorUsedError;
  String get errLoadingBalance => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  int get uconfBalance => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  String get errDeleting => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get showInfo => throw _privateConstructorUsedError;
  int get currentHeight => throw _privateConstructorUsedError;
  String get passPhraseTest => throw _privateConstructorUsedError;
  bool get ppTestPassed => throw _privateConstructorUsedError;
  String get errorPPTest => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfoStateCopyWith<InfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoStateCopyWith<$Res> {
  factory $InfoStateCopyWith(InfoState value, $Res Function(InfoState) then) =
      _$InfoStateCopyWithImpl<$Res, InfoState>;
  @useResult
  $Res call(
      {Wallet? wallet,
      bool loadingTransactions,
      String errLoadingTransactions,
      bool loadingBalance,
      String errLoadingBalance,
      int balance,
      int uconfBalance,
      List<Transaction> transactions,
      String errDeleting,
      bool deleted,
      bool showInfo,
      int currentHeight,
      String passPhraseTest,
      bool ppTestPassed,
      String errorPPTest});

  $WalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$InfoStateCopyWithImpl<$Res, $Val extends InfoState>
    implements $InfoStateCopyWith<$Res> {
  _$InfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = freezed,
    Object? loadingTransactions = null,
    Object? errLoadingTransactions = null,
    Object? loadingBalance = null,
    Object? errLoadingBalance = null,
    Object? balance = null,
    Object? uconfBalance = null,
    Object? transactions = null,
    Object? errDeleting = null,
    Object? deleted = null,
    Object? showInfo = null,
    Object? currentHeight = null,
    Object? passPhraseTest = null,
    Object? ppTestPassed = null,
    Object? errorPPTest = null,
  }) {
    return _then(_value.copyWith(
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      loadingTransactions: null == loadingTransactions
          ? _value.loadingTransactions
          : loadingTransactions // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingTransactions: null == errLoadingTransactions
          ? _value.errLoadingTransactions
          : errLoadingTransactions // ignore: cast_nullable_to_non_nullable
              as String,
      loadingBalance: null == loadingBalance
          ? _value.loadingBalance
          : loadingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingBalance: null == errLoadingBalance
          ? _value.errLoadingBalance
          : errLoadingBalance // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      uconfBalance: null == uconfBalance
          ? _value.uconfBalance
          : uconfBalance // ignore: cast_nullable_to_non_nullable
              as int,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      errDeleting: null == errDeleting
          ? _value.errDeleting
          : errDeleting // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      showInfo: null == showInfo
          ? _value.showInfo
          : showInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      currentHeight: null == currentHeight
          ? _value.currentHeight
          : currentHeight // ignore: cast_nullable_to_non_nullable
              as int,
      passPhraseTest: null == passPhraseTest
          ? _value.passPhraseTest
          : passPhraseTest // ignore: cast_nullable_to_non_nullable
              as String,
      ppTestPassed: null == ppTestPassed
          ? _value.ppTestPassed
          : ppTestPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorPPTest: null == errorPPTest
          ? _value.errorPPTest
          : errorPPTest // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InfoStateCopyWith<$Res> implements $InfoStateCopyWith<$Res> {
  factory _$$_InfoStateCopyWith(
          _$_InfoState value, $Res Function(_$_InfoState) then) =
      __$$_InfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Wallet? wallet,
      bool loadingTransactions,
      String errLoadingTransactions,
      bool loadingBalance,
      String errLoadingBalance,
      int balance,
      int uconfBalance,
      List<Transaction> transactions,
      String errDeleting,
      bool deleted,
      bool showInfo,
      int currentHeight,
      String passPhraseTest,
      bool ppTestPassed,
      String errorPPTest});

  @override
  $WalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$_InfoStateCopyWithImpl<$Res>
    extends _$InfoStateCopyWithImpl<$Res, _$_InfoState>
    implements _$$_InfoStateCopyWith<$Res> {
  __$$_InfoStateCopyWithImpl(
      _$_InfoState _value, $Res Function(_$_InfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = freezed,
    Object? loadingTransactions = null,
    Object? errLoadingTransactions = null,
    Object? loadingBalance = null,
    Object? errLoadingBalance = null,
    Object? balance = null,
    Object? uconfBalance = null,
    Object? transactions = null,
    Object? errDeleting = null,
    Object? deleted = null,
    Object? showInfo = null,
    Object? currentHeight = null,
    Object? passPhraseTest = null,
    Object? ppTestPassed = null,
    Object? errorPPTest = null,
  }) {
    return _then(_$_InfoState(
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      loadingTransactions: null == loadingTransactions
          ? _value.loadingTransactions
          : loadingTransactions // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingTransactions: null == errLoadingTransactions
          ? _value.errLoadingTransactions
          : errLoadingTransactions // ignore: cast_nullable_to_non_nullable
              as String,
      loadingBalance: null == loadingBalance
          ? _value.loadingBalance
          : loadingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingBalance: null == errLoadingBalance
          ? _value.errLoadingBalance
          : errLoadingBalance // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      uconfBalance: null == uconfBalance
          ? _value.uconfBalance
          : uconfBalance // ignore: cast_nullable_to_non_nullable
              as int,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      errDeleting: null == errDeleting
          ? _value.errDeleting
          : errDeleting // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      showInfo: null == showInfo
          ? _value.showInfo
          : showInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      currentHeight: null == currentHeight
          ? _value.currentHeight
          : currentHeight // ignore: cast_nullable_to_non_nullable
              as int,
      passPhraseTest: null == passPhraseTest
          ? _value.passPhraseTest
          : passPhraseTest // ignore: cast_nullable_to_non_nullable
              as String,
      ppTestPassed: null == ppTestPassed
          ? _value.ppTestPassed
          : ppTestPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorPPTest: null == errorPPTest
          ? _value.errorPPTest
          : errorPPTest // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InfoState extends _InfoState with DiagnosticableTreeMixin {
  const _$_InfoState(
      {required this.wallet,
      this.loadingTransactions = false,
      this.errLoadingTransactions = '',
      this.loadingBalance = false,
      this.errLoadingBalance = '',
      this.balance = 0,
      this.uconfBalance = 0,
      final List<Transaction> transactions = const [],
      this.errDeleting = '',
      this.deleted = false,
      this.showInfo = false,
      this.currentHeight = 0,
      this.passPhraseTest = '',
      this.ppTestPassed = false,
      this.errorPPTest = ''})
      : _transactions = transactions,
        super._();

  @override
  final Wallet? wallet;
  @override
  @JsonKey()
  final bool loadingTransactions;
  @override
  @JsonKey()
  final String errLoadingTransactions;
  @override
  @JsonKey()
  final bool loadingBalance;
  @override
  @JsonKey()
  final String errLoadingBalance;
  @override
  @JsonKey()
  final int balance;
  @override
  @JsonKey()
  final int uconfBalance;
  final List<Transaction> _transactions;
  @override
  @JsonKey()
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  @JsonKey()
  final String errDeleting;
  @override
  @JsonKey()
  final bool deleted;
  @override
  @JsonKey()
  final bool showInfo;
  @override
  @JsonKey()
  final int currentHeight;
  @override
  @JsonKey()
  final String passPhraseTest;
  @override
  @JsonKey()
  final bool ppTestPassed;
  @override
  @JsonKey()
  final String errorPPTest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InfoState(wallet: $wallet, loadingTransactions: $loadingTransactions, errLoadingTransactions: $errLoadingTransactions, loadingBalance: $loadingBalance, errLoadingBalance: $errLoadingBalance, balance: $balance, uconfBalance: $uconfBalance, transactions: $transactions, errDeleting: $errDeleting, deleted: $deleted, showInfo: $showInfo, currentHeight: $currentHeight, passPhraseTest: $passPhraseTest, ppTestPassed: $ppTestPassed, errorPPTest: $errorPPTest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InfoState'))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('loadingTransactions', loadingTransactions))
      ..add(
          DiagnosticsProperty('errLoadingTransactions', errLoadingTransactions))
      ..add(DiagnosticsProperty('loadingBalance', loadingBalance))
      ..add(DiagnosticsProperty('errLoadingBalance', errLoadingBalance))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('uconfBalance', uconfBalance))
      ..add(DiagnosticsProperty('transactions', transactions))
      ..add(DiagnosticsProperty('errDeleting', errDeleting))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('showInfo', showInfo))
      ..add(DiagnosticsProperty('currentHeight', currentHeight))
      ..add(DiagnosticsProperty('passPhraseTest', passPhraseTest))
      ..add(DiagnosticsProperty('ppTestPassed', ppTestPassed))
      ..add(DiagnosticsProperty('errorPPTest', errorPPTest));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoState &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.loadingTransactions, loadingTransactions) ||
                other.loadingTransactions == loadingTransactions) &&
            (identical(other.errLoadingTransactions, errLoadingTransactions) ||
                other.errLoadingTransactions == errLoadingTransactions) &&
            (identical(other.loadingBalance, loadingBalance) ||
                other.loadingBalance == loadingBalance) &&
            (identical(other.errLoadingBalance, errLoadingBalance) ||
                other.errLoadingBalance == errLoadingBalance) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.uconfBalance, uconfBalance) ||
                other.uconfBalance == uconfBalance) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.errDeleting, errDeleting) ||
                other.errDeleting == errDeleting) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.showInfo, showInfo) ||
                other.showInfo == showInfo) &&
            (identical(other.currentHeight, currentHeight) ||
                other.currentHeight == currentHeight) &&
            (identical(other.passPhraseTest, passPhraseTest) ||
                other.passPhraseTest == passPhraseTest) &&
            (identical(other.ppTestPassed, ppTestPassed) ||
                other.ppTestPassed == ppTestPassed) &&
            (identical(other.errorPPTest, errorPPTest) ||
                other.errorPPTest == errorPPTest));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      wallet,
      loadingTransactions,
      errLoadingTransactions,
      loadingBalance,
      errLoadingBalance,
      balance,
      uconfBalance,
      const DeepCollectionEquality().hash(_transactions),
      errDeleting,
      deleted,
      showInfo,
      currentHeight,
      passPhraseTest,
      ppTestPassed,
      errorPPTest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoStateCopyWith<_$_InfoState> get copyWith =>
      __$$_InfoStateCopyWithImpl<_$_InfoState>(this, _$identity);
}

abstract class _InfoState extends InfoState {
  const factory _InfoState(
      {required final Wallet? wallet,
      final bool loadingTransactions,
      final String errLoadingTransactions,
      final bool loadingBalance,
      final String errLoadingBalance,
      final int balance,
      final int uconfBalance,
      final List<Transaction> transactions,
      final String errDeleting,
      final bool deleted,
      final bool showInfo,
      final int currentHeight,
      final String passPhraseTest,
      final bool ppTestPassed,
      final String errorPPTest}) = _$_InfoState;
  const _InfoState._() : super._();

  @override
  Wallet? get wallet;
  @override
  bool get loadingTransactions;
  @override
  String get errLoadingTransactions;
  @override
  bool get loadingBalance;
  @override
  String get errLoadingBalance;
  @override
  int get balance;
  @override
  int get uconfBalance;
  @override
  List<Transaction> get transactions;
  @override
  String get errDeleting;
  @override
  bool get deleted;
  @override
  bool get showInfo;
  @override
  int get currentHeight;
  @override
  String get passPhraseTest;
  @override
  bool get ppTestPassed;
  @override
  String get errorPPTest;
  @override
  @JsonKey(ignore: true)
  _$$_InfoStateCopyWith<_$_InfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
