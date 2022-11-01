import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/pkg/extensions.dart';

class TorSettings extends StatelessWidget {
  const TorSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return ElevatedButton(
      onPressed: () {
        c.push('/tor-config');
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: c.colours.surface,
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
                  style: c.fonts.button!.copyWith(
                    color: c.colours.onPrimary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Customize Tor Settings.',
                  maxLines: 3,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icon/bitcoin_icons/png/outline/proxy.png',
              width: 52,
              height: 52,
              color: c.colours.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
