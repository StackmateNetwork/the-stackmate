import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Wallet/BackupOps.dart';
import 'package:sats/ui/component/Wallet/KeyInfo.dart';

class WalletInfo extends StatelessWidget {
  const WalletInfo({super.key});

  @override
  Widget build(BuildContext c) {
    return FadeIn(
      delay: const Duration(milliseconds: 300),
      child: DefaultTabController(
        length: 2, // length of tabs
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxWidth: c.width,
                maxHeight: 64,
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: c.colours.background,
                bottom: TabBar(
                  indicatorColor: c.colours.primary,
                  tabs: [
                    Tab(
                      child: Text(
                        'INFO',
                        style: c.fonts.titleLarge!.copyWith(
                          color: c.colours.onBackground,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'BACKUP',
                        style: c.fonts.titleLarge!.copyWith(
                          color: c.colours.onBackground,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                title: const Text(''),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: c.width,
                maxHeight: c.height / 1.2,
              ),
              child: const TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        KeyInfo(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        BackupOps(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
