import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
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
            children: [
              Header(
                cornerTitle: 'STACKMATE',
                children: [
                  const SizedBox(height: 8),
                  const Back(),
                  const SizedBox(height: 60),
                  Text(
                    ' Settings'.toUpperCase(),
                    style: c.fonts.headline4!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
              const SelectNode(),
              const SizedBox(height: 16),
              const SelectNetwork(),
            ],
          ),
        ),
      ),
    );
  }
}
