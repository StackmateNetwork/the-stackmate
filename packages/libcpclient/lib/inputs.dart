// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef CreateSocialT = Pointer<Utf8> Function(
  Pointer<Utf8> master_root,
  Pointer<Utf8> account,
);

typedef ServerIdT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
);

typedef InviteT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
  Pointer<Utf8> invite_code,
);

typedef MembersT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
);

typedef JoinT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
  Pointer<Utf8> username,
  Pointer<Utf8> invite_code,
);

typedef LeaveT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
);

typedef SendPostT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
  Pointer<Utf8> index,
  Pointer<Utf8> to,
  Pointer<Utf8> kind,
  Pointer<Utf8> value,
);

typedef SendKeysT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
  Pointer<Utf8> index,
  Pointer<Utf8> post_id,
  Pointer<Utf8> recipients,
);

typedef OnePostT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
  Pointer<Utf8> post_id,
);

typedef AllPostsT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
  Pointer<Utf8> genesis_filter,
);

typedef IndexT = Pointer<Utf8> Function(
  Pointer<Utf8> hostname,
  Pointer<Utf8> socks5,
  Pointer<Utf8> social_root,
);
