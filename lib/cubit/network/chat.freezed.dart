// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  NetworkIdentity get network => throw _privateConstructorUsedError;
  String get counterParty => throw _privateConstructorUsedError;
  List<CompletePost> get chatHistory => throw _privateConstructorUsedError;
  String get loading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  int get lastIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {NetworkIdentity network,
      String counterParty,
      List<CompletePost> chatHistory,
      String loading,
      String error,
      int lastIndex});

  $NetworkIdentityCopyWith<$Res> get network;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? network = freezed,
    Object? counterParty = freezed,
    Object? chatHistory = freezed,
    Object? loading = freezed,
    Object? error = freezed,
    Object? lastIndex = freezed,
  }) {
    return _then(_value.copyWith(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      chatHistory: chatHistory == freezed
          ? _value.chatHistory
          : chatHistory // ignore: cast_nullable_to_non_nullable
              as List<CompletePost>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      lastIndex: lastIndex == freezed
          ? _value.lastIndex
          : lastIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
          _$_ChatState value, $Res Function(_$_ChatState) then) =
      __$$_ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NetworkIdentity network,
      String counterParty,
      List<CompletePost> chatHistory,
      String loading,
      String error,
      int lastIndex});

  @override
  $NetworkIdentityCopyWith<$Res> get network;
}

/// @nodoc
class __$$_ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, (v) => _then(v as _$_ChatState));

  @override
  _$_ChatState get _value => super._value as _$_ChatState;

  @override
  $Res call({
    Object? network = freezed,
    Object? counterParty = freezed,
    Object? chatHistory = freezed,
    Object? loading = freezed,
    Object? error = freezed,
    Object? lastIndex = freezed,
  }) {
    return _then(_$_ChatState(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIdentity,
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      chatHistory: chatHistory == freezed
          ? _value._chatHistory
          : chatHistory // ignore: cast_nullable_to_non_nullable
              as List<CompletePost>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      lastIndex: lastIndex == freezed
          ? _value.lastIndex
          : lastIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChatState extends _ChatState with DiagnosticableTreeMixin {
  const _$_ChatState(
      {required this.network,
      required this.counterParty,
      final List<CompletePost> chatHistory = const [],
      this.loading = '',
      this.error = '',
      this.lastIndex = 0})
      : _chatHistory = chatHistory,
        super._();

  @override
  final NetworkIdentity network;
  @override
  final String counterParty;
  final List<CompletePost> _chatHistory;
  @override
  @JsonKey()
  List<CompletePost> get chatHistory {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatHistory);
  }

  @override
  @JsonKey()
  final String loading;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final int lastIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState(network: $network, counterParty: $counterParty, chatHistory: $chatHistory, loading: $loading, error: $error, lastIndex: $lastIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState'))
      ..add(DiagnosticsProperty('network', network))
      ..add(DiagnosticsProperty('counterParty', counterParty))
      ..add(DiagnosticsProperty('chatHistory', chatHistory))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('lastIndex', lastIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality()
                .equals(other.counterParty, counterParty) &&
            const DeepCollectionEquality()
                .equals(other._chatHistory, _chatHistory) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.lastIndex, lastIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(counterParty),
      const DeepCollectionEquality().hash(_chatHistory),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(lastIndex));

  @JsonKey(ignore: true)
  @override
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);
}

abstract class _ChatState extends ChatState {
  const factory _ChatState(
      {required final NetworkIdentity network,
      required final String counterParty,
      final List<CompletePost> chatHistory,
      final String loading,
      final String error,
      final int lastIndex}) = _$_ChatState;
  const _ChatState._() : super._();

  @override
  NetworkIdentity get network => throw _privateConstructorUsedError;
  @override
  String get counterParty => throw _privateConstructorUsedError;
  @override
  List<CompletePost> get chatHistory => throw _privateConstructorUsedError;
  @override
  String get loading => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  int get lastIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
