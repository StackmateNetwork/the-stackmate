import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Tor/Loader.dart';
import 'package:sats/ui/component/Tor/Manual.dart';

class TorConfigScreen extends StatelessWidget {
  const TorConfigScreen({super.key});

  @override
  Widget build(BuildContext c) {
    final tor = c.select((TorCubit t) => t.state);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          edgeOffset: 10.0,
          displacement: 10.0,
          onRefresh: () async {
            c.read<TorCubit>().checkInternalStatus();
            // c.read<TorCubit>().testConnection();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const TorLoader(),
                AppBar(
                  title: const Text('Tor setting'),
                  leading: Builder(
                    builder: (BuildContext context) {
                      return BackButton(
                        onPressed: () {
                          context.pop();
                        },
                      );
                    },
                  ),
                ),
                if (tor.isConnected) ...[
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Tooltip(
                      preferBelow: false,
                      triggerMode: TooltipTriggerMode.tap,
                      message: (tor.isRunning)
                          ? 'Torified Natively.'
                          : 'Torified via External.',
                      textStyle: c.fonts.bodySmall!.copyWith(
                        color: c.colours.primary,
                      ),
                      decoration: BoxDecoration(
                        color: c.colours.surface,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Icon(
                        Icons.security_sharp,
                        color: c.colours.tertiaryContainer,
                      ),
                    ),
                  )
                ] else ...[
                  Icon(
                    Icons.security_sharp,
                    color: c.colours.error,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    (tor.errMessage != '')
                        ? tor.errMessage
                        : 'Not routed via Tor.',
                    textAlign: TextAlign.center,
                    style: c.fonts.bodySmall!.copyWith(
                      color: c.colours.error,
                    ),
                  ),
                ],
                const SizedBox(
                  height: 38,
                ),
                const ManualTor(),
                const SizedBox(height: 28),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: c.colours.background,
                      backgroundColor: c.colours.primary,
                    ),
                    onPressed: () {
                      // c.read<TorCubit>().testConnection();
                      c.read<TorCubit>().updateConfig();
                      Navigator.of(c).pop();
                    },
                    child: const Text('SAVE'),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (!tor.isConnected && tor.internal) ...[
                  SizedBox(
                    height: 52,
                    width: c.width,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: c.colours.primary,
                        side: BorderSide(color: c.colours.onPrimary),
                        disabledForegroundColor: c.colours.background
                            .withOpacity(0.38)
                            .withOpacity(0.38),
                      ),
                      onPressed: () {
                        c.read<TorCubit>().start();
                        Navigator.of(c).pop();
                      },
                      child: Text('RESTART TOR'.toUpperCase()),
                    ),
                  ),
                ],
              ],
            ),
          ).animate(delay: 200.ms).fadeIn(),
        ),
      ),
    );
  }
}
