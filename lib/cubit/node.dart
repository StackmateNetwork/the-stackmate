import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/node.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'node.freezed.dart';

@freezed
class NodeAddressState with _$NodeAddressState {
  const factory NodeAddressState({
    @Default('') String address,
    @Default('') String port,
    @Default('') String errNodeState,
    @Default(false) bool isEditing,
  }) = _NodeAddressState;
  const NodeAddressState._();

  String getAddress() => address == '' ? 'default' : 'https://$address:$port';

  String mainString() => address == '' ? 'ELECTRUM (Default)' : '$address:$port (Custom)';
}

class NodeAddressCubit extends Cubit<NodeAddressState> {
  NodeAddressCubit(
    this._storage,
    this._logger,
  ) : super(const NodeAddressState()) {
    init();
  }

  final IStorage _storage;
  final Logger _logger;

  Future init() async {
    try {
      final node = _storage.getFirstItem<Node>(StoreKeys.Node.name);

      emit(
        state.copyWith(
          address: node.address,
          port: node.port,
        ),
      );
    } catch (e, s) {
      if (e.toString() == 'empty') {
        return;
      }
      emit(
        state.copyWith(
          errNodeState: e.toString(),
        ),
      );
      _logger.logException(e, 'NodeAddressCubit.init', s);
    }
  }

  void toggleIsEditting() async {
    await init();
    emit(state.copyWith(isEditing: !state.isEditing));
  }

  void addressChanged(String text) {
    emit(state.copyWith(address: text));
  }

  void portChanged(String text) {
    emit(state.copyWith(port: text));
  }

  void saveClicked() async {
    try {
      final node = Node(
        address: state.address,
        port: state.port,
      );

      await _storage.clearAll<Node>(StoreKeys.Node.name);
      await _storage.saveItem<Node>(StoreKeys.Node.name, node);
      await Future.delayed(const Duration(milliseconds: 200));
      toggleIsEditting();
    } catch (e, s) {
      emit(state.copyWith(errNodeState: e.toString()));
      _logger.logException(e, 'NodeAddressCubit.saveClicked', s);
    }
  }
}
