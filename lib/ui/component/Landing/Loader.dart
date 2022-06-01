import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class LandingLoader extends StatelessWidget {
  const LandingLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tor = context.select((TorCubit hc) => hc.state);
    // final fees = context.select((FeesCubit hc) => hc.state);
    const String loading = 'Initializing Tor...';
    if (!tor.isRunning && tor.errConnection == '')
      return const Loading(
        text: loading,
      );
    else
      return Container();
  }
}
