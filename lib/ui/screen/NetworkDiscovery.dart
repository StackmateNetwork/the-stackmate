import 'package:flutter/material.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Home/Loader.dart';
import 'package:sats/ui/component/Network/DiscoverSearch.dart';
import 'package:sats/ui/component/Network/MembersList.dart';
import 'package:sats/ui/component/Network/NetworkName.dart';
import 'package:sats/ui/component/Network/NetworkTools.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _Discover extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 10.0,
          onRefresh: () async {
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
                    collapsedHeight: 256,
                    expandedHeight: 256,
                    automaticallyImplyLeading: false,
                    backgroundColor: c.colours.background,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [
                        StretchMode.fadeTitle,
                      ],
                      background: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const HomeLoader(),
                          const SizedBox(
                            height: 8,
                          ),
                          Header(
                            cornerTitle: 'Discover'.toUpperCase(),
                            children: [
                              Back(
                                onPressed: () {
                                  Navigator.of(c).pop();
                                },
                              ),
                            ],
                          ),
                          Icon(
                            Icons.travel_explore,
                            size: 32,
                            color: context.colours.primary,
                          ),
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

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Discover();
  }
}
