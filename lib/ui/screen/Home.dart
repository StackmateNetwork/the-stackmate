import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Accounts.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Home/Header.dart';
import 'package:sats/ui/component/Home/Networth.dart';

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: true,
            expandedHeight: 272,
            automaticallyImplyLeading: false,
            backgroundColor: c.colours.background,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.fadeTitle,
              ],
              background: Column(
                children: [
                  Header(),
                  Networth(),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [Accounts()],
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomeActions(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Home();
  }
}
