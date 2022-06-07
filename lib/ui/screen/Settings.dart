import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Settings/BitcoinUnit.dart';
import 'package:sats/ui/component/Settings/Incognito.dart';
import 'package:sats/ui/component/Settings/SelectNetwork.dart';
import 'package:sats/ui/component/Settings/SelectNode.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
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
                cornerTitle: 'SETTINGS',
                children: [
                  SizedBox(height: 21),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const SelectNode(),
              const SizedBox(height: 8),
              const SelectNetwork(),
              const SizedBox(height: 8),
              const SetBitcoinUnit(),
              const SizedBox(height: 8),
              const SetIncognito(),
              const SizedBox(height: 8),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: c.colours.primary,
                    onPrimary: c.colours.background,
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
