import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class CornerTitle extends StatelessWidget {
  const CornerTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext c) {
    return Text(
      text,
      textAlign: TextAlign.end,
      style: c.fonts.titleLarge!.copyWith(
        color: c.colours.onPrimary,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
