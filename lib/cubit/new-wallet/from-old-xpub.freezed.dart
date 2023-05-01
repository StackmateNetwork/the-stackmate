// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$XpubImportWalletStateCopyWithImpl<$Res, XpubImportWalletState>;
  @useResult
  $Res call(
      {XpubImportWalletStep currentStep,
      String label,
      bool savingWallet,
      String errSavingWallet,
      bool newWalletSaved});
}

/// @nodoc
class _$XpubImportWalletStateCopyWithImpl<$Res,
        $Val extends XpubImportWalletState>
    implements $XpubImportWalletStateCopyWith<$Res> {
  _$XpubImportWalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? label = null,
    Object? savingWallet = null,
    Object? errSavingWallet = null,
    Object? newWalletSaved = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as XpubImportWalletStep,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      savingWallet: null == savingWallet
          ? _value.savingWallet
          : savingWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      errSavingWallet: null == errSavingWallet
          ? _value.errSavingWallet
          : errSavingWallet // ignore: cast_nullable_to_non_nullable
              as String,
      newWalletSaved: null == newWalletSaved
          ? _value.newWalletSaved
          : newWalletSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeedImportXpubStateCopyWith<$Res>
    implements $XpubImportWalletStateCopyWith<$Res> {
  factory _$$_SeedImportXpubStateCopyWith(_$_SeedImportXpubState value,
          $Res Function(_$_SeedImportXpubState) then) =
      __$$_SeedImportXpubStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {XpubImportWalletStep currentStep,
      String label,
      bool savingWallet,
      String errSavingWallet,
      bool newWalletSaved});
}

/// @nodoc
class __$$_SeedImportXpubStateCopyWithImpl<$Res>
    extends _$XpubImportWalletStateCopyWithImpl<$Res, _$_SeedImportXpubState>
    implements _$$_SeedImportXpubStateCopyWith<$Res> {
  __$$_SeedImportXpubStateCopyWithImpl(_$_SeedImportXpubState _value,
      $Res Function(_$_SeedImportXpubState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? label = null,
    Object? savingWallet = null,
    Object? errSavingWallet = null,
    Object? newWalletSaved = null,
  }) {
    return _then(_$_SeedImportXpubState(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as XpubImportWalletStep,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      savingWallet: null == savingWallet
          ? _value.savingWallet
          : savingWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      errSavingWallet: null == errSavingWallet
          ? _value.errSavingWallet
          : errSavingWallet // ignore: cast_nullable_to_non_nullable
              as String,
      newWalletSaved: null == newWalletSaved
          ? _value.newWalletSaved
          : newWalletSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SeedImportXpubState extends _SeedImportXpubState
    with DiagnosticableTreeMixin {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XpubImportWalletState(currentStep: $currentStep, label: $label, savingWallet: $savingWallet, errSavingWallet: $errSavingWallet, newWalletSaved: $newWalletSaved)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'XpubImportWalletState'))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('savingWallet', savingWallet))
      ..add(DiagnosticsProperty('errSavingWallet', errSavingWallet))
      ..add(DiagnosticsProperty('newWalletSaved', newWalletSaved));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeedImportXpubState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.savingWallet, savingWallet) ||
                other.savingWallet == savingWallet) &&
            (identical(other.errSavingWallet, errSavingWallet) ||
                other.errSavingWallet == errSavingWallet) &&
            (identical(other.newWalletSaved, newWalletSaved) ||
                other.newWalletSaved == newWalletSaved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, label, savingWallet,
      errSavingWallet, newWalletSaved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
  XpubImportWalletStep get currentStep;
  @override
  String get label;
  @override
  bool get savingWallet;
  @override
  String get errSavingWallet;
  @override
  bool get newWalletSaved;
  @override
  @JsonKey(ignore: true)
  _$$_SeedImportXpubStateCopyWith<_$_SeedImportXpubState> get copyWith =>
      throw _privateConstructorUsedError;
}
