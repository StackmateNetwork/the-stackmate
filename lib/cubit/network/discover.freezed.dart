// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discover.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscoverState {
  NetworkIdentity get network => throw _privateConstructorUsedError;
  List<MemberIdentity> get members => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverStateCopyWith<DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverStateCopyWith<$Res> {
  factory $DiscoverStateCopyWith(
          DiscoverState value, $Res Function(DiscoverState) then) =
      _$DiscoverStateCopyWithImpl<$Res>;
  $Res call(
      {NetworkIdentity network,
      List<MemberIdentity> members,
      String error,
      String loading});

  $NetworkIdentityCopyWith<$Res> get network;
}

/// @nodoc
class _$DiscoverStateCopyWithImpl<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  _$DiscoverStateCopyWithImpl(this._value, this._then);

  final DiscoverState _value;
  // ignore: unused_field
  final $Res Function(DiscoverState) _then;

  @override
  $Res call({
    Object? network = freezed,
    Object? members = freezed,
    Object? error = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberIdentity>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_DiscoverStateCopyWith<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  factory _$$_DiscoverStateCopyWith(
          _$_DiscoverState value, $Res Function(_$_DiscoverState) then) =
      __$$_DiscoverStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NetworkIdentity network,
      List<MemberIdentity> members,
      String error,
      String loading});

  @override
  $NetworkIdentityCopyWith<$Res> get network;
}

/// @nodoc
class __$$_DiscoverStateCopyWithImpl<$Res>
    extends _$DiscoverStateCopyWithImpl<$Res>
    implements _$$_DiscoverStateCopyWith<$Res> {
  __$$_DiscoverStateCopyWithImpl(
      _$_DiscoverState _value, $Res Function(_$_DiscoverState) _then)
      : super(_value, (v) => _then(v as _$_DiscoverState));

  @override
  _$_DiscoverState get _value => super._value as _$_DiscoverState;

  @override
  $Res call({
    Object? network = freezed,
    Object? members = freezed,
    Object? error = freezed,
    Object? loading = freezed,
  }) {
    return _then(_$_DiscoverState(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberIdentity>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DiscoverState extends _DiscoverState with DiagnosticableTreeMixin {
  const _$_DiscoverState(
      {required this.network,
      final List<MemberIdentity> members = const [],
      this.error = '',
      this.loading = ''})
      : _members = members,
        super._();

  @override
  final NetworkIdentity network;
  final List<MemberIdentity> _members;
  @override
  @JsonKey()
  List<MemberIdentity> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String loading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiscoverState(network: $network, members: $members, error: $error, loading: $loading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiscoverState'))
      ..add(DiagnosticsProperty('network', network))
      ..add(DiagnosticsProperty('members', members))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('loading', loading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscoverState &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$$_DiscoverStateCopyWith<_$_DiscoverState> get copyWith =>
      __$$_DiscoverStateCopyWithImpl<_$_DiscoverState>(this, _$identity);
}

abstract class _DiscoverState extends DiscoverState {
  const factory _DiscoverState(
      {required final NetworkIdentity network,
      final List<MemberIdentity> members,
      final String error,
      final String loading}) = _$_DiscoverState;
  const _DiscoverState._() : super._();

  @override
  NetworkIdentity get network => throw _privateConstructorUsedError;
  @override
  List<MemberIdentity> get members => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  String get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiscoverStateCopyWith<_$_DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}
