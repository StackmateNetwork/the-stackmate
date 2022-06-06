import 'package:flutter/material.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';

class LandingLoader extends StatelessWidget {
  const LandingLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tor = context.select((TorCubit hc) => hc.state);
    // final fees = context.select((FeesCubit hc) => hc.state);
    // const String loading = 'Initializing Tor...';
    if (!tor.isConnected && tor.errConnection == '')
      return LinearProgressIndicator(
        backgroundColor: context.colours.primary,
        valueColor: AlwaysStoppedAnimation<Color>(context.colours.onPrimary),
        value: double.parse(tor.bootstapProgress),
      );
    else
      return Container();
  }
}
