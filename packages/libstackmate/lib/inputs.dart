// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef GenerateT = Pointer<Utf8> Function(
  Pointer<Utf8> network,
  Pointer<Utf8> length,
  Pointer<Utf8> passphrase,
);

typedef ImportT = Pointer<Utf8> Function(
  Pointer<Utf8> network,
  Pointer<Utf8> mnemonic,
  Pointer<Utf8> passphrase,
);

typedef DeriveT = Pointer<Utf8> Function(
  Pointer<Utf8> master_xprv,
  Pointer<Utf8> purpose,
  Pointer<Utf8> account,
);

typedef CompileT = Pointer<Utf8> Function(
  Pointer<Utf8> policy,
  Pointer<Utf8> script_type,
);

typedef SyncT = Pointer<Utf8> Function(
  Pointer<Utf8> descriptor,
  Pointer<Utf8> node_address,
  Pointer<Utf8> socks5,
);

typedef AddressT = Pointer<Utf8> Function(
  Pointer<Utf8> descriptor,
  Pointer<Utf8> index,
);

typedef BuildT = Pointer<Utf8> Function(
  Pointer<Utf8> descriptor,
  Pointer<Utf8> node_address,
  Pointer<Utf8> socks5,
  Pointer<Utf8> tx_outputs,
  Pointer<Utf8> fee_absolute,
  Pointer<Utf8> policyPath,
  Pointer<Utf8> sweep,
);

typedef DecodeT = Pointer<Utf8> Function(
  Pointer<Utf8> network,
  Pointer<Utf8> psbt,
);

typedef SignT = Pointer<Utf8> Function(
  Pointer<Utf8> descriptor,
  Pointer<Utf8> unsigned_psbt,
);

typedef BroadcastT = Pointer<Utf8> Function(
  Pointer<Utf8> descriptor,
  Pointer<Utf8> node_address,
  Pointer<Utf8> socks5,
  Pointer<Utf8> signed_psbt,
);
typedef BroadcastTHex = Pointer<Utf8> Function(
  Pointer<Utf8> descriptor,
  Pointer<Utf8> node_address,
  Pointer<Utf8> socks5,
  Pointer<Utf8> signed_tx_hex,
);

typedef EstimateFeeT = Pointer<Utf8> Function(
  Pointer<Utf8> network,
  Pointer<Utf8> node_address,
  Pointer<Utf8> socks5,
  Pointer<Utf8> conf_target,
);

typedef WeightT = Pointer<Utf8> Function(
  Pointer<Utf8> descriptor,
  Pointer<Utf8> psbt,
);

typedef AbsoluteFeeT = Pointer<Utf8> Function(
  Pointer<Utf8> fee_absolute,
  Pointer<Utf8> weight,
);

typedef FeeAbsoluteT = Pointer<Utf8> Function(
  Pointer<Utf8> fee_rate,
  Pointer<Utf8> weight,
);

typedef DaysT = Pointer<Utf8> Function(
  Pointer<Utf8> days,
);

typedef HeightT = Pointer<Utf8> Function(
  Pointer<Utf8> network,
  Pointer<Utf8> node_address,
  Pointer<Utf8> socks5,
);

typedef TorStartT = Pointer<Utf8> Function(
  Pointer<Utf8> data_dir,
  Pointer<Utf8> socks5_port,
  Pointer<Utf8> http_proxy,
);
typedef TorStatusT = Pointer<Utf8> Function(
  Pointer<Utf8> control_port,
  Pointer<Utf8> control_key,
);
typedef TorStopT = Pointer<Utf8> Function(
  Pointer<Utf8> control_port,
  Pointer<Utf8> control_key,
);
