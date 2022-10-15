import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';

class TorHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tor = context.select((TorCubit t) => t.state);
    return GestureDetector(
      onTap: () {
        context.push('/tor-config');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (tor.isConnected)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Icon(
                Icons.security_sharp,
                color: context.colours.tertiaryContainer,
              ),
            )
          else ...[
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Icon(
                    Icons.security_sharp,
                    color: context.colours.error,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Not routed via Tor.\n',
                    textAlign: TextAlign.center,
                    style: context.fonts.caption!.copyWith(
                      color: context.colours.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
