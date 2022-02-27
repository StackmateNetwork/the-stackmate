import 'package:flutter/material.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/pkg/extensions.dart';

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
