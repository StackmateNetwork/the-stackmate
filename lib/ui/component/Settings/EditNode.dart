import 'package:flutter/material.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/pkg/extensions.dart';

class EditNode extends StatefulWidget {
  const EditNode({super.key});

  @override
  _EditNodeState createState() => _EditNodeState();
}

class _EditNodeState extends State<EditNode> {
  late TextEditingController _address;
  late TextEditingController _name;

  @override
  void initState() {
    _address = TextEditingController();
    _name = TextEditingController();
    super.initState();
  }

  void _checkFields(NodeAddressState state) {
    if (_address.text != state.address) _address.text = state.address;
    if (_name.text != state.name) _name.text = state.name;
  }

  @override
  Widget build(BuildContext c) {
    final nodeState = c.select((NodeAddressCubit nac) => nac.state);
    _checkFields(nodeState);

    return GestureDetector(
      onTap: () {
        context.read<NodeAddressCubit>().toggleIsEditting();
      },
      child: Container(
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
              style: c.fonts.labelLarge!.copyWith(
                color: c.colours.onBackground,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Provide Full Address (URL:PORT) and give it a name.',
              maxLines: 3,
              style: c.fonts.bodySmall!.copyWith(
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
              controller: _name,
              autocorrect: false,
              style: TextStyle(color: context.colours.onBackground),
              decoration: InputDecoration(
                hintText: 'Name Your Node'.toUpperCase(),
              ),
              onChanged: (t) {
                context.read<NodeAddressCubit>().nameChanged(t);
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
                c.read<NodeAddressCubit>().revertToDefault();
                c.read<NodeAddressCubit>().saveClicked();
              },
              child: Text(
                'RESET TO DEFAULT',
                style: c.fonts.labelLarge!.copyWith(color: c.colours.error),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
