// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address-book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressBookUser _$AddressBookUserFromJson(Map<String, dynamic> json) {
  return _AddressBookUser.fromJson(json);
}

/// @nodoc
class _$AddressBookUserTearOff {
  const _$AddressBookUserTearOff();

  _AddressBookUser call(
      {@HiveField(2) int? id,
      @HiveField(0) required String name,
      @HiveField(1) List<AddressBookKey>? keys}) {
    return _AddressBookUser(
      id: id,
      name: name,
      keys: keys,
    );
  }

  AddressBookUser fromJson(Map<String, Object> json) {
    return AddressBookUser.fromJson(json);
  }
}

/// @nodoc
const $AddressBookUser = _$AddressBookUserTearOff();

/// @nodoc
mixin _$AddressBookUser {
  @HiveField(2)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  List<AddressBookKey>? get keys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressBookUserCopyWith<AddressBookUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressBookUserCopyWith<$Res> {
  factory $AddressBookUserCopyWith(
          AddressBookUser value, $Res Function(AddressBookUser) then) =
      _$AddressBookUserCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(2) int? id,
      @HiveField(0) String name,
      @HiveField(1) List<AddressBookKey>? keys});
}

/// @nodoc
class _$AddressBookUserCopyWithImpl<$Res>
    implements $AddressBookUserCopyWith<$Res> {
  _$AddressBookUserCopyWithImpl(this._value, this._then);

  final AddressBookUser _value;
  // ignore: unused_field
  final $Res Function(AddressBookUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? keys = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      keys: keys == freezed
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<AddressBookKey>?,
    ));
  }
}

/// @nodoc
abstract class _$AddressBookUserCopyWith<$Res>
    implements $AddressBookUserCopyWith<$Res> {
  factory _$AddressBookUserCopyWith(
          _AddressBookUser value, $Res Function(_AddressBookUser) then) =
      __$AddressBookUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(2) int? id,
      @HiveField(0) String name,
      @HiveField(1) List<AddressBookKey>? keys});
}

/// @nodoc
class __$AddressBookUserCopyWithImpl<$Res>
    extends _$AddressBookUserCopyWithImpl<$Res>
    implements _$AddressBookUserCopyWith<$Res> {
  __$AddressBookUserCopyWithImpl(
      _AddressBookUser _value, $Res Function(_AddressBookUser) _then)
      : super(_value, (v) => _then(v as _AddressBookUser));

  @override
  _AddressBookUser get _value => super._value as _AddressBookUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? keys = freezed,
  }) {
    return _then(_AddressBookUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      keys: keys == freezed
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<AddressBookKey>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 6, adapterName: 'AddressBookUserClassAdapter')
class _$_AddressBookUser implements _AddressBookUser {
  const _$_AddressBookUser(
      {@HiveField(2) this.id,
      @HiveField(0) required this.name,
      @HiveField(1) this.keys});

  factory _$_AddressBookUser.fromJson(Map<String, dynamic> json) =>
      _$$_AddressBookUserFromJson(json);

  @override
  @HiveField(2)
  final int? id;
  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final List<AddressBookKey>? keys;

  @override
  String toString() {
    return 'AddressBookUser(id: $id, name: $name, keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddressBookUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.keys, keys) ||
                const DeepCollectionEquality().equals(other.keys, keys)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(keys);

  @JsonKey(ignore: true)
  @override
  _$AddressBookUserCopyWith<_AddressBookUser> get copyWith =>
      __$AddressBookUserCopyWithImpl<_AddressBookUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressBookUserToJson(this);
  }
}

abstract class _AddressBookUser implements AddressBookUser {
  const factory _AddressBookUser(
      {@HiveField(2) int? id,
      @HiveField(0) required String name,
      @HiveField(1) List<AddressBookKey>? keys}) = _$_AddressBookUser;

  factory _AddressBookUser.fromJson(Map<String, dynamic> json) =
      _$_AddressBookUser.fromJson;

  @override
  @HiveField(2)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<AddressBookKey>? get keys => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressBookUserCopyWith<_AddressBookUser> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressBookKey _$AddressBookKeyFromJson(Map<String, dynamic> json) {
  return _AddressBookKey.fromJson(json);
}

/// @nodoc
class _$AddressBookKeyTearOff {
  const _$AddressBookKeyTearOff();

  _AddressBookKey call(
      {@HiveField(0) required String name,
      @HiveField(1) required String publicKey,
      @HiveField(2) required int createdAt,
      @HiveField(3) required String path,
      @HiveField(4) required String fingerprint,
      @HiveField(5) String? rescueDate}) {
    return _AddressBookKey(
      name: name,
      publicKey: publicKey,
      createdAt: createdAt,
      path: path,
      fingerprint: fingerprint,
      rescueDate: rescueDate,
    );
  }

  AddressBookKey fromJson(Map<String, Object> json) {
    return AddressBookKey.fromJson(json);
  }
}

/// @nodoc
const $AddressBookKey = _$AddressBookKeyTearOff();

/// @nodoc
mixin _$AddressBookKey {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get publicKey => throw _privateConstructorUsedError;
  @HiveField(2)
  int get createdAt => throw _privateConstructorUsedError;
  @HiveField(3)
  String get path => throw _privateConstructorUsedError;
  @HiveField(4)
  String get fingerprint => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get rescueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressBookKeyCopyWith<AddressBookKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressBookKeyCopyWith<$Res> {
  factory $AddressBookKeyCopyWith(
          AddressBookKey value, $Res Function(AddressBookKey) then) =
      _$AddressBookKeyCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String publicKey,
      @HiveField(2) int createdAt,
      @HiveField(3) String path,
      @HiveField(4) String fingerprint,
      @HiveField(5) String? rescueDate});
}

/// @nodoc
class _$AddressBookKeyCopyWithImpl<$Res>
    implements $AddressBookKeyCopyWith<$Res> {
  _$AddressBookKeyCopyWithImpl(this._value, this._then);

  final AddressBookKey _value;
  // ignore: unused_field
  final $Res Function(AddressBookKey) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? publicKey = freezed,
    Object? createdAt = freezed,
    Object? path = freezed,
    Object? fingerprint = freezed,
    Object? rescueDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: publicKey == freezed
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      rescueDate: rescueDate == freezed
          ? _value.rescueDate
          : rescueDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddressBookKeyCopyWith<$Res>
    implements $AddressBookKeyCopyWith<$Res> {
  factory _$AddressBookKeyCopyWith(
          _AddressBookKey value, $Res Function(_AddressBookKey) then) =
      __$AddressBookKeyCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String publicKey,
      @HiveField(2) int createdAt,
      @HiveField(3) String path,
      @HiveField(4) String fingerprint,
      @HiveField(5) String? rescueDate});
}

