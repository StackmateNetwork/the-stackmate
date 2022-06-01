import 'package:flutter/material.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Settings/BitcoinUnit.dart';
import 'package:sats/ui/component/Settings/Incognito.dart';
import 'package:sats/ui/component/Settings/SelectNetwork.dart';
import 'package:sats/ui/component/Settings/SelectNode.dart';
import 'package:sats/ui/component/common/header.dart';
import 'package:sats/ui/component/Common/BackButton.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
            ],
          ),
        ),
      ),
    );
  }
}
