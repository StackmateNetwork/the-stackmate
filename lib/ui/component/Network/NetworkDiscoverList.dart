import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkDiscoverList extends StatelessWidget {
  const NetworkDiscoverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final TextEditingController textController =
        TextEditingController(text: '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          'Search '.toUpperCase(),
          style: c.fonts.overline!.copyWith(
            color: c.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: textController,
          style: TextStyle(color: c.colours.onBackground),
          decoration: InputDecoration(
            hintText: 'Message, username or pubkey '.toUpperCase(),
          ),
          onChanged: (t) {},
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: c.colours.primary,
            side: BorderSide(color: c.colours.onPrimary),
            onSurface: c.colours.background.withOpacity(0.38),
          ),
          onPressed: () {},
          child: const Text('SEARCH'),
        ),
      ],
    );
  }
}