/// @nodoc
class __$AddressBookKeyCopyWithImpl<$Res>
    extends _$AddressBookKeyCopyWithImpl<$Res>
    implements _$AddressBookKeyCopyWith<$Res> {
  __$AddressBookKeyCopyWithImpl(
      _AddressBookKey _value, $Res Function(_AddressBookKey) _then)
      : super(_value, (v) => _then(v as _AddressBookKey));

  @override
  _AddressBookKey get _value => super._value as _AddressBookKey;

  @override
  $Res call({
    Object? name = freezed,
    Object? publicKey = freezed,
    Object? createdAt = freezed,
    Object? path = freezed,
    Object? fingerprint = freezed,
    Object? rescueDate = freezed,
  }) {
    return _then(_AddressBookKey(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: publicKey == freezed
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      rescueDate: rescueDate == freezed
          ? _value.rescueDate
          : rescueDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 7, adapterName: 'AddressBookValueClassAdapter')
class _$_AddressBookKey implements _AddressBookKey {
  const _$_AddressBookKey(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.publicKey,
      @HiveField(2) required this.createdAt,
      @HiveField(3) required this.path,
      @HiveField(4) required this.fingerprint,
      @HiveField(5) this.rescueDate});

  factory _$_AddressBookKey.fromJson(Map<String, dynamic> json) =>
      _$$_AddressBookKeyFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String publicKey;
  @override
  @HiveField(2)
  final int createdAt;
  @override
  @HiveField(3)
  final String path;
  @override
  @HiveField(4)
  final String fingerprint;
  @override
  @HiveField(5)
  final String? rescueDate;

  @override
  String toString() {
    return 'AddressBookKey(name: $name, publicKey: $publicKey, createdAt: $createdAt, path: $path, fingerprint: $fingerprint, rescueDate: $rescueDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddressBookKey &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.fingerprint, fingerprint) ||
                const DeepCollectionEquality()
                    .equals(other.fingerprint, fingerprint)) &&
            (identical(other.rescueDate, rescueDate) ||
                const DeepCollectionEquality()
                    .equals(other.rescueDate, rescueDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(publicKey) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(fingerprint) ^
      const DeepCollectionEquality().hash(rescueDate);

  @JsonKey(ignore: true)
  @override
  _$AddressBookKeyCopyWith<_AddressBookKey> get copyWith =>
      __$AddressBookKeyCopyWithImpl<_AddressBookKey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressBookKeyToJson(this);
  }
}

abstract class _AddressBookKey implements AddressBookKey {
  const factory _AddressBookKey(
      {@HiveField(0) required String name,
      @HiveField(1) required String publicKey,
      @HiveField(2) required int createdAt,
      @HiveField(3) required String path,
      @HiveField(4) required String fingerprint,
      @HiveField(5) String? rescueDate}) = _$_AddressBookKey;

  factory _AddressBookKey.fromJson(Map<String, dynamic> json) =
      _$_AddressBookKey.fromJson;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get publicKey => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int get createdAt => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get path => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get fingerprint => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get rescueDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressBookKeyCopyWith<_AddressBookKey> get copyWith =>
      throw _privateConstructorUsedError;
}
