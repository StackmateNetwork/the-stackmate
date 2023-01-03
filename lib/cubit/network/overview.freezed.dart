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
  String? get pubkey => throw _privateConstructorUsedError;
  bool get showInfo => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get loading => throw _privateConstructorUsedError;
  String get displayedInviteSecret => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OverviewStateCopyWith<OverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewStateCopyWith<$Res> {
  factory $OverviewStateCopyWith(
          OverviewState value, $Res Function(OverviewState) then) =
      _$OverviewStateCopyWithImpl<$Res>;
  $Res call(
      {NetworkIdentity network,
      String? pubkey,
      bool showInfo,
      String error,
      String loading,
      String displayedInviteSecret});

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
    Object? pubkey = freezed,
    Object? showInfo = freezed,
    Object? error = freezed,
    Object? loading = freezed,
    Object? displayedInviteSecret = freezed,
  }) {
    return _then(_value.copyWith(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String?,
      showInfo: showInfo == freezed
          ? _value.showInfo
          : showInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String,
      displayedInviteSecret: displayedInviteSecret == freezed
          ? _value.displayedInviteSecret
          : displayedInviteSecret // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_OverviewStateCopyWith<$Res>
    implements $OverviewStateCopyWith<$Res> {
  factory _$$_OverviewStateCopyWith(
          _$_OverviewState value, $Res Function(_$_OverviewState) then) =
      __$$_OverviewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NetworkIdentity network,
      String? pubkey,
      bool showInfo,
      String error,
      String loading,
      String displayedInviteSecret});

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
    Object? pubkey = freezed,
    Object? showInfo = freezed,
    Object? error = freezed,
    Object? loading = freezed,
    Object? displayedInviteSecret = freezed,
  }) {
    return _then(_$_OverviewState(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String?,
      showInfo: showInfo == freezed
          ? _value.showInfo
          : showInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String,
      displayedInviteSecret: displayedInviteSecret == freezed
          ? _value.displayedInviteSecret
          : displayedInviteSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OverviewState extends _OverviewState with DiagnosticableTreeMixin {
  const _$_OverviewState(
      {required this.network,
      this.pubkey,
      this.showInfo = false,
      this.error = '',
      this.loading = '',
      this.displayedInviteSecret = ''})
      : super._();

  @override
  final NetworkIdentity network;
  @override
  final String? pubkey;
  @override
  @JsonKey()
  final bool showInfo;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String loading;
  @override
  @JsonKey()
  final String displayedInviteSecret;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OverviewState(network: $network, pubkey: $pubkey, showInfo: $showInfo, error: $error, loading: $loading, displayedInviteSecret: $displayedInviteSecret)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OverviewState'))
      ..add(DiagnosticsProperty('network', network))
      ..add(DiagnosticsProperty('pubkey', pubkey))
      ..add(DiagnosticsProperty('showInfo', showInfo))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(
          DiagnosticsProperty('displayedInviteSecret', displayedInviteSecret));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverviewState &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality().equals(other.pubkey, pubkey) &&
            const DeepCollectionEquality().equals(other.showInfo, showInfo) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.displayedInviteSecret, displayedInviteSecret));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(pubkey),
      const DeepCollectionEquality().hash(showInfo),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(displayedInviteSecret));

  @JsonKey(ignore: true)
  @override
  _$$_OverviewStateCopyWith<_$_OverviewState> get copyWith =>
      __$$_OverviewStateCopyWithImpl<_$_OverviewState>(this, _$identity);
}

abstract class _OverviewState extends OverviewState {
  const factory _OverviewState(
      {required final NetworkIdentity network,
      final String? pubkey,
      final bool showInfo,
      final String error,
      final String loading,
      final String displayedInviteSecret}) = _$_OverviewState;
  const _OverviewState._() : super._();

  @override
  NetworkIdentity get network => throw _privateConstructorUsedError;
  @override
  String? get pubkey => throw _privateConstructorUsedError;
  @override
  bool get showInfo => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  String get loading => throw _privateConstructorUsedError;
  @override
  String get displayedInviteSecret => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OverviewStateCopyWith<_$_OverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
