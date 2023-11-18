import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Accounts.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/Home/BackupWarning.dart';
import 'package:sats/ui/component/Home/Loader.dart';
import 'package:sats/ui/component/Home/Networth.dart';
import 'package:sats/ui/component/Home/Tools.dart';
import 'package:sats/ui/component/Home/TorHeader.dart';

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final masterKey = c.select((MasterKeyCubit mc) => mc.state.key);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 10.0,
          onRefresh: () async {
            // await c.read<TorCubit>().testConnection();
            await c.read<FeesCubit>().update();
            return;
          },
          child: BlocListener<TorCubit, TorState>(
            listenWhen: (previous, current) =>
                previous.isConnected != current.isConnected,
            listener: (context, torState) {
              if (!torState.isConnected) c.read<TorCubit>().start();
            },
            child: CustomScrollView(
              slivers: [
                if (masterKey != null)
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
                          TorHeader(),
                          const SizedBox(
                            height: 8,
                          ),
                          Networth(),
                          WalletTools(),
                        ],
                      ),
                    ),
                  )
                else
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
                          WalletTools(),
                        ],
                      ),
                    ),
                  ),
                if (masterKey != null)
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            bottom: 12,
                            left: 12,
                            right: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [BackupWarning(), Accounts()],
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            // bottom: 12,
                            left: 12,
                            right: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 24,
                                ),
                                child: Text(
                                  'Click on + icon to Create wallet',
                                  style: c.fonts.bodySmall!.copyWith(
                                    color: c.colours.onBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ).animate(delay: 200.ms).fadeIn(),
          ),
        ),
      ),
      bottomNavigationBar: HomeActions(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _Home();
  }
}
