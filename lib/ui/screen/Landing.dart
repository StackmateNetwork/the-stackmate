import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Landing/Keypad.dart';
import 'package:sats/ui/component/Landing/Logo.dart';
import 'package:sats/ui/component/Landing/PinButton.dart';
import 'package:sats/ui/component/Landing/PinPrompt.dart';
import 'package:sats/ui/component/Landing/PinValue.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class _Landing extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final masterKey = c.select((MasterKeyCubit mc) => mc.state.key);

    return BlocListener<PinCubit, PinState>(
      listener: (context, state) => {
        if (state.isVerified)
          {
            if (masterKey != null)
              {
                c.push('/home'),
              }
            else
              {
                c.push('/add-wallet'),
              }
          }
        else if (state.error != null)
          {
            handleError(
              context,
              state.error!,
            )
          }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
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
                      SizedBox(height: 36),
                      LandingLogo(),
                      SizedBox(height: 12),
                      PinPrompt(),
                      SizedBox(height: 12),
                      PinValue(),
                      SizedBox(height: 55),
                      PinKeypad(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const PinButton(),
      ),
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _Landing();
  }
}
