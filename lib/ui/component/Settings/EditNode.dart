import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/pkg/extensions.dart';

class EditNode extends StatefulWidget {
  const EditNode({super.key});

  @override
  State<EditNode> createState() => _EditNodeState();
}

class _EditNodeState extends State<EditNode> {
  final _address = TextEditingController();
  final _name = TextEditingController();

  @override
  void dispose() {
    _address.dispose();
    _name.dispose();
    super.dispose();
  }

  void _checkFields(NodeAddressState state) {
    if (_address.text != state.address) _address.text = state.address;
    if (_name.text != state.name) _name.text = state.name;
  }

  @override
  Widget build(BuildContext c) {
    final nodeState = c.select((NodeAddressCubit nac) => nac.state);
    _checkFields(nodeState);

    return Container(
      color: c.colours.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Change Electrum Node'.toUpperCase(),
            style: c.fonts.labelLarge!.copyWith(
              color: c.colours.onSurface,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Provide Full Address (ssl://HOST:PORT) and give it a name.',
            maxLines: 3,
            style: c.fonts.bodySmall!.copyWith(
              color: c.colours.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            controller: _address,
            autocorrect: false,
            keyboardType: TextInputType.url,
            style: TextStyle(color: c.colours.onSurface),
            decoration: InputDecoration(
              hintText: 'Enter Full Address'.toUpperCase(),
              errorText: nodeState.errNodeState.nullIfEmpty(),
              errorMaxLines: 3,
            ),
            onChanged: (t) {
              c.read<NodeAddressCubit>().addressChanged(t);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _name,
            autocorrect: false,
            style: TextStyle(color: c.colours.onSurface),
            decoration: InputDecoration(
              hintText: 'Name Your Node'.toUpperCase(),
            ),
            onChanged: (t) {
              c.read<NodeAddressCubit>().nameChanged(t);
            },
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () {
              c.read<NodeAddressCubit>().saveClicked();
            },
            child: const Text('SAVE'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              c.read<NodeAddressCubit>().cancelEditing();
            },
            child: const Text('CANCEL'),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () async {
              final node = c.read<NodeAddressCubit>();
              await node.revertToDefault();
              node.toggleIsEditting();
            },
            child: Text(
              'RESET TO DEFAULT',
              style: c.fonts.labelLarge!.copyWith(color: c.colours.error),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    ).animate(delay: 200.ms).fadeIn();
  }
}
