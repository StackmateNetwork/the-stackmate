// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'from-old-xpub.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$XpubImportWalletState {
  XpubImportWalletStep get currentStep => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get savingWallet => throw _privateConstructorUsedError;
  String get errSavingWallet => throw _privateConstructorUsedError;
  bool get newWalletSaved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $XpubImportWalletStateCopyWith<XpubImportWalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XpubImportWalletStateCopyWith<$Res> {
  factory $XpubImportWalletStateCopyWith(XpubImportWalletState value,
          $Res Function(XpubImportWalletState) then) =
      _$XpubImportWalletStateCopyWithImpl<$Res>;
  $Res call(
      {XpubImportWalletStep currentStep,
      String label,
      bool savingWallet,
      String errSavingWallet,
      bool newWalletSaved});
}

/// @nodoc
class _$XpubImportWalletStateCopyWithImpl<$Res>
    implements $XpubImportWalletStateCopyWith<$Res> {
  _$XpubImportWalletStateCopyWithImpl(this._value, this._then);

  final XpubImportWalletState _value;
  // ignore: unused_field
  final $Res Function(XpubImportWalletState) _then;

  @override
  $Res call({
    Object? currentStep = freezed,
    Object? label = freezed,
    Object? savingWallet = freezed,
    Object? errSavingWallet = freezed,
    Object? newWalletSaved = freezed,
  }) {
    return _then(_value.copyWith(
      currentStep: currentStep == freezed
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as XpubImportWalletStep,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      savingWallet: savingWallet == freezed
          ? _value.savingWallet
          : savingWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      errSavingWallet: errSavingWallet == freezed
          ? _value.errSavingWallet
          : errSavingWallet // ignore: cast_nullable_to_non_nullable
              as String,
      newWalletSaved: newWalletSaved == freezed
          ? _value.newWalletSaved
          : newWalletSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SeedImportXpubStateCopyWith<$Res>
    implements $XpubImportWalletStateCopyWith<$Res> {
  factory _$$_SeedImportXpubStateCopyWith(_$_SeedImportXpubState value,
          $Res Function(_$_SeedImportXpubState) then) =
      __$$_SeedImportXpubStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {XpubImportWalletStep currentStep,
      String label,
      bool savingWallet,
      String errSavingWallet,
      bool newWalletSaved});
}

/// @nodoc
class __$$_SeedImportXpubStateCopyWithImpl<$Res>
    extends _$XpubImportWalletStateCopyWithImpl<$Res>
    implements _$$_SeedImportXpubStateCopyWith<$Res> {
  __$$_SeedImportXpubStateCopyWithImpl(_$_SeedImportXpubState _value,
      $Res Function(_$_SeedImportXpubState) _then)
      : super(_value, (v) => _then(v as _$_SeedImportXpubState));

  @override
  _$_SeedImportXpubState get _value => super._value as _$_SeedImportXpubState;

  @override
  $Res call({
    Object? currentStep = freezed,
    Object? label = freezed,
    Object? savingWallet = freezed,
    Object? errSavingWallet = freezed,
    Object? newWalletSaved = freezed,
  }) {
    return _then(_$_SeedImportXpubState(
      currentStep: currentStep == freezed
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as XpubImportWalletStep,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      savingWallet: savingWallet == freezed
          ? _value.savingWallet
          : savingWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      errSavingWallet: errSavingWallet == freezed
          ? _value.errSavingWallet
          : errSavingWallet // ignore: cast_nullable_to_non_nullable
              as String,
      newWalletSaved: newWalletSaved == freezed
          ? _value.newWalletSaved
          : newWalletSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SeedImportXpubState extends _SeedImportXpubState {
  const _$_SeedImportXpubState(
      {this.currentStep = XpubImportWalletStep.import,
      this.label = '',
      this.savingWallet = false,
      this.errSavingWallet = '',
      this.newWalletSaved = false})
      : super._();

  @override
  @JsonKey()
  final XpubImportWalletStep currentStep;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final bool savingWallet;
  @override
  @JsonKey()
  final String errSavingWallet;
  @override
  @JsonKey()
  final bool newWalletSaved;

  @override
  String toString() {
    return 'XpubImportWalletState(currentStep: $currentStep, label: $label, savingWallet: $savingWallet, errSavingWallet: $errSavingWallet, newWalletSaved: $newWalletSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeedImportXpubState &&
            const DeepCollectionEquality()
                .equals(other.currentStep, currentStep) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality()
                .equals(other.savingWallet, savingWallet) &&
            const DeepCollectionEquality()
                .equals(other.errSavingWallet, errSavingWallet) &&
            const DeepCollectionEquality()
                .equals(other.newWalletSaved, newWalletSaved));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentStep),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(savingWallet),
      const DeepCollectionEquality().hash(errSavingWallet),
      const DeepCollectionEquality().hash(newWalletSaved));

  @JsonKey(ignore: true)
  @override
  _$$_SeedImportXpubStateCopyWith<_$_SeedImportXpubState> get copyWith =>
      __$$_SeedImportXpubStateCopyWithImpl<_$_SeedImportXpubState>(
          this, _$identity);
}

abstract class _SeedImportXpubState extends XpubImportWalletState {
  const factory _SeedImportXpubState(
      {final XpubImportWalletStep currentStep,
      final String label,
      final bool savingWallet,
      final String errSavingWallet,
      final bool newWalletSaved}) = _$_SeedImportXpubState;
  const _SeedImportXpubState._() : super._();

  @override
  XpubImportWalletStep get currentStep => throw _privateConstructorUsedError;
  @override
  String get label => throw _privateConstructorUsedError;
  @override
  bool get savingWallet => throw _privateConstructorUsedError;
  @override
  String get errSavingWallet => throw _privateConstructorUsedError;
  @override
  bool get newWalletSaved => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SeedImportXpubStateCopyWith<_$_SeedImportXpubState> get copyWith =>
      throw _privateConstructorUsedError;
}
