import 'package:flutter/material.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Tor/Loader.dart';
import 'package:sats/ui/component/Tor/Manual.dart';

import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class TorConfigScreen extends StatelessWidget {
  const TorConfigScreen({Key? key}) : super(key: key);

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
            c.read<TorCubit>().testConnection();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const TorLoader(),
                const SizedBox(
                  height: 12,
                ),
                Header(
                  cornerTitle: 'TOR',
                  children: [
                    const SizedBox(width: 16),
                    Back(
                      onPressed: () {
                        Navigator.of(c).pop();
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                if (tor.isConnected)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Tooltip(
                      preferBelow: false,
                      triggerMode: TooltipTriggerMode.tap,
                      message: (tor.isRunning)
                          ? 'Torified Natively.'
                          : 'Torified via External.',
                      textStyle: c.fonts.caption!.copyWith(
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
                else ...[
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
                    style: c.fonts.caption!.copyWith(
                      color: c.colours.error,
                    ),
                  ),
                ],
                const SizedBox(
                  height: 28,
                ),
                const ManualTor(),
                const SizedBox(height: 8),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: c.colours.primary,
                      onPrimary: c.colours.background,
                    ),
                    onPressed: () {
                      c.read<TorCubit>().testConnection();
                      c.read<TorCubit>().updateConfig();
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
                        primary: c.colours.primary,
                        side: BorderSide(color: c.colours.onPrimary),
                        onSurface: c.colours.background.withOpacity(0.38),
                      ),
                      onPressed: () {
                        c.read<TorCubit>().start();
                      },
                      child: Text('RESTART TOR'.toUpperCase()),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
