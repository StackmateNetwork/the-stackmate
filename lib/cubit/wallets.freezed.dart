// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  @JsonKey(ignore: true)
  $WalletsStateCopyWith<WalletsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletsStateCopyWith<$Res> {
  factory $WalletsStateCopyWith(
          WalletsState value, $Res Function(WalletsState) then) =
      _$WalletsStateCopyWithImpl<$Res>;
  $Res call(
      {List<Wallet> wallets,
      Wallet? selectedWallet,
      bool toggler,
      String errDeleting});

  $WalletCopyWith<$Res>? get selectedWallet;
}

/// @nodoc
class _$WalletsStateCopyWithImpl<$Res> implements $WalletsStateCopyWith<$Res> {
  _$WalletsStateCopyWithImpl(this._value, this._then);

  final WalletsState _value;
  // ignore: unused_field
  final $Res Function(WalletsState) _then;

  @override
  $Res call({
    Object? wallets = freezed,
    Object? selectedWallet = freezed,
    Object? toggler = freezed,
    Object? errDeleting = freezed,
  }) {
    return _then(_value.copyWith(
      wallets: wallets == freezed
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      selectedWallet: selectedWallet == freezed
          ? _value.selectedWallet
          : selectedWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      toggler: toggler == freezed
          ? _value.toggler
          : toggler // ignore: cast_nullable_to_non_nullable
              as bool,
      errDeleting: errDeleting == freezed
          ? _value.errDeleting
          : errDeleting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $WalletCopyWith<$Res>? get selectedWallet {
    if (_value.selectedWallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.selectedWallet!, (value) {
      return _then(_value.copyWith(selectedWallet: value));
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
  $Res call(
      {List<Wallet> wallets,
      Wallet? selectedWallet,
      bool toggler,
      String errDeleting});

  @override
  $WalletCopyWith<$Res>? get selectedWallet;
}

/// @nodoc
class __$$_WalletsStateCopyWithImpl<$Res>
    extends _$WalletsStateCopyWithImpl<$Res>
    implements _$$_WalletsStateCopyWith<$Res> {
  __$$_WalletsStateCopyWithImpl(
      _$_WalletsState _value, $Res Function(_$_WalletsState) _then)
      : super(_value, (v) => _then(v as _$_WalletsState));

  @override
  _$_WalletsState get _value => super._value as _$_WalletsState;

  @override
  $Res call({
    Object? wallets = freezed,
    Object? selectedWallet = freezed,
    Object? toggler = freezed,
    Object? errDeleting = freezed,
  }) {
    return _then(_$_WalletsState(
      wallets: wallets == freezed
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      selectedWallet: selectedWallet == freezed
          ? _value.selectedWallet
          : selectedWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      toggler: toggler == freezed
          ? _value.toggler
          : toggler // ignore: cast_nullable_to_non_nullable
              as bool,
      errDeleting: errDeleting == freezed
          ? _value.errDeleting
          : errDeleting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WalletsState with DiagnosticableTreeMixin implements _WalletsState {
  const _$_WalletsState(
      {final List<Wallet> wallets = const [],
      this.selectedWallet,
      this.toggler = true,
      this.errDeleting = ''})
      : _wallets = wallets;

  final List<Wallet> _wallets;
  @override
  @JsonKey()
  List<Wallet> get wallets {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletsState(wallets: $wallets, selectedWallet: $selectedWallet, toggler: $toggler, errDeleting: $errDeleting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletsState'))
      ..add(DiagnosticsProperty('wallets', wallets))
      ..add(DiagnosticsProperty('selectedWallet', selectedWallet))
      ..add(DiagnosticsProperty('toggler', toggler))
      ..add(DiagnosticsProperty('errDeleting', errDeleting));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletsState &&
            const DeepCollectionEquality().equals(other._wallets, _wallets) &&
            const DeepCollectionEquality()
                .equals(other.selectedWallet, selectedWallet) &&
            const DeepCollectionEquality().equals(other.toggler, toggler) &&
            const DeepCollectionEquality()
                .equals(other.errDeleting, errDeleting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wallets),
      const DeepCollectionEquality().hash(selectedWallet),
      const DeepCollectionEquality().hash(toggler),
      const DeepCollectionEquality().hash(errDeleting));

  @JsonKey(ignore: true)
  @override
  _$$_WalletsStateCopyWith<_$_WalletsState> get copyWith =>
      __$$_WalletsStateCopyWithImpl<_$_WalletsState>(this, _$identity);
}

abstract class _WalletsState implements WalletsState {
  const factory _WalletsState(
      {final List<Wallet> wallets,
      final Wallet? selectedWallet,
      final bool toggler,
      final String errDeleting}) = _$_WalletsState;

  @override
  List<Wallet> get wallets => throw _privateConstructorUsedError;
  @override
  Wallet? get selectedWallet => throw _privateConstructorUsedError;
  @override
  bool get toggler => throw _privateConstructorUsedError;
  @override
  String get errDeleting => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WalletsStateCopyWith<_$_WalletsState> get copyWith =>
      throw _privateConstructorUsedError;
}
