import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class BlockchainRow extends StatelessWidget {
  const BlockchainRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final blockchain = c.select((ChainSelectCubit b) => b.state.blockchain);
    return ElevatedButton(
      onPressed: () {
        if (blockchain == Blockchain.mainNet)
          c.read<ChainSelectCubit>().changeBlockchain(Blockchain.testNet);
        else
          c.read<ChainSelectCubit>().changeBlockchain(Blockchain.mainNet);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        primary: c.colours.surface,
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Network'.toUpperCase(),
                  style: c.fonts.button!.copyWith(
                    color: c.colours.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Only wallets from selected network will be displayed\n\nCurrent network:   ' +
                      blockchain.displayName.toUpperCase(),
                  maxLines: 3,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class NodeRow extends StatelessWidget {
  const NodeRow();

  @override
  Widget build(BuildContext c) {
    final isEditting = c.select((NodeAddressCubit nac) => nac.state.isEditing);
    final nodeString =
        c.select((NodeAddressCubit nac) => nac.state.mainString());

    if (isEditting) return const EditNode();
    return ElevatedButton(
      onPressed: () {
        c.read<NodeAddressCubit>().toggleIsEditting();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        primary: c.colours.surface,
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Electrum Node'.toUpperCase(),
                  style: c.fonts.button!.copyWith(
                    color: c.colours.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'All communication will be sent via selected node\n\nCurrent node:   ' +
                      nodeString,
                  maxLines: 3,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class EditNode extends StatefulWidget {
  const EditNode({Key? key}) : super(key: key);

  @override
  _EditNodeState createState() => _EditNodeState();
}

class _EditNodeState extends State<EditNode> {
  late TextEditingController _address;
  late TextEditingController _port;

  @override
  void initState() {
    _address = TextEditingController();
    _port = TextEditingController();
    super.initState();
  }

  void _checkFields(NodeAddressState state) {
    if (_address.text != state.address) _address.text = state.address;
    if (_port.text != state.port) _port.text = state.port;
  }

  @override
  Widget build(BuildContext c) {
    final nodeState = c.select((NodeAddressCubit nac) => nac.state);
    _checkFields(nodeState);

    return Container(
      color: c.colours.surface,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Change Electrum Node'.toUpperCase(),
            style: c.fonts.button!.copyWith(
              color: c.colours.onBackground,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'All communication will be sent via selected node',
            maxLines: 3,
            style: c.fonts.caption!.copyWith(
              color: c.colours.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          TextField(
            controller: _address,
            autocorrect: false,
            style: TextStyle(color: context.colours.onBackground),
            decoration: InputDecoration(
              hintText: 'Enter Full Address'.toUpperCase(),
            ),
            onChanged: (t) {
              context.read<NodeAddressCubit>().addressChanged(t);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _port,
            autocorrect: false,
            style: TextStyle(color: context.colours.onBackground),
            decoration: InputDecoration(
              hintText: 'Enter Port'.toUpperCase(),
            ),
            onChanged: (t) {
              context.read<NodeAddressCubit>().portChanged(t);
            },
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () {
              c.read<NodeAddressCubit>().saveClicked();
            },
            child: const Text('SAVE'),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              c.read<NodeAddressCubit>().toggleIsEditting();
            },
            child: Text(
              'CANCEL',
              style: c.fonts.button!.copyWith(color: c.colours.error),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(
                cornerTitle: 'STACKMATE',
                children: [
                  const SizedBox(height: 8),
                  const Back(),
                  const SizedBox(height: 60),
                  Text(
                    ' Settings'.toUpperCase(),
                    style: c.fonts.headline4!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
              const NodeRow(),
              const SizedBox(height: 16),
              const BlockchainRow(),
            ],
          ),
        ),
      ),
    );
  }
}
