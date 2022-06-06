// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TorState {
  int get socks5Port => throw _privateConstructorUsedError;
  int get httpProxy => throw _privateConstructorUsedError;
  String get bootstapProgress => throw _privateConstructorUsedError;
  bool get isRunning => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  String get controlKey => throw _privateConstructorUsedError;
  String get errConnection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TorStateCopyWith<TorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TorStateCopyWith<$Res> {
  factory $TorStateCopyWith(TorState value, $Res Function(TorState) then) =
      _$TorStateCopyWithImpl<$Res>;
  $Res call(
      {int socks5Port,
      int httpProxy,
      String bootstapProgress,
      bool isRunning,
      bool isConnected,
      String controlKey,
      String errConnection});
}

/// @nodoc
class _$TorStateCopyWithImpl<$Res> implements $TorStateCopyWith<$Res> {
  _$TorStateCopyWithImpl(this._value, this._then);

  final TorState _value;
  // ignore: unused_field
  final $Res Function(TorState) _then;

  @override
  $Res call({
    Object? socks5Port = freezed,
    Object? httpProxy = freezed,
    Object? bootstapProgress = freezed,
    Object? isRunning = freezed,
    Object? isConnected = freezed,
    Object? controlKey = freezed,
    Object? errConnection = freezed,
  }) {
    return _then(_value.copyWith(
      socks5Port: socks5Port == freezed
          ? _value.socks5Port
          : socks5Port // ignore: cast_nullable_to_non_nullable
              as int,
      httpProxy: httpProxy == freezed
          ? _value.httpProxy
          : httpProxy // ignore: cast_nullable_to_non_nullable
              as int,
      bootstapProgress: bootstapProgress == freezed
          ? _value.bootstapProgress
          : bootstapProgress // ignore: cast_nullable_to_non_nullable
              as String,
      isRunning: isRunning == freezed
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: isConnected == freezed
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      controlKey: controlKey == freezed
          ? _value.controlKey
          : controlKey // ignore: cast_nullable_to_non_nullable
              as String,
      errConnection: errConnection == freezed
          ? _value.errConnection
          : errConnection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TorStateCopyWith<$Res> implements $TorStateCopyWith<$Res> {
  factory _$$_TorStateCopyWith(
          _$_TorState value, $Res Function(_$_TorState) then) =
      __$$_TorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int socks5Port,
      int httpProxy,
      String bootstapProgress,
      bool isRunning,
      bool isConnected,
      String controlKey,
      String errConnection});
}

/// @nodoc
class __$$_TorStateCopyWithImpl<$Res> extends _$TorStateCopyWithImpl<$Res>
    implements _$$_TorStateCopyWith<$Res> {
  __$$_TorStateCopyWithImpl(
      _$_TorState _value, $Res Function(_$_TorState) _then)
      : super(_value, (v) => _then(v as _$_TorState));

  @override
  _$_TorState get _value => super._value as _$_TorState;

  @override
  $Res call({
    Object? socks5Port = freezed,
    Object? httpProxy = freezed,
    Object? bootstapProgress = freezed,
    Object? isRunning = freezed,
    Object? isConnected = freezed,
    Object? controlKey = freezed,
    Object? errConnection = freezed,
  }) {
    return _then(_$_TorState(
      socks5Port: socks5Port == freezed
          ? _value.socks5Port
          : socks5Port // ignore: cast_nullable_to_non_nullable
              as int,
      httpProxy: httpProxy == freezed
          ? _value.httpProxy
          : httpProxy // ignore: cast_nullable_to_non_nullable
              as int,
      bootstapProgress: bootstapProgress == freezed
          ? _value.bootstapProgress
          : bootstapProgress // ignore: cast_nullable_to_non_nullable
              as String,
      isRunning: isRunning == freezed
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: isConnected == freezed
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      controlKey: controlKey == freezed
          ? _value.controlKey
          : controlKey // ignore: cast_nullable_to_non_nullable
              as String,
      errConnection: errConnection == freezed
          ? _value.errConnection
          : errConnection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TorState extends _TorState with DiagnosticableTreeMixin {
  const _$_TorState(
      {this.socks5Port = 49050,
      this.httpProxy = 48950,
      this.bootstapProgress = 'Offline.',
      this.isRunning = false,
      this.isConnected = false,
      this.controlKey = 'control_key',
      this.errConnection = ''})
      : super._();

  @override
  @JsonKey()
  final int socks5Port;
  @override
  @JsonKey()
  final int httpProxy;
  @override
  @JsonKey()
  final String bootstapProgress;
  @override
  @JsonKey()
  final bool isRunning;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final String controlKey;
  @override
  @JsonKey()
  final String errConnection;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TorState(socks5Port: $socks5Port, httpProxy: $httpProxy, bootstapProgress: $bootstapProgress, isRunning: $isRunning, isConnected: $isConnected, controlKey: $controlKey, errConnection: $errConnection)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TorState'))
      ..add(DiagnosticsProperty('socks5Port', socks5Port))
      ..add(DiagnosticsProperty('httpProxy', httpProxy))
      ..add(DiagnosticsProperty('bootstapProgress', bootstapProgress))
      ..add(DiagnosticsProperty('isRunning', isRunning))
      ..add(DiagnosticsProperty('isConnected', isConnected))
      ..add(DiagnosticsProperty('controlKey', controlKey))
      ..add(DiagnosticsProperty('errConnection', errConnection));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TorState &&
            const DeepCollectionEquality()
                .equals(other.socks5Port, socks5Port) &&
            const DeepCollectionEquality().equals(other.httpProxy, httpProxy) &&
            const DeepCollectionEquality()
                .equals(other.bootstapProgress, bootstapProgress) &&
            const DeepCollectionEquality().equals(other.isRunning, isRunning) &&
            const DeepCollectionEquality()
                .equals(other.isConnected, isConnected) &&
            const DeepCollectionEquality()
                .equals(other.controlKey, controlKey) &&
            const DeepCollectionEquality()
                .equals(other.errConnection, errConnection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(socks5Port),
      const DeepCollectionEquality().hash(httpProxy),
      const DeepCollectionEquality().hash(bootstapProgress),
      const DeepCollectionEquality().hash(isRunning),
      const DeepCollectionEquality().hash(isConnected),
      const DeepCollectionEquality().hash(controlKey),
      const DeepCollectionEquality().hash(errConnection));

  @JsonKey(ignore: true)
  @override
  _$$_TorStateCopyWith<_$_TorState> get copyWith =>
      __$$_TorStateCopyWithImpl<_$_TorState>(this, _$identity);
}

abstract class _TorState extends TorState {
  const factory _TorState(
      {final int socks5Port,
      final int httpProxy,
      final String bootstapProgress,
      final bool isRunning,
      final bool isConnected,
      final String controlKey,
      final String errConnection}) = _$_TorState;
  const _TorState._() : super._();

  @override
  int get socks5Port => throw _privateConstructorUsedError;
  @override
  int get httpProxy => throw _privateConstructorUsedError;
  @override
  String get bootstapProgress => throw _privateConstructorUsedError;
  @override
  bool get isRunning => throw _privateConstructorUsedError;
  @override
  bool get isConnected => throw _privateConstructorUsedError;
  @override
  String get controlKey => throw _privateConstructorUsedError;
  @override
  String get errConnection => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TorStateCopyWith<_$_TorState> get copyWith =>
      throw _privateConstructorUsedError;
}
