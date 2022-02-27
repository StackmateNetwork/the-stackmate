// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReceiveStateTearOff {
  const _$ReceiveStateTearOff();

  _ReceiveState call(
      {bool loadingAddress = true,
      String errLoadingAddress = '',
      String? address}) {
    return _ReceiveState(
      loadingAddress: loadingAddress,
      errLoadingAddress: errLoadingAddress,
      address: address,
    );
  }
}

/// @nodoc
const $ReceiveState = _$ReceiveStateTearOff();

/// @nodoc
mixin _$ReceiveState {
  bool get loadingAddress => throw _privateConstructorUsedError;
  String get errLoadingAddress => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReceiveStateCopyWith<ReceiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiveStateCopyWith<$Res> {
  factory $ReceiveStateCopyWith(
          ReceiveState value, $Res Function(ReceiveState) then) =
      _$ReceiveStateCopyWithImpl<$Res>;
  $Res call({bool loadingAddress, String errLoadingAddress, String? address});
}

/// @nodoc
class _$ReceiveStateCopyWithImpl<$Res> implements $ReceiveStateCopyWith<$Res> {
  _$ReceiveStateCopyWithImpl(this._value, this._then);

  final ReceiveState _value;
  // ignore: unused_field
  final $Res Function(ReceiveState) _then;

  @override
  $Res call({
    Object? loadingAddress = freezed,
    Object? errLoadingAddress = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      loadingAddress: loadingAddress == freezed
          ? _value.loadingAddress
          : loadingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingAddress: errLoadingAddress == freezed
          ? _value.errLoadingAddress
          : errLoadingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ReceiveStateCopyWith<$Res>
    implements $ReceiveStateCopyWith<$Res> {
  factory _$ReceiveStateCopyWith(
          _ReceiveState value, $Res Function(_ReceiveState) then) =
      __$ReceiveStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loadingAddress, String errLoadingAddress, String? address});
}

/// @nodoc
class __$ReceiveStateCopyWithImpl<$Res> extends _$ReceiveStateCopyWithImpl<$Res>
    implements _$ReceiveStateCopyWith<$Res> {
  __$ReceiveStateCopyWithImpl(
      _ReceiveState _value, $Res Function(_ReceiveState) _then)
      : super(_value, (v) => _then(v as _ReceiveState));

  @override
  _ReceiveState get _value => super._value as _ReceiveState;

  @override
  $Res call({
    Object? loadingAddress = freezed,
    Object? errLoadingAddress = freezed,
    Object? address = freezed,
  }) {
    return _then(_ReceiveState(
      loadingAddress: loadingAddress == freezed
          ? _value.loadingAddress
          : loadingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingAddress: errLoadingAddress == freezed
          ? _value.errLoadingAddress
          : errLoadingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReceiveState with DiagnosticableTreeMixin implements _ReceiveState {
  const _$_ReceiveState(
      {this.loadingAddress = true, this.errLoadingAddress = '', this.address});

  @JsonKey(defaultValue: true)
  @override
  final bool loadingAddress;
  @JsonKey(defaultValue: '')
  @override
  final String errLoadingAddress;
  @override
  final String? address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceiveState(loadingAddress: $loadingAddress, errLoadingAddress: $errLoadingAddress, address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReceiveState'))
      ..add(DiagnosticsProperty('loadingAddress', loadingAddress))
      ..add(DiagnosticsProperty('errLoadingAddress', errLoadingAddress))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReceiveState &&
            (identical(other.loadingAddress, loadingAddress) ||
                const DeepCollectionEquality()
                    .equals(other.loadingAddress, loadingAddress)) &&
            (identical(other.errLoadingAddress, errLoadingAddress) ||
                const DeepCollectionEquality()
                    .equals(other.errLoadingAddress, errLoadingAddress)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loadingAddress) ^
      const DeepCollectionEquality().hash(errLoadingAddress) ^
      const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  _$ReceiveStateCopyWith<_ReceiveState> get copyWith =>
      __$ReceiveStateCopyWithImpl<_ReceiveState>(this, _$identity);
}

abstract class _ReceiveState implements ReceiveState {
  const factory _ReceiveState(
      {bool loadingAddress,
      String errLoadingAddress,
      String? address}) = _$_ReceiveState;

  @override
  bool get loadingAddress => throw _privateConstructorUsedError;
  @override
  String get errLoadingAddress => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReceiveStateCopyWith<_ReceiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
