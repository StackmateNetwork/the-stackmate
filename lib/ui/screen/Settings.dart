import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Settings/BitcoinUnit.dart';
import 'package:sats/ui/component/Settings/Incognito.dart';
import 'package:sats/ui/component/Settings/SelectNetwork.dart';
import 'package:sats/ui/component/Settings/SelectNode.dart';
import 'package:sats/ui/component/Settings/Tor.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Header(
                cornerTitle: 'Settings'.toUpperCase(),
                children: [
                  Back(
                    onPressed: () {
                      Navigator.of(c).pop();
                    },
                  ),
                ],
              ),
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
                    c.read<MasterKeyCubit>().init('keyroot' as StorageKeys);
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
