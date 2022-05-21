import 'package:flutter/material.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Settings/BitcoinUnit.dart';
import 'package:sats/ui/component/Settings/Exchange.dart';
import 'package:sats/ui/component/Settings/FiatUnit.dart';
import 'package:sats/ui/component/Settings/Incognito.dart';
import 'package:sats/ui/component/Settings/SelectNetwork.dart';
import 'package:sats/ui/component/Settings/SelectNode.dart';
import 'package:sats/ui/component/common/header.dart';

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
            children: const [
              SizedBox(
                height: 12,
              ),
              Header(
                cornerTitle: 'SETTINGS',
                children: [
                  SizedBox(height: 21),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              SelectNode(),
              SizedBox(height: 8),
              SelectNetwork(),
              SizedBox(height: 8),
              SetBitcoinUnit(),
              SizedBox(height: 8),
              SetExchange(),
              SizedBox(height: 8),
              SetFiatUnit(),
              SizedBox(height: 8),
              SetIncognito(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeActions(),
    );
  }
}
