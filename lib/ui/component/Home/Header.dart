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
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Spacer(),
                  LogButton(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.lightbulb_outline_sharp,
                        size: 32,
                        color: c.colours.primary,
                        semanticLabel: 'Logs',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              if (torState.isRunning)
                Tooltip(
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  message: 'Torified.',
                  textStyle: context.fonts.caption!.copyWith(
                    color: context.colours.primary,
                  ),
                  decoration: BoxDecoration(
                    color: context.colours.surface,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    Icons.security_sharp,
                    color: c.colours.tertiaryContainer,
                  ),
                )
              else ...[
                Icon(
                  Icons.security_sharp,
                  color: c.colours.error,
                ),
                const SizedBox(
                  height: 6,
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
