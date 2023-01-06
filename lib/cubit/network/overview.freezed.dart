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
  bool get connectingSocket => throw _privateConstructorUsedError;
  bool get socketConnected => throw _privateConstructorUsedError;
  bool get showInfo => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get loading => throw _privateConstructorUsedError;
  String get displayedInviteSecret => throw _privateConstructorUsedError;
  int get latestGenesis => throw _privateConstructorUsedError;
  List<String> get corrupted => throw _privateConstructorUsedError;
  String get counterParty => throw _privateConstructorUsedError;
  List<Verified> get verifiedPosts => throw _privateConstructorUsedError;
  List<MemberIdentity> get members => throw _privateConstructorUsedError;
  String get streamNonce => throw _privateConstructorUsedError;
  String get streamPubkey => throw _privateConstructorUsedError;
  String get streamSignature => throw _privateConstructorUsedError;

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
      bool connectingSocket,
      bool socketConnected,
      bool showInfo,
      String error,
      String loading,
      String displayedInviteSecret,
      int latestGenesis,
      List<String> corrupted,
      String counterParty,
      List<Verified> verifiedPosts,
      List<MemberIdentity> members,
      String streamNonce,
      String streamPubkey,
      String streamSignature});

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
    Object? connectingSocket = freezed,
    Object? socketConnected = freezed,
    Object? showInfo = freezed,
    Object? error = freezed,
    Object? loading = freezed,
    Object? displayedInviteSecret = freezed,
    Object? latestGenesis = freezed,
    Object? corrupted = freezed,
    Object? counterParty = freezed,
    Object? verifiedPosts = freezed,
    Object? members = freezed,
    Object? streamNonce = freezed,
    Object? streamPubkey = freezed,
    Object? streamSignature = freezed,
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
      connectingSocket: connectingSocket == freezed
          ? _value.connectingSocket
          : connectingSocket // ignore: cast_nullable_to_non_nullable
              as bool,
      socketConnected: socketConnected == freezed
          ? _value.socketConnected
          : socketConnected // ignore: cast_nullable_to_non_nullable
              as bool,
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
      latestGenesis: latestGenesis == freezed
          ? _value.latestGenesis
          : latestGenesis // ignore: cast_nullable_to_non_nullable
              as int,
      corrupted: corrupted == freezed
          ? _value.corrupted
          : corrupted // ignore: cast_nullable_to_non_nullable
              as List<String>,
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPosts: verifiedPosts == freezed
          ? _value.verifiedPosts
          : verifiedPosts // ignore: cast_nullable_to_non_nullable
              as List<Verified>,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberIdentity>,
      streamNonce: streamNonce == freezed
          ? _value.streamNonce
          : streamNonce // ignore: cast_nullable_to_non_nullable
              as String,
      streamPubkey: streamPubkey == freezed
          ? _value.streamPubkey
          : streamPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      streamSignature: streamSignature == freezed
          ? _value.streamSignature
          : streamSignature // ignore: cast_nullable_to_non_nullable
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
      bool connectingSocket,
      bool socketConnected,
      bool showInfo,
      String error,
      String loading,
      String displayedInviteSecret,
      int latestGenesis,
      List<String> corrupted,
      String counterParty,
      List<Verified> verifiedPosts,
      List<MemberIdentity> members,
      String streamNonce,
      String streamPubkey,
      String streamSignature});

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
    Object? connectingSocket = freezed,
    Object? socketConnected = freezed,
    Object? showInfo = freezed,
    Object? error = freezed,
    Object? loading = freezed,
    Object? displayedInviteSecret = freezed,
    Object? latestGenesis = freezed,
    Object? corrupted = freezed,
    Object? counterParty = freezed,
    Object? verifiedPosts = freezed,
    Object? members = freezed,
    Object? streamNonce = freezed,
    Object? streamPubkey = freezed,
    Object? streamSignature = freezed,
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
      connectingSocket: connectingSocket == freezed
          ? _value.connectingSocket
          : connectingSocket // ignore: cast_nullable_to_non_nullable
              as bool,
      socketConnected: socketConnected == freezed
          ? _value.socketConnected
          : socketConnected // ignore: cast_nullable_to_non_nullable
              as bool,
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
      latestGenesis: latestGenesis == freezed
          ? _value.latestGenesis
          : latestGenesis // ignore: cast_nullable_to_non_nullable
              as int,
      corrupted: corrupted == freezed
          ? _value._corrupted
          : corrupted // ignore: cast_nullable_to_non_nullable
              as List<String>,
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPosts: verifiedPosts == freezed
          ? _value._verifiedPosts
          : verifiedPosts // ignore: cast_nullable_to_non_nullable
              as List<Verified>,
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberIdentity>,
      streamNonce: streamNonce == freezed
          ? _value.streamNonce
          : streamNonce // ignore: cast_nullable_to_non_nullable
              as String,
      streamPubkey: streamPubkey == freezed
          ? _value.streamPubkey
          : streamPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      streamSignature: streamSignature == freezed
          ? _value.streamSignature
          : streamSignature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OverviewState extends _OverviewState with DiagnosticableTreeMixin {
  const _$_OverviewState(
      {required this.network,
      this.pubkey,
      this.connectingSocket = false,
      this.socketConnected = false,
      this.showInfo = false,
      this.error = '',
      this.loading = '',
      this.displayedInviteSecret = '',
      this.latestGenesis = 0,
      final List<String> corrupted = const [],
      this.counterParty = '',
      final List<Verified> verifiedPosts = const [],
      final List<MemberIdentity> members = const [],
      this.streamNonce = '',
      this.streamPubkey = '',
      this.streamSignature = ''})
      : _corrupted = corrupted,
        _verifiedPosts = verifiedPosts,
        _members = members,
        super._();

  @override
  final NetworkIdentity network;
  @override
  final String? pubkey;
  @override
  @JsonKey()
  final bool connectingSocket;
  @override
  @JsonKey()
  final bool socketConnected;
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
  @JsonKey()
  final int latestGenesis;
  final List<String> _corrupted;
  @override
  @JsonKey()
  List<String> get corrupted {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_corrupted);
  }

  @override
  @JsonKey()
  final String counterParty;
  final List<Verified> _verifiedPosts;
  @override
  @JsonKey()
  List<Verified> get verifiedPosts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verifiedPosts);
  }

  final List<MemberIdentity> _members;
  @override
  @JsonKey()
  List<MemberIdentity> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey()
  final String streamNonce;
  @override
  @JsonKey()
  final String streamPubkey;
  @override
  @JsonKey()
  final String streamSignature;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OverviewState(network: $network, pubkey: $pubkey, connectingSocket: $connectingSocket, socketConnected: $socketConnected, showInfo: $showInfo, error: $error, loading: $loading, displayedInviteSecret: $displayedInviteSecret, latestGenesis: $latestGenesis, corrupted: $corrupted, counterParty: $counterParty, verifiedPosts: $verifiedPosts, members: $members, streamNonce: $streamNonce, streamPubkey: $streamPubkey, streamSignature: $streamSignature)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OverviewState'))
      ..add(DiagnosticsProperty('network', network))
      ..add(DiagnosticsProperty('pubkey', pubkey))
      ..add(DiagnosticsProperty('connectingSocket', connectingSocket))
      ..add(DiagnosticsProperty('socketConnected', socketConnected))
      ..add(DiagnosticsProperty('showInfo', showInfo))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('displayedInviteSecret', displayedInviteSecret))
      ..add(DiagnosticsProperty('latestGenesis', latestGenesis))
      ..add(DiagnosticsProperty('corrupted', corrupted))
      ..add(DiagnosticsProperty('counterParty', counterParty))
      ..add(DiagnosticsProperty('verifiedPosts', verifiedPosts))
      ..add(DiagnosticsProperty('members', members))
      ..add(DiagnosticsProperty('streamNonce', streamNonce))
      ..add(DiagnosticsProperty('streamPubkey', streamPubkey))
      ..add(DiagnosticsProperty('streamSignature', streamSignature));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverviewState &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality().equals(other.pubkey, pubkey) &&
            const DeepCollectionEquality()
                .equals(other.connectingSocket, connectingSocket) &&
            const DeepCollectionEquality()
                .equals(other.socketConnected, socketConnected) &&
            const DeepCollectionEquality().equals(other.showInfo, showInfo) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.displayedInviteSecret, displayedInviteSecret) &&
            const DeepCollectionEquality()
                .equals(other.latestGenesis, latestGenesis) &&
            const DeepCollectionEquality()
                .equals(other._corrupted, _corrupted) &&
            const DeepCollectionEquality()
                .equals(other.counterParty, counterParty) &&
            const DeepCollectionEquality()
                .equals(other._verifiedPosts, _verifiedPosts) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other.streamNonce, streamNonce) &&
            const DeepCollectionEquality()
                .equals(other.streamPubkey, streamPubkey) &&
            const DeepCollectionEquality()
                .equals(other.streamSignature, streamSignature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(pubkey),
      const DeepCollectionEquality().hash(connectingSocket),
      const DeepCollectionEquality().hash(socketConnected),
      const DeepCollectionEquality().hash(showInfo),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(displayedInviteSecret),
      const DeepCollectionEquality().hash(latestGenesis),
      const DeepCollectionEquality().hash(_corrupted),
      const DeepCollectionEquality().hash(counterParty),
      const DeepCollectionEquality().hash(_verifiedPosts),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(streamNonce),
      const DeepCollectionEquality().hash(streamPubkey),
      const DeepCollectionEquality().hash(streamSignature));

  @JsonKey(ignore: true)
  @override
  _$$_OverviewStateCopyWith<_$_OverviewState> get copyWith =>
      __$$_OverviewStateCopyWithImpl<_$_OverviewState>(this, _$identity);
}

