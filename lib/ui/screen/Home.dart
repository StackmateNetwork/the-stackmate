import 'package:flutter/material.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Accounts.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Home/Header.dart';
import 'package:sats/ui/component/Home/Loader.dart';
import 'package:sats/ui/component/Home/Networth.dart';
import 'package:sats/ui/component/Home/Tools.dart';

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final torIsRunning = c.select((TorCubit t) => t.state.isRunning);

    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, prefState) {
        return Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              displacement: 10.0,
              onRefresh: () async {
                c.read<WalletsCubit>().refresh();
                c.read<TorCubit>().checkStatus();
                c.read<TorCubit>().start();
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
                              if (torState.isRunning) ...[
                                HomeHeader(),
                                Networth(),
                                WalletTools()
                              ] else
                                Container()
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                                left: 12,
                                right: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (torState.isRunning) ...[
                                    Accounts()
                                  ] else ...[
                                    Container()
                                  ]
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          bottomNavigationBar: HomeActions(),
        );
      },
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
