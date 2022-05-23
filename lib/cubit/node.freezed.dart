// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NodeAddressState {
  String get address => throw _privateConstructorUsedError;
  String get errNodeState => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NodeAddressStateCopyWith<NodeAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeAddressStateCopyWith<$Res> {
  factory $NodeAddressStateCopyWith(
          NodeAddressState value, $Res Function(NodeAddressState) then) =
      _$NodeAddressStateCopyWithImpl<$Res>;
  $Res call({String address, String errNodeState, String name, bool isEditing});
}

/// @nodoc
class _$NodeAddressStateCopyWithImpl<$Res>
    implements $NodeAddressStateCopyWith<$Res> {
  _$NodeAddressStateCopyWithImpl(this._value, this._then);

  final NodeAddressState _value;
  // ignore: unused_field
  final $Res Function(NodeAddressState) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? errNodeState = freezed,
    Object? name = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      errNodeState: errNodeState == freezed
          ? _value.errNodeState
          : errNodeState // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_NodeAddressStateCopyWith<$Res>
    implements $NodeAddressStateCopyWith<$Res> {
  factory _$$_NodeAddressStateCopyWith(
          _$_NodeAddressState value, $Res Function(_$_NodeAddressState) then) =
      __$$_NodeAddressStateCopyWithImpl<$Res>;
  @override
  $Res call({String address, String errNodeState, String name, bool isEditing});
}

/// @nodoc
class __$$_NodeAddressStateCopyWithImpl<$Res>
    extends _$NodeAddressStateCopyWithImpl<$Res>
    implements _$$_NodeAddressStateCopyWith<$Res> {
  __$$_NodeAddressStateCopyWithImpl(
      _$_NodeAddressState _value, $Res Function(_$_NodeAddressState) _then)
      : super(_value, (v) => _then(v as _$_NodeAddressState));

  @override
  _$_NodeAddressState get _value => super._value as _$_NodeAddressState;

  @override
  $Res call({
    Object? address = freezed,
    Object? errNodeState = freezed,
    Object? name = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_$_NodeAddressState(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      errNodeState: errNodeState == freezed
          ? _value.errNodeState
          : errNodeState // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NodeAddressState extends _NodeAddressState {
  const _$_NodeAddressState(
      {this.address = defaultNodeAddress,
      this.errNodeState = '',
      this.name = 'Blockstream',
      this.isEditing = false})
      : super._();

  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String errNodeState;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool isEditing;

  @override
  String toString() {
    return 'NodeAddressState(address: $address, errNodeState: $errNodeState, name: $name, isEditing: $isEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NodeAddressState &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.errNodeState, errNodeState) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(errNodeState),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isEditing));

  @JsonKey(ignore: true)
  @override
  _$$_NodeAddressStateCopyWith<_$_NodeAddressState> get copyWith =>
      __$$_NodeAddressStateCopyWithImpl<_$_NodeAddressState>(this, _$identity);
}

abstract class _NodeAddressState extends NodeAddressState {
  const factory _NodeAddressState(
      {final String address,
      final String errNodeState,
      final String name,
      final bool isEditing}) = _$_NodeAddressState;
  const _NodeAddressState._() : super._();

  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get errNodeState => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get isEditing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NodeAddressStateCopyWith<_$_NodeAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}
