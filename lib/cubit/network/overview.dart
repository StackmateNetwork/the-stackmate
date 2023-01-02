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

part 'overview.freezed.dart';

@freezed
class OverviewState with _$OverviewState {
  const factory OverviewState({
    required NetworkIdentity network,
    String? pubkey,
  }) = _OverviewState;

  const OverviewState._();
}

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit(
    this._storage,
    this._logger,
    this._torCubit,
    this._socialRoot,
    NetworkIdentity network,
  ) : super(OverviewState(network: network)) {
    load();
  }

  final IStorage _storage;
  final Logger _logger;
  final TorCubit _torCubit;
  final SocialRootCubit _socialRoot;

  Future<void> load() async {
    try {
      // load from storage and update from network - all badges and posts
      emit(
        state.copyWith(
          pubkey: _socialRoot.state.key!.pubkey,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'NetworkOverview.load', s);
    }
  }
}

R<Invitation> getInvite(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().privUserInvite(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
    inviteCode: obj['inviteCode']!,
  );
  return resp;
}
