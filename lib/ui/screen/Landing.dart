import 'package:flutter/material.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Landing/Loader.dart';
import 'package:sats/ui/component/Landing/Logo.dart';
import 'package:sats/ui/component/Landing/Pin.dart';
import 'package:sats/ui/component/Landing/Start.dart';

class _Landing extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final hasPin = c.select((PinCubit pc) => pc.state.pin);

    return BlocBuilder<PinCubit, PinState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                if (hasPin == null)
                  SliverAppBar(
                    stretch: true,
                    pinned: true,
                    expandedHeight: c.height / 1.2,
                    automaticallyImplyLeading: false,
                    backgroundColor: c.colours.background,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [
                        StretchMode.fadeTitle,
                      ],
                      background: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          LandingLoader(),
                          SizedBox(height: 48),
                          LandingLogo(),
                          PIN(),
                        ],
                      ),
                    ),
                  )
                else
                  SliverAppBar(
                    stretch: true,
                    pinned: true,
                    expandedHeight: c.height / 1.2,
                    automaticallyImplyLeading: false,
                    backgroundColor: c.colours.background,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [
                        StretchMode.fadeTitle,
                      ],
                      background: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          LandingLoader(),
                          SizedBox(height: 48),
                          LandingLogo(),
                          Start(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // bottomNavigationBar: const Start(),
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
