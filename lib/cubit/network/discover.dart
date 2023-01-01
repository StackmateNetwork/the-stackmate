import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/libcp.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'discover.freezed.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    required NetworkIdentity network,
  }) = _DiscoverState;

  const DiscoverState._();
}

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit(
    this._storage,
    this._logger,
    this._torCubit,
    this._socialRoot,
    NetworkIdentity network,
  ) : super(DiscoverState(network: network)) {
    load();
  }

  final IStorage _storage;
  final Logger _logger;
  final TorCubit _torCubit;
  final SocialRootCubit _socialRoot;

  Future<void> load() async {
    try {
      // load from storage and update from network - all members
    } catch (e, s) {
      _logger.logException(e, 'Overview.load', s);
    }
  }
}

R<List<MemberIdentity>> getMembers(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().getMembers(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
  );
  return resp;
}
