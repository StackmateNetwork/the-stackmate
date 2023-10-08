// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallets.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletsState {
  List<Wallet> get wallets => throw _privateConstructorUsedError;
  Wallet? get selectedWallet => throw _privateConstructorUsedError;
  bool get toggler => throw _privateConstructorUsedError;
  String get errDeleting => throw _privateConstructorUsedError;
  int get networth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletsStateCopyWith<WalletsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletsStateCopyWith<$Res> {
  factory $WalletsStateCopyWith(
          WalletsState value, $Res Function(WalletsState) then) =
      _$WalletsStateCopyWithImpl<$Res, WalletsState>;
  @useResult
  $Res call(
      {List<Wallet> wallets,
      Wallet? selectedWallet,
      bool toggler,
      String errDeleting,
      int networth});

  $WalletCopyWith<$Res>? get selectedWallet;
}

/// @nodoc
class _$WalletsStateCopyWithImpl<$Res, $Val extends WalletsState>
    implements $WalletsStateCopyWith<$Res> {
  _$WalletsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallets = null,
    Object? selectedWallet = freezed,
    Object? toggler = null,
    Object? errDeleting = null,
    Object? networth = null,
  }) {
    return _then(_value.copyWith(
      wallets: null == wallets
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      selectedWallet: freezed == selectedWallet
          ? _value.selectedWallet
          : selectedWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      toggler: null == toggler
          ? _value.toggler
          : toggler // ignore: cast_nullable_to_non_nullable
              as bool,
      errDeleting: null == errDeleting
          ? _value.errDeleting
          : errDeleting // ignore: cast_nullable_to_non_nullable
              as String,
      networth: null == networth
          ? _value.networth
          : networth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get selectedWallet {
    if (_value.selectedWallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.selectedWallet!, (value) {
      return _then(_value.copyWith(selectedWallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WalletsStateCopyWith<$Res>
    implements $WalletsStateCopyWith<$Res> {
  factory _$$_WalletsStateCopyWith(
          _$_WalletsState value, $Res Function(_$_WalletsState) then) =
      __$$_WalletsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Wallet> wallets,
      Wallet? selectedWallet,
      bool toggler,
      String errDeleting,
      int networth});

  @override
  $WalletCopyWith<$Res>? get selectedWallet;
}

/// @nodoc
class __$$_WalletsStateCopyWithImpl<$Res>
    extends _$WalletsStateCopyWithImpl<$Res, _$_WalletsState>
    implements _$$_WalletsStateCopyWith<$Res> {
  __$$_WalletsStateCopyWithImpl(
      _$_WalletsState _value, $Res Function(_$_WalletsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallets = null,
    Object? selectedWallet = freezed,
    Object? toggler = null,
    Object? errDeleting = null,
    Object? networth = null,
  }) {
    return _then(_$_WalletsState(
      wallets: null == wallets
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      selectedWallet: freezed == selectedWallet
          ? _value.selectedWallet
          : selectedWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      toggler: null == toggler
          ? _value.toggler
          : toggler // ignore: cast_nullable_to_non_nullable
              as bool,
      errDeleting: null == errDeleting
          ? _value.errDeleting
          : errDeleting // ignore: cast_nullable_to_non_nullable
              as String,
      networth: null == networth
          ? _value.networth
          : networth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WalletsState with DiagnosticableTreeMixin implements _WalletsState {
  const _$_WalletsState(
      {final List<Wallet> wallets = const [],
      this.selectedWallet,
      this.toggler = true,
      this.errDeleting = '',
      this.networth = 0})
      : _wallets = wallets;

  final List<Wallet> _wallets;
  @override
  @JsonKey()
  List<Wallet> get wallets {
    if (_wallets is EqualUnmodifiableListView) return _wallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  @override
  final Wallet? selectedWallet;
  @override
  @JsonKey()
  final bool toggler;
  @override
  @JsonKey()
  final String errDeleting;
  @override
  @JsonKey()
  final int networth;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletsState(wallets: $wallets, selectedWallet: $selectedWallet, toggler: $toggler, errDeleting: $errDeleting, networth: $networth)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletsState'))
      ..add(DiagnosticsProperty('wallets', wallets))
      ..add(DiagnosticsProperty('selectedWallet', selectedWallet))
      ..add(DiagnosticsProperty('toggler', toggler))
      ..add(DiagnosticsProperty('errDeleting', errDeleting))
      ..add(DiagnosticsProperty('networth', networth));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletsState &&
            const DeepCollectionEquality().equals(other._wallets, _wallets) &&
            (identical(other.selectedWallet, selectedWallet) ||
                other.selectedWallet == selectedWallet) &&
            (identical(other.toggler, toggler) || other.toggler == toggler) &&
            (identical(other.errDeleting, errDeleting) ||
                other.errDeleting == errDeleting) &&
            (identical(other.networth, networth) ||
                other.networth == networth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wallets),
      selectedWallet,
      toggler,
      errDeleting,
      networth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletsStateCopyWith<_$_WalletsState> get copyWith =>
      __$$_WalletsStateCopyWithImpl<_$_WalletsState>(this, _$identity);
}

abstract class _WalletsState implements WalletsState {
  const factory _WalletsState(
      {final List<Wallet> wallets,
      final Wallet? selectedWallet,
      final bool toggler,
      final String errDeleting,
      final int networth}) = _$_WalletsState;

  @override
  List<Wallet> get wallets;
  @override
  Wallet? get selectedWallet;
  @override
  bool get toggler;
  @override
  String get errDeleting;
  @override
  int get networth;
  @override
  @JsonKey(ignore: true)
  _$$_WalletsStateCopyWith<_$_WalletsState> get copyWith =>
      throw _privateConstructorUsedError;
}
