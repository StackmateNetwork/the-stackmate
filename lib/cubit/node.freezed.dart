// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$NodeAddressStateCopyWithImpl<$Res, NodeAddressState>;
  @useResult
  $Res call({String address, String errNodeState, String name, bool isEditing});
}

/// @nodoc
class _$NodeAddressStateCopyWithImpl<$Res, $Val extends NodeAddressState>
    implements $NodeAddressStateCopyWith<$Res> {
  _$NodeAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? errNodeState = null,
    Object? name = null,
    Object? isEditing = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      errNodeState: null == errNodeState
          ? _value.errNodeState
          : errNodeState // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodeAddressStateImplCopyWith<$Res>
    implements $NodeAddressStateCopyWith<$Res> {
  factory _$$NodeAddressStateImplCopyWith(_$NodeAddressStateImpl value,
          $Res Function(_$NodeAddressStateImpl) then) =
      __$$NodeAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, String errNodeState, String name, bool isEditing});
}

/// @nodoc
class __$$NodeAddressStateImplCopyWithImpl<$Res>
    extends _$NodeAddressStateCopyWithImpl<$Res, _$NodeAddressStateImpl>
    implements _$$NodeAddressStateImplCopyWith<$Res> {
  __$$NodeAddressStateImplCopyWithImpl(_$NodeAddressStateImpl _value,
      $Res Function(_$NodeAddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? errNodeState = null,
    Object? name = null,
    Object? isEditing = null,
  }) {
    return _then(_$NodeAddressStateImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      errNodeState: null == errNodeState
          ? _value.errNodeState
          : errNodeState // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NodeAddressStateImpl extends _NodeAddressState {
  const _$NodeAddressStateImpl(
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
            other is _$NodeAddressStateImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.errNodeState, errNodeState) ||
                other.errNodeState == errNodeState) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, address, errNodeState, name, isEditing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeAddressStateImplCopyWith<_$NodeAddressStateImpl> get copyWith =>
      __$$NodeAddressStateImplCopyWithImpl<_$NodeAddressStateImpl>(
          this, _$identity);
}

abstract class _NodeAddressState extends NodeAddressState {
  const factory _NodeAddressState(
      {final String address,
      final String errNodeState,
      final String name,
      final bool isEditing}) = _$NodeAddressStateImpl;
  const _NodeAddressState._() : super._();

  @override
  String get address;
  @override
  String get errNodeState;
  @override
  String get name;
  @override
  bool get isEditing;
  @override
  @JsonKey(ignore: true)
  _$$NodeAddressStateImplCopyWith<_$NodeAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
