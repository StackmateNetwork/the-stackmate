import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/libcp.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/model/network-members.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'discover.freezed.dart';

const couldNotSaveError = 'Could not save members';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    required NetworkIdentity network,
    @Default([]) List<MemberIdentity> members,
    @Default('') String error,
    @Default('') String loading,
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
      final storedMembers = _storage.getItem<NetworkMembers>(
        StoreKeys.Members.name,
        state.network.id!,
      );
      if (storedMembers.hasError) return;
      await Future.delayed(const Duration(milliseconds: 300));
      final members = storedMembers.result!;
      emit(
        state.copyWith(
          members: members.members,
          loading: '',
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'Discover.load', s);
    }
  }

  Future<void> fetchMembers() async {
    try {
      emit(
        state.copyWith(
          error: '',
          loading: 'fetching',
        ),
      );
      final socks5 = _torCubit.state.socks5Port;
      final socialRoot = _socialRoot.state.key!.xprv;

      final members = await compute(getMembers, {
        'hostname': 'https://' + state.network.hostname,
        'socks5': socks5.toString(),
        'socialRoot': socialRoot,
      });

      if (members.hasError) {
        emit(
          state.copyWith(
            error: members.error!,
            loading: '',
          ),
        );
        return;
      }

      final networkMembers = NetworkMembers(
        id: state.network.id!,
        members: members.result!,
      );
      await saveToStorage(networkMembers);
    } catch (e, s) {
      _logger.logException(e, 'Discover.load', s);
    }
  }

  Future<void> saveToStorage(NetworkMembers members) async {
    try {
      final status = await _storage.saveItemAt<NetworkMembers>(
        StoreKeys.Members.name,
        state.network.id!,
        members,
      );
      if (status.hasError) {
        emit(
          state.copyWith(
            error: couldNotSaveError,
            loading: '',
          ),
        );
        return;
      }
      await load();
    } catch (e, s) {
      _logger.logException(e, 'Discover.load', s);
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
