// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeesState {
  Fees get fees => throw _privateConstructorUsedError;
  bool get updating => throw _privateConstructorUsedError;
  String get errUpdating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeesStateCopyWith<FeesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeesStateCopyWith<$Res> {
  factory $FeesStateCopyWith(FeesState value, $Res Function(FeesState) then) =
      _$FeesStateCopyWithImpl<$Res, FeesState>;
  @useResult
  $Res call({Fees fees, bool updating, String errUpdating});

  $FeesCopyWith<$Res> get fees;
}

/// @nodoc
class _$FeesStateCopyWithImpl<$Res, $Val extends FeesState>
    implements $FeesStateCopyWith<$Res> {
  _$FeesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fees = null,
    Object? updating = null,
    Object? errUpdating = null,
  }) {
    return _then(_value.copyWith(
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fees,
      updating: null == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
      errUpdating: null == errUpdating
          ? _value.errUpdating
          : errUpdating // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeesCopyWith<$Res> get fees {
    return $FeesCopyWith<$Res>(_value.fees, (value) {
      return _then(_value.copyWith(fees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeesStateCopyWith<$Res> implements $FeesStateCopyWith<$Res> {
  factory _$$_FeesStateCopyWith(
          _$_FeesState value, $Res Function(_$_FeesState) then) =
      __$$_FeesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fees fees, bool updating, String errUpdating});

  @override
  $FeesCopyWith<$Res> get fees;
}

/// @nodoc
class __$$_FeesStateCopyWithImpl<$Res>
    extends _$FeesStateCopyWithImpl<$Res, _$_FeesState>
    implements _$$_FeesStateCopyWith<$Res> {
  __$$_FeesStateCopyWithImpl(
      _$_FeesState _value, $Res Function(_$_FeesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fees = null,
    Object? updating = null,
    Object? errUpdating = null,
  }) {
    return _then(_$_FeesState(
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fees,
      updating: null == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
      errUpdating: null == errUpdating
          ? _value.errUpdating
          : errUpdating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FeesState with DiagnosticableTreeMixin implements _FeesState {
  const _$_FeesState(
      {this.fees = const Fees(timestamp: 0, slow: 0.0, medium: 0.0, fast: 0.0),
      this.updating = false,
      this.errUpdating = ''});

  @override
  @JsonKey()
  final Fees fees;
  @override
  @JsonKey()
  final bool updating;
  @override
  @JsonKey()
  final String errUpdating;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeesState(fees: $fees, updating: $updating, errUpdating: $errUpdating)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeesState'))
      ..add(DiagnosticsProperty('fees', fees))
      ..add(DiagnosticsProperty('updating', updating))
      ..add(DiagnosticsProperty('errUpdating', errUpdating));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeesState &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.updating, updating) ||
                other.updating == updating) &&
            (identical(other.errUpdating, errUpdating) ||
                other.errUpdating == errUpdating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fees, updating, errUpdating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeesStateCopyWith<_$_FeesState> get copyWith =>
      __$$_FeesStateCopyWithImpl<_$_FeesState>(this, _$identity);
}

abstract class _FeesState implements FeesState {
  const factory _FeesState(
      {final Fees fees,
      final bool updating,
      final String errUpdating}) = _$_FeesState;

  @override
  Fees get fees;
  @override
  bool get updating;
  @override
  String get errUpdating;
  @override
  @JsonKey(ignore: true)
  _$$_FeesStateCopyWith<_$_FeesState> get copyWith =>
      throw _privateConstructorUsedError;
}
