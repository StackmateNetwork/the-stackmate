import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/pkg/extensions.dart';

class TorSettings extends StatelessWidget {
  const TorSettings({super.key});

  @override
  Widget build(BuildContext c) {
    return ElevatedButton(
      onPressed: () {
        c.push('/tor-config');
      },
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: c.colours.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Container(
        height: 80,
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
                  'Tor'.toUpperCase(),
                  style: c.fonts.labelLarge!.copyWith(
                    color: c.colours.onPrimary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Customize Tor Settings.',
                  maxLines: 3,
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.security,
              size: 24,
              color: c.colours.tertiaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}
