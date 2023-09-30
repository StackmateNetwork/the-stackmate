import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Settings/BitcoinUnit.dart';
import 'package:sats/ui/component/Settings/Incognito.dart';
import 'package:sats/ui/component/Settings/SelectNetwork.dart';
import 'package:sats/ui/component/Settings/SelectNode.dart';
import 'package:sats/ui/component/Settings/Tor.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 24,
              ),
              const SelectNode(),
              const SizedBox(height: 8),
              const SelectNetwork(),
              const SizedBox(height: 8),
              const SetBitcoinUnit(),
              const SizedBox(height: 8),
              const SetIncognito(),
              const SizedBox(height: 8),
              const TorSettings(),
              const SizedBox(height: 8),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: c.colours.background,
                    backgroundColor: c.colours.primary,
                  ),
                  onPressed: () {
                    c.read<MasterKeyCubit>().init();
                    c.read<WalletsCubit>().refresh();
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
