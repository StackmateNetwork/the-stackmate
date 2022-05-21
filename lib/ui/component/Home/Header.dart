import 'package:flutter/material.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/LogButton.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocBuilder<TorCubit, TorState>(
      builder: (context, torState) {
        return Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 24,
                  right: 32,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    LogButton(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.lightbulb_outline_sharp,
                          size: 32,
                          color: c.colours.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (torState.isRunning)
                Icon(
                  Icons.security_sharp,
                  color: c.colours.tertiaryContainer,
                )
              else ...[
                Icon(
                  Icons.security_sharp,
                  color: c.colours.error,
                ),
                SizedBox(
                  height: 2,
                ),
                const Text(
                  'Insecure Connection: Tor not connected.\n Wait a few moments or Refresh Page.',
                  textAlign: TextAlign.center,
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
