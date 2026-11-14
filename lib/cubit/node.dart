import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/node.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'node.freezed.dart';

const defaultNodeAddress = 'default';
const testnetBlockstream = 'ssl://electrum.blockstream.info:60002';
const mainnetBlockstream = 'ssl://electrum.blockstream.info:50002';

@freezed
abstract class NodeAddressState with _$NodeAddressState {
  const factory NodeAddressState({
    @Default(defaultNodeAddress) String address,
    @Default('') String errNodeState,
    @Default(NodeAddressCubit.defaultName) String name,
    @Default(false) bool isEditing,
  }) = _NodeAddressState;
  const NodeAddressState._();

  String getAddress() => address;

  String mainString() => name;
}

class NodeAddressCubit extends Cubit<NodeAddressState> {
  NodeAddressCubit(this._storage, this._network)
    : super(const NodeAddressState());

  final IStorage _storage;
  final ChainSelectCubit _network;

  static const defaultName = 'Blockstream';
  static const invalidAddressError =
      'Use the form ssl://host:port or tcp://host:port.';

  String get _defaultAddress => _network.state.blockchain == Blockchain.test
      ? testnetBlockstream
      : mainnetBlockstream;

  Future<void> init() async {
    final node = _storage.getFirstItem<Node>(StoreKeys.Node.name);
    if (node.hasError) {
      if (node.error! == 'empty') {
        emit(
          state.copyWith(
            address: _defaultAddress,
            name: defaultName,
            errNodeState: '',
          ),
        );
      } else {
        emit(state.copyWith(errNodeState: node.error.toString()));
      }
      return;
    }
    // The default node follows the selected network.
    final isDefault = node.result!.name == defaultName;
    emit(
      state.copyWith(
        address: isDefault ? _defaultAddress : node.result!.address,
        name: node.result!.name,
        errNodeState: '',
      ),
    );
  }

  void toggleIsEditting() {
    emit(state.copyWith(isEditing: !state.isEditing, errNodeState: ''));
  }

  /// Leaves the editor, discarding unsaved changes.
  Future<void> cancelEditing() async {
    await init();
    emit(state.copyWith(isEditing: false, errNodeState: ''));
  }

  Future<void> revertToDefault() async {
    emit(state.copyWith(address: _defaultAddress, name: defaultName));
    await _persist();
  }

  void addressChanged(String text) {
    emit(state.copyWith(address: text.trim(), errNodeState: ''));
  }

  void nameChanged(String text) {
    emit(state.copyWith(name: text, errNodeState: ''));
  }

  static bool isValidAddress(String address) =>
      RegExp(r'^(ssl|tcp)://[^\s/:]+:\d{1,5}$').hasMatch(address);

  Future<void> saveClicked() async {
    if (!isValidAddress(state.address)) {
      emit(state.copyWith(errNodeState: invalidAddressError));
      return;
    }
    if (state.name.trim().isEmpty) emit(state.copyWith(name: state.address));
    if (await _persist()) {
      emit(state.copyWith(isEditing: false));
    }
  }

  Future<bool> _persist() async {
    final node = Node(address: state.address, name: state.name.trim());

    final cleared = await _storage.clearAll<Node>(StoreKeys.Node.name);
    if (cleared.hasError) {
      emit(state.copyWith(errNodeState: cleared.error.toString()));
      return false;
    }

    final saved = await _storage.saveItem<Node>(StoreKeys.Node.name, node);
    if (saved.hasError) {
      emit(state.copyWith(errNodeState: saved.error.toString()));
      return false;
    }
    emit(state.copyWith(errNodeState: ''));
    return true;
  }
}
