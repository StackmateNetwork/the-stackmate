import 'package:flutter/material.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Home/Loader.dart';
import 'package:sats/ui/component/Home/TorHeader.dart';
import 'package:sats/ui/component/Network/DiscoverSearch.dart';
import 'package:sats/ui/component/Network/MembersList.dart';
import 'package:sats/ui/component/Network/NetworkName.dart';

class _Discover extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 10.0,
          onRefresh: () async {
            // c.read<WalletsCubit>().refresh();
            // for (final wallet in wallets) {
            //   c.read<WalletsCubit>().walletSelected(wallet);
            //   final selected = c.select((InfoCubit ic) => ic);
            //   selected.sqliteSyncHistory();
            // }
            await c.read<TorCubit>().testConnection();
            await c.read<FeesCubit>().update();
            return;
          },
          child: BlocBuilder<TorCubit, TorState>(
            builder: (context, torState) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    pinned: true,
                    expandedHeight: c.height / 3,
                    automaticallyImplyLeading: false,
                    backgroundColor: c.colours.background,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [
                        StretchMode.fadeTitle,
                      ],
                      background: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HomeLoader(),
                          TorHeader(),
                          NetworkName(),
                          const DiscoverSearch()
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [MembersList()],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: HomeActions(),
    );
  }
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Discover();
  }
}
