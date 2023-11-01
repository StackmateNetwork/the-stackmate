import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext c) {
    return Column(
      children: [
        LinearProgressIndicator(
          backgroundColor: c.colours.background,
          valueColor: AlwaysStoppedAnimation<Color>(c.colours.primary),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: c.fonts.bodySmall!.copyWith(
            color: c.colours.onBackground,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
