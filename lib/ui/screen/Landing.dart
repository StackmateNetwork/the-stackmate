import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Landing/Loader.dart';

class _Landing extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocConsumer<TorCubit, TorState>(
      listener: (context, state) {
        if (state.isRunning) c.push('/home');
      },
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
                return;
              },
              child: CustomScrollView(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const LandingLoader(),
                          const SizedBox(height: 12),
                          Text(
                            torState.errConnection,
                            style: c.fonts.caption!.copyWith(
                              color: c.colours.onPrimary,
                              // fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
