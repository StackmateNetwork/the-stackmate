import 'package:flutter/material.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Landing/Loader.dart';
import 'package:sats/ui/component/Landing/Logo.dart';
import 'package:sats/ui/component/Landing/Start.dart';
import 'package:go_router/go_router.dart';

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
              displacement: 10.0,
              onRefresh: () async {
                c.read<TorCubit>().start();
                c.read<TorCubit>().checkStatus();
                return;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  LandingLoader(),
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
