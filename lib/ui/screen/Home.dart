import 'package:flutter/material.dart';
import 'package:sats/api/interface/reddit.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/reddit.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/ui/component/Home/Accounts.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Home/Header.dart';
import 'package:sats/ui/component/Home/RedditFeed.dart';
import 'package:sats/ui/component/Home/ReorderCards.dart';

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final isRearranging = c.select(
      (WalletsCubit wc) => wc.state.isRearranging,
    );

    if (isRearranging) return const ReorderCards();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: true,
            expandedHeight: !isRearranging ? 350 : 80,
            automaticallyImplyLeading: false,
            backgroundColor: c.colours.background,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                // StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              // collapseMode: CollapseMode.parallax,
              background: Column(
                children: [
                  Header(),
                  Accounts(),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(c.width, 20),
              child: HomeActions(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [RedditFeed()],
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = context.select((LoggerCubit l) => l);

    final redditBloc = RedditCubit(
      locator<IRedditAPI>(),
      logger,
      locator<ILauncher>(),
    );

    return BlocProvider.value(
      value: redditBloc,
      child: _Home(),
    );
  }
}
