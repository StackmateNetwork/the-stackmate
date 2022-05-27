import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/model/node.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'node.freezed.dart';

const defaultNodeAddress = 'default';

@freezed
class NodeAddressState with _$NodeAddressState {
  const factory NodeAddressState({
    @Default(defaultNodeAddress) String address,
    @Default('') String errNodeState,
    @Default('Blockstream') String name,
    @Default(false) bool isEditing,
  }) = _NodeAddressState;
  const NodeAddressState._();

  String getAddress() => address;

  String mainString() => name.toUpperCase();
}

class NodeAddressCubit extends Cubit<NodeAddressState> {
  NodeAddressCubit(
    this._storage,
  ) : super(const NodeAddressState());

  final IStorage _storage;

  void init() async {
    final node = _storage.getFirstItem<Node>(StoreKeys.Node.name);
    if (node.hasError) {
      if (node.error! == 'empty')
        emit(
          state.copyWith(
            address: defaultNodeAddress,
          ),
        );
      else
        emit(state.copyWith(errNodeState: node.error.toString()));
    } else {
      emit(
        state.copyWith(
          address: node.result!.address,
          name: node.result!.name,
        ),
      );
    }
  }

  void toggleIsEditting() {
    emit(state.copyWith(isEditing: !state.isEditing));
  }

  void revertToDefault() {
    emit(
      state.copyWith(address: 'default', name: 'Blockstream'),
    );
  }

  void addressChanged(String text) {
    emit(state.copyWith(address: text));
  }

  void nameChanged(String text) {
    emit(state.copyWith(name: text));
  }

  void saveClicked() async {
    final node = Node(
      address: state.address,
      name: state.name,
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
    toggleIsEditting();
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
