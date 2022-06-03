import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class IdentityKey extends StatelessWidget {
  const IdentityKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'SOCIAL IDENTITY PRIVATE KEY',
          style: context.fonts.bodyMedium!.copyWith(
            color: context.colours.onPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          '789A C1D8 7056 B82F 32CA 149A',
          style: context.fonts.headline4!.copyWith(
            color: context.colours.tertiary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          "This key's corresponding public key represents your social identity.\n\nIf you lose this key, you lose access to your account.\nWrite it down somewhere safe.",
          style: context.fonts.caption!.copyWith(
            color: context.colours.onPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
