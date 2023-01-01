// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OverviewState {
  NetworkIdentity get network => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OverviewStateCopyWith<OverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewStateCopyWith<$Res> {
  factory $OverviewStateCopyWith(
          OverviewState value, $Res Function(OverviewState) then) =
      _$OverviewStateCopyWithImpl<$Res>;
  $Res call({NetworkIdentity network});

  $NetworkIdentityCopyWith<$Res> get network;
}

/// @nodoc
class _$OverviewStateCopyWithImpl<$Res>
    implements $OverviewStateCopyWith<$Res> {
  _$OverviewStateCopyWithImpl(this._value, this._then);

  final OverviewState _value;
  // ignore: unused_field
  final $Res Function(OverviewState) _then;

  @override
  $Res call({
    Object? network = freezed,
  }) {
    return _then(_value.copyWith(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
    ));
  }

  @override
  $NetworkIdentityCopyWith<$Res> get network {
    return $NetworkIdentityCopyWith<$Res>(_value.network, (value) {
      return _then(_value.copyWith(network: value));
    });
  }
}

/// @nodoc
abstract class _$$_OverviewStateCopyWith<$Res>
    implements $OverviewStateCopyWith<$Res> {
  factory _$$_OverviewStateCopyWith(
          _$_OverviewState value, $Res Function(_$_OverviewState) then) =
      __$$_OverviewStateCopyWithImpl<$Res>;
  @override
  $Res call({NetworkIdentity network});

  @override
  $NetworkIdentityCopyWith<$Res> get network;
}

/// @nodoc
class __$$_OverviewStateCopyWithImpl<$Res>
    extends _$OverviewStateCopyWithImpl<$Res>
    implements _$$_OverviewStateCopyWith<$Res> {
  __$$_OverviewStateCopyWithImpl(
      _$_OverviewState _value, $Res Function(_$_OverviewState) _then)
      : super(_value, (v) => _then(v as _$_OverviewState));

  @override
  _$_OverviewState get _value => super._value as _$_OverviewState;

  @override
  $Res call({
    Object? network = freezed,
  }) {
    return _then(_$_OverviewState(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
    ));
  }
}

/// @nodoc

class _$_OverviewState extends _OverviewState {
  const _$_OverviewState({required this.network}) : super._();

  @override
  final NetworkIdentity network;

  @override
  String toString() {
    return 'OverviewState(network: $network)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverviewState &&
            const DeepCollectionEquality().equals(other.network, network));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(network));

  @JsonKey(ignore: true)
  @override
  _$$_OverviewStateCopyWith<_$_OverviewState> get copyWith =>
      __$$_OverviewStateCopyWithImpl<_$_OverviewState>(this, _$identity);
}

abstract class _OverviewState extends OverviewState {
  const factory _OverviewState({required final NetworkIdentity network}) =
      _$_OverviewState;
  const _OverviewState._() : super._();

  @override
  NetworkIdentity get network => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OverviewStateCopyWith<_$_OverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
