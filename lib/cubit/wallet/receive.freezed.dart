// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReceiveState {
  bool get loadingAddress => throw _privateConstructorUsedError;
  String get errLoadingAddress => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReceiveStateCopyWith<ReceiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiveStateCopyWith<$Res> {
  factory $ReceiveStateCopyWith(
          ReceiveState value, $Res Function(ReceiveState) then) =
      _$ReceiveStateCopyWithImpl<$Res>;
  $Res call(
      {bool loadingAddress,
      String errLoadingAddress,
      String address,
      int index});
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
    Object? index = freezed,
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
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ReceiveStateCopyWith<$Res>
    implements $ReceiveStateCopyWith<$Res> {
  factory _$$_ReceiveStateCopyWith(
          _$_ReceiveState value, $Res Function(_$_ReceiveState) then) =
      __$$_ReceiveStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loadingAddress,
      String errLoadingAddress,
      String address,
      int index});
}

/// @nodoc
class __$$_ReceiveStateCopyWithImpl<$Res>
    extends _$ReceiveStateCopyWithImpl<$Res>
    implements _$$_ReceiveStateCopyWith<$Res> {
  __$$_ReceiveStateCopyWithImpl(
      _$_ReceiveState _value, $Res Function(_$_ReceiveState) _then)
      : super(_value, (v) => _then(v as _$_ReceiveState));

  @override
  _$_ReceiveState get _value => super._value as _$_ReceiveState;

  @override
  $Res call({
    Object? loadingAddress = freezed,
    Object? errLoadingAddress = freezed,
    Object? address = freezed,
    Object? index = freezed,
  }) {
    return _then(_$_ReceiveState(
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
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ReceiveState with DiagnosticableTreeMixin implements _ReceiveState {
  const _$_ReceiveState(
      {this.loadingAddress = true,
      this.errLoadingAddress = '',
      this.address = '',
      this.index = 0});

  @override
  @JsonKey()
  final bool loadingAddress;
  @override
  @JsonKey()
  final String errLoadingAddress;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceiveState(loadingAddress: $loadingAddress, errLoadingAddress: $errLoadingAddress, address: $address, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReceiveState'))
      ..add(DiagnosticsProperty('loadingAddress', loadingAddress))
      ..add(DiagnosticsProperty('errLoadingAddress', errLoadingAddress))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiveState &&
            const DeepCollectionEquality()
                .equals(other.loadingAddress, loadingAddress) &&
            const DeepCollectionEquality()
                .equals(other.errLoadingAddress, errLoadingAddress) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingAddress),
      const DeepCollectionEquality().hash(errLoadingAddress),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$_ReceiveStateCopyWith<_$_ReceiveState> get copyWith =>
      __$$_ReceiveStateCopyWithImpl<_$_ReceiveState>(this, _$identity);
}

abstract class _ReceiveState implements ReceiveState {
  const factory _ReceiveState(
      {final bool loadingAddress,
      final String errLoadingAddress,
      final String address,
      final int index}) = _$_ReceiveState;

  @override
  bool get loadingAddress => throw _privateConstructorUsedError;
  @override
  String get errLoadingAddress => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  int get index => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiveStateCopyWith<_$_ReceiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
