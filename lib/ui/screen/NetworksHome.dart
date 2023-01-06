import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Home/Loader.dart';
import 'package:sats/ui/component/Home/TorHeader.dart';
import 'package:sats/ui/component/Network/Networks.dart';

class _NetworkHome extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    c.read<NetworksCubit>().load();

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 10.0,
          onRefresh: () async {
            c.read<WalletsCubit>().refresh();
            // c.read<TorCubit>().testConnection();
            c.read<NetworksCubit>().load();
            // if (c.select((TorCubit t) => t.state).isRunning
            return;
          },
          child: BlocBuilder<TorCubit, TorState>(
            builder: (context, torState) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    pinned: true,
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
                          TorHeader(),
                          Text(
                            'CYPHERPOST',
                            style: c.fonts.caption!.copyWith(
                              color: c.colours.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'cypherpost is F.O.S.S.\nFor end-to-end encrypted social networking.',
                            style: c.fonts.caption!.copyWith(
                              color: c.colours.onPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                              left: 12,
                              right: 12,
                            ),
                            child: IconButton(
                              onPressed: () {
                                c.push('/network-join');
                              },
                              tooltip: 'Click to join network',
                              icon: Icon(
                                Icons.add_circle,
                                size: 42,
                                color: c.colours.primary,
                              ),
                            ),
                          ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // if (torState.isConnected) ...[
                              Networks(),
                              // ] else ...[
                              // Container()
                              // ]
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
  }
}

class NetworkHomeScreen extends StatelessWidget {
  const NetworkHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _NetworkHome();
  }
}
