// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'psbt-tool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PSBTStateTearOff {
  const _$PSBTStateTearOff();

  _PSBTState call(
      {bool broadcasting = false,
      String errBroadcasting = '',
      String psbt = '',
      String txId = ''}) {
    return _PSBTState(
      broadcasting: broadcasting,
      errBroadcasting: errBroadcasting,
      psbt: psbt,
      txId: txId,
    );
  }
}

/// @nodoc
const $PSBTState = _$PSBTStateTearOff();

/// @nodoc
mixin _$PSBTState {
  bool get broadcasting => throw _privateConstructorUsedError;
  String get errBroadcasting => throw _privateConstructorUsedError;
  String get psbt => throw _privateConstructorUsedError;
  String get txId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PSBTStateCopyWith<PSBTState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PSBTStateCopyWith<$Res> {
  factory $PSBTStateCopyWith(PSBTState value, $Res Function(PSBTState) then) =
      _$PSBTStateCopyWithImpl<$Res>;
  $Res call(
      {bool broadcasting, String errBroadcasting, String psbt, String txId});
}

/// @nodoc
class _$PSBTStateCopyWithImpl<$Res> implements $PSBTStateCopyWith<$Res> {
  _$PSBTStateCopyWithImpl(this._value, this._then);

  final PSBTState _value;
  // ignore: unused_field
  final $Res Function(PSBTState) _then;

  @override
  $Res call({
    Object? broadcasting = freezed,
    Object? errBroadcasting = freezed,
    Object? psbt = freezed,
    Object? txId = freezed,
  }) {
    return _then(_value.copyWith(
      broadcasting: broadcasting == freezed
          ? _value.broadcasting
          : broadcasting // ignore: cast_nullable_to_non_nullable
              as bool,
      errBroadcasting: errBroadcasting == freezed
          ? _value.errBroadcasting
          : errBroadcasting // ignore: cast_nullable_to_non_nullable
              as String,
      psbt: psbt == freezed
          ? _value.psbt
          : psbt // ignore: cast_nullable_to_non_nullable
              as String,
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PSBTStateCopyWith<$Res> implements $PSBTStateCopyWith<$Res> {
  factory _$PSBTStateCopyWith(
          _PSBTState value, $Res Function(_PSBTState) then) =
      __$PSBTStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool broadcasting, String errBroadcasting, String psbt, String txId});
}

/// @nodoc
class __$PSBTStateCopyWithImpl<$Res> extends _$PSBTStateCopyWithImpl<$Res>
    implements _$PSBTStateCopyWith<$Res> {
  __$PSBTStateCopyWithImpl(_PSBTState _value, $Res Function(_PSBTState) _then)
      : super(_value, (v) => _then(v as _PSBTState));

  @override
  _PSBTState get _value => super._value as _PSBTState;

  @override
  $Res call({
    Object? broadcasting = freezed,
    Object? errBroadcasting = freezed,
    Object? psbt = freezed,
    Object? txId = freezed,
  }) {
    return _then(_PSBTState(
      broadcasting: broadcasting == freezed
          ? _value.broadcasting
          : broadcasting // ignore: cast_nullable_to_non_nullable
              as bool,
      errBroadcasting: errBroadcasting == freezed
          ? _value.errBroadcasting
          : errBroadcasting // ignore: cast_nullable_to_non_nullable
              as String,
      psbt: psbt == freezed
          ? _value.psbt
          : psbt // ignore: cast_nullable_to_non_nullable
              as String,
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PSBTState extends _PSBTState with DiagnosticableTreeMixin {
  const _$_PSBTState(
      {this.broadcasting = false,
      this.errBroadcasting = '',
      this.psbt = '',
      this.txId = ''})
      : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool broadcasting;
  @JsonKey(defaultValue: '')
  @override
  final String errBroadcasting;
  @JsonKey(defaultValue: '')
  @override
  final String psbt;
  @JsonKey(defaultValue: '')
  @override
  final String txId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PSBTState(broadcasting: $broadcasting, errBroadcasting: $errBroadcasting, psbt: $psbt, txId: $txId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PSBTState'))
      ..add(DiagnosticsProperty('broadcasting', broadcasting))
      ..add(DiagnosticsProperty('errBroadcasting', errBroadcasting))
      ..add(DiagnosticsProperty('psbt', psbt))
      ..add(DiagnosticsProperty('txId', txId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PSBTState &&
            (identical(other.broadcasting, broadcasting) ||
                const DeepCollectionEquality()
                    .equals(other.broadcasting, broadcasting)) &&
            (identical(other.errBroadcasting, errBroadcasting) ||
                const DeepCollectionEquality()
                    .equals(other.errBroadcasting, errBroadcasting)) &&
            (identical(other.psbt, psbt) ||
                const DeepCollectionEquality().equals(other.psbt, psbt)) &&
            (identical(other.txId, txId) ||
                const DeepCollectionEquality().equals(other.txId, txId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(broadcasting) ^
      const DeepCollectionEquality().hash(errBroadcasting) ^
      const DeepCollectionEquality().hash(psbt) ^
      const DeepCollectionEquality().hash(txId);

  @JsonKey(ignore: true)
  @override
  _$PSBTStateCopyWith<_PSBTState> get copyWith =>
      __$PSBTStateCopyWithImpl<_PSBTState>(this, _$identity);
}

abstract class _PSBTState extends PSBTState {
  const factory _PSBTState(
      {bool broadcasting,
      String errBroadcasting,
      String psbt,
      String txId}) = _$_PSBTState;
  const _PSBTState._() : super._();

  @override
  bool get broadcasting => throw _privateConstructorUsedError;
  @override
  String get errBroadcasting => throw _privateConstructorUsedError;
  @override
  String get psbt => throw _privateConstructorUsedError;
  @override
  String get txId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PSBTStateCopyWith<_PSBTState> get copyWith =>
      throw _privateConstructorUsedError;
}