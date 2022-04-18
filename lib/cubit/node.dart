import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/model/node.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'node.freezed.dart';

@freezed
class NodeAddressState with _$NodeAddressState {
  const factory NodeAddressState({
    @Default('ssl://electrum.blockstream.info') String address,
    @Default('60002') String port,
    @Default('') String errNodeState,
    @Default(false) bool isEditing,
  }) = _NodeAddressState;
  const NodeAddressState._();

  String getAddress() => address == '' ? 'default' : 'https://$address:$port';

  String mainString() =>
      address == '' ? 'ELECTRUM (Default)' : '$address:$port (Custom)';
}

class NodeAddressCubit extends Cubit<NodeAddressState> {
  NodeAddressCubit(
    this._storage,
  ) : super(const NodeAddressState()) {
    init();
  }

  final IStorage _storage;

  Future init() async {
    final node = _storage.getFirstItem<Node>(StoreKeys.Node.name);
    if (node.hasError) {
      if (node.error! == 'empty')
        emit(
          state.copyWith(
            address: 'ssl://electrum.blockstream.info',
            port: '60002',
          ),
        );
      else
        emit(state.copyWith(errNodeState: node.error.toString()));
    }

    emit(
      state.copyWith(
        address: node.result!.address,
        port: node.result!.port,
      ),
    );
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
    final node = Node(
      address: state.address,
      port: state.port,
    );

    final cleared = await _storage.clearAll<Node>(StoreKeys.Node.name);
    if (cleared.hasError) {
      emit(state.copyWith(errNodeState: cleared.error.toString()));
      return;
    }

    final saved = await _storage.saveItem<Node>(StoreKeys.Node.name, node);
    if (saved.hasError) {
      emit(state.copyWith(errNodeState: saved.error.toString()));
      return;
    }

    await Future.delayed(const Duration(milliseconds: 200));
    toggleIsEditting();
  }
}
