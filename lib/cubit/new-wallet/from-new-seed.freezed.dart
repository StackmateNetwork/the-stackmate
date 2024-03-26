// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'from-new-seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeedGenerateWalletState {
  SeedGenerateWalletSteps get currentStep => throw _privateConstructorUsedError;
  String get walletLabel => throw _privateConstructorUsedError;
  String get walletLabelError => throw _privateConstructorUsedError;
  bool get savingWallet => throw _privateConstructorUsedError;
  String get savingWalletError => throw _privateConstructorUsedError;
  bool get newWalletSaved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeedGenerateWalletStateCopyWith<SeedGenerateWalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedGenerateWalletStateCopyWith<$Res> {
  factory $SeedGenerateWalletStateCopyWith(SeedGenerateWalletState value,
          $Res Function(SeedGenerateWalletState) then) =
      _$SeedGenerateWalletStateCopyWithImpl<$Res, SeedGenerateWalletState>;
  @useResult
  $Res call(
      {SeedGenerateWalletSteps currentStep,
      String walletLabel,
      String walletLabelError,
      bool savingWallet,
      String savingWalletError,
      bool newWalletSaved});
}

/// @nodoc
class _$SeedGenerateWalletStateCopyWithImpl<$Res,
        $Val extends SeedGenerateWalletState>
    implements $SeedGenerateWalletStateCopyWith<$Res> {
  _$SeedGenerateWalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? walletLabel = null,
    Object? walletLabelError = null,
    Object? savingWallet = null,
    Object? savingWalletError = null,
    Object? newWalletSaved = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as SeedGenerateWalletSteps,
      walletLabel: null == walletLabel
          ? _value.walletLabel
          : walletLabel // ignore: cast_nullable_to_non_nullable
              as String,
      walletLabelError: null == walletLabelError
          ? _value.walletLabelError
          : walletLabelError // ignore: cast_nullable_to_non_nullable
              as String,
      savingWallet: null == savingWallet
          ? _value.savingWallet
          : savingWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      savingWalletError: null == savingWalletError
          ? _value.savingWalletError
          : savingWalletError // ignore: cast_nullable_to_non_nullable
              as String,
      newWalletSaved: null == newWalletSaved
          ? _value.newWalletSaved
          : newWalletSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeedGenerateWalletStateImplCopyWith<$Res>
    implements $SeedGenerateWalletStateCopyWith<$Res> {
  factory _$$SeedGenerateWalletStateImplCopyWith(
          _$SeedGenerateWalletStateImpl value,
          $Res Function(_$SeedGenerateWalletStateImpl) then) =
      __$$SeedGenerateWalletStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SeedGenerateWalletSteps currentStep,
      String walletLabel,
      String walletLabelError,
      bool savingWallet,
      String savingWalletError,
      bool newWalletSaved});
}

/// @nodoc
class __$$SeedGenerateWalletStateImplCopyWithImpl<$Res>
    extends _$SeedGenerateWalletStateCopyWithImpl<$Res,
        _$SeedGenerateWalletStateImpl>
    implements _$$SeedGenerateWalletStateImplCopyWith<$Res> {
  __$$SeedGenerateWalletStateImplCopyWithImpl(
      _$SeedGenerateWalletStateImpl _value,
      $Res Function(_$SeedGenerateWalletStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? walletLabel = null,
    Object? walletLabelError = null,
    Object? savingWallet = null,
    Object? savingWalletError = null,
    Object? newWalletSaved = null,
  }) {
    return _then(_$SeedGenerateWalletStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as SeedGenerateWalletSteps,
      walletLabel: null == walletLabel
          ? _value.walletLabel
          : walletLabel // ignore: cast_nullable_to_non_nullable
              as String,
      walletLabelError: null == walletLabelError
          ? _value.walletLabelError
          : walletLabelError // ignore: cast_nullable_to_non_nullable
              as String,
      savingWallet: null == savingWallet
          ? _value.savingWallet
          : savingWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      savingWalletError: null == savingWalletError
          ? _value.savingWalletError
          : savingWalletError // ignore: cast_nullable_to_non_nullable
              as String,
      newWalletSaved: null == newWalletSaved
          ? _value.newWalletSaved
          : newWalletSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SeedGenerateWalletStateImpl extends _SeedGenerateWalletState
    with DiagnosticableTreeMixin {
  const _$SeedGenerateWalletStateImpl(
      {this.currentStep = SeedGenerateWalletSteps.warning,
      this.walletLabel = '',
      this.walletLabelError = '',
      this.savingWallet = false,
      this.savingWalletError = '',
      this.newWalletSaved = false})
      : super._();

  @override
  @JsonKey()
  final SeedGenerateWalletSteps currentStep;
  @override
  @JsonKey()
  final String walletLabel;
  @override
  @JsonKey()
  final String walletLabelError;
  @override
  @JsonKey()
  final bool savingWallet;
  @override
  @JsonKey()
  final String savingWalletError;
  @override
  @JsonKey()
  final bool newWalletSaved;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeedGenerateWalletState(currentStep: $currentStep, walletLabel: $walletLabel, walletLabelError: $walletLabelError, savingWallet: $savingWallet, savingWalletError: $savingWalletError, newWalletSaved: $newWalletSaved)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeedGenerateWalletState'))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('walletLabel', walletLabel))
      ..add(DiagnosticsProperty('walletLabelError', walletLabelError))
      ..add(DiagnosticsProperty('savingWallet', savingWallet))
      ..add(DiagnosticsProperty('savingWalletError', savingWalletError))
      ..add(DiagnosticsProperty('newWalletSaved', newWalletSaved));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedGenerateWalletStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.walletLabel, walletLabel) ||
                other.walletLabel == walletLabel) &&
            (identical(other.walletLabelError, walletLabelError) ||
                other.walletLabelError == walletLabelError) &&
            (identical(other.savingWallet, savingWallet) ||
                other.savingWallet == savingWallet) &&
            (identical(other.savingWalletError, savingWalletError) ||
                other.savingWalletError == savingWalletError) &&
            (identical(other.newWalletSaved, newWalletSaved) ||
                other.newWalletSaved == newWalletSaved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, walletLabel,
      walletLabelError, savingWallet, savingWalletError, newWalletSaved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedGenerateWalletStateImplCopyWith<_$SeedGenerateWalletStateImpl>
      get copyWith => __$$SeedGenerateWalletStateImplCopyWithImpl<
          _$SeedGenerateWalletStateImpl>(this, _$identity);
}

abstract class _SeedGenerateWalletState extends SeedGenerateWalletState {
  const factory _SeedGenerateWalletState(
      {final SeedGenerateWalletSteps currentStep,
      final String walletLabel,
      final String walletLabelError,
      final bool savingWallet,
      final String savingWalletError,
      final bool newWalletSaved}) = _$SeedGenerateWalletStateImpl;
  const _SeedGenerateWalletState._() : super._();

  @override
  SeedGenerateWalletSteps get currentStep;
  @override
  String get walletLabel;
  @override
  String get walletLabelError;
  @override
  bool get savingWallet;
  @override
  String get savingWalletError;
  @override
  bool get newWalletSaved;
  @override
  @JsonKey(ignore: true)
  _$$SeedGenerateWalletStateImplCopyWith<_$SeedGenerateWalletStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
