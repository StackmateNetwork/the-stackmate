import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext c) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: c.fonts.headline4!.copyWith(
          color: c.colours.surface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
