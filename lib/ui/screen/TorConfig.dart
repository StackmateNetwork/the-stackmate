import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Back(
                    onPressed: () {
                      Navigator.of(c).pop();
                    },
                  ),
                  const Spacer(),
                  const SizedBox(width: 8),
                ],
              ),
              const Header(
                cornerTitle: 'TOR',
                children: [
                  SizedBox(height: 21),
                ],
              ),
              if (tor.isConnected)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
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
                  'Lost connection to Tor.\nGoto settings to reconnect.',
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
                    c.read<TorCubit>().updateConfig();
                    Navigator.of(c).pop();
                  },
                  child: const Text('SAVE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
