import 'package:flutter/material.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Loader.dart';
import 'package:sats/ui/component/Network/ChatList.dart';
import 'package:sats/ui/component/Network/ChatSearch.dart';
import 'package:sats/ui/component/Network/NetworkInfo.dart';
import 'package:sats/ui/component/Network/NetworkName.dart';
import 'package:sats/ui/component/Network/NetworkTools.dart';
import 'package:sats/ui/component/Network/OverviewLoader.dart';

class _NetworkOverview extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 10.0,
          onRefresh: () async {},
          child: BlocBuilder<OverviewCubit, OverviewState>(
            builder: (context, overviewState) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    pinned: true,
                    collapsedHeight: 164,
                    expandedHeight: 164,
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
                          const OverviewLoader(),
                          const HomeLoader(),
                          NetworkName(),
                          NetworkTools(),
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
                            children: [
                              if (overviewState.showInfo)
                                const NetworkInfo()
                              else ...[
                                const ChatSearch(),
                                ChatList(),
                              ]
                            ],
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
    );
  }
}

class NetworkOverviewScreen extends StatelessWidget {
  const NetworkOverviewScreen({Key? key, required this.overviewCubit})
      : super(key: key);

  final OverviewCubit overviewCubit;

  @override
  Widget build(BuildContext c) {
    return BlocProvider.value(
      value: overviewCubit,
      child: _NetworkOverview(),
    );
  }
}