abstract class _OverviewState extends OverviewState {
  const factory _OverviewState(
      {required final NetworkIdentity network,
      final String? pubkey,
      final bool connectingSocket,
      final bool socketConnected,
      final bool showInfo,
      final String error,
      final String loading,
      final String displayedInviteSecret,
      final int latestGenesis,
      final List<String> corrupted,
      final String counterParty,
      final List<Verified> verifiedPosts,
      final List<MemberIdentity> members,
      final String streamNonce,
      final String streamPubkey,
      final String streamSignature}) = _$_OverviewState;
  const _OverviewState._() : super._();

  @override
  NetworkIdentity get network => throw _privateConstructorUsedError;
  @override
  String? get pubkey => throw _privateConstructorUsedError;
  @override
  bool get connectingSocket => throw _privateConstructorUsedError;
  @override
  bool get socketConnected => throw _privateConstructorUsedError;
  @override
  bool get showInfo => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  String get loading => throw _privateConstructorUsedError;
  @override
  String get displayedInviteSecret => throw _privateConstructorUsedError;
  @override
  int get latestGenesis => throw _privateConstructorUsedError;
  @override
  List<String> get corrupted => throw _privateConstructorUsedError;
  @override
  String get counterParty => throw _privateConstructorUsedError;
  @override
  List<Verified> get verifiedPosts => throw _privateConstructorUsedError;
  @override
  List<MemberIdentity> get members => throw _privateConstructorUsedError;
  @override
  String get streamNonce => throw _privateConstructorUsedError;
  @override
  String get streamPubkey => throw _privateConstructorUsedError;
  @override
  String get streamSignature => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OverviewStateCopyWith<_$_OverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
