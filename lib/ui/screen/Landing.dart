import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Landing/Loader.dart';
import 'package:sats/ui/component/Landing/Logo.dart';
import 'package:sats/ui/component/Landing/Start.dart';

class _Landing extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocBuilder<TorCubit, TorState>(
      // listener: (context, state) {
      // if (state.isRunning && masterKey != null) {
      //   c.pop();
      //   c.push('/home');
      // }
      // if (state.isRunning && masterKey == null) {
      //   c.pop();
      //   c.push('/add-wallet');
      // }
      // },
      builder: (context, torState) {
        return Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              edgeOffset: 10.0,
              displacement: 10.0,
              onRefresh: () async {
                c.read<TorCubit>().start();
                c.read<TorCubit>().checkStatus();
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    pinned: true,
                    expandedHeight: c.height / 6,
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
                          const LandingLoader(),
                          const SizedBox(height: 12),
                          const LandingLogo(),
                          if (torState.isRunning) Container(),
                          if (torState.errConnection != '')
                            Text(
                              torState.errConnection,
                              style: c.fonts.caption!.copyWith(
                                color: c.colours.error,
                                // fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )

                          // const Start(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const Start(),
        );
      },
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Landing();
  }
}
