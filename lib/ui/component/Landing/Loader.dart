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

    if (tor.isConnected) return Container();
    if (tor.isRunning)
      return Loading(
        text: tor.bootstapProgress,
      );
    else
      return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          tor.errConnection,
          style: context.fonts.caption!.copyWith(
            color: context.colours.error,
          ),
          textAlign: TextAlign.center,
        ),
      );
    // else
    //   return Padding(
    //     padding: const EdgeInsets.only(top: 5),
    //     child: Text(
    //       tor.errConnection,
    //       style: context.fonts.caption!.copyWith(
    //         color: context.colours.error,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //   );
  }
}
