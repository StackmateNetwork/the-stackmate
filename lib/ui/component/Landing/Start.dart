import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final torConnected = context.select((TorCubit sc) => sc.state.isConnected);
    final masterKey = context.select((MasterKeyCubit mc) => mc.state.key);

    return IgnorePointer(
      ignoring: !torConnected,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: !torConnected ? 0.3 : 1.0,
        child: SizedBox(
          height: 72,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: context.colours.primary,
              onPrimary: context.colours.background,
            ),
            onPressed: () {
              if (masterKey != null) {
                context.push('/home');
              }
              if (masterKey == null) {
                context.push('/add-wallet');
              }
            },
            child: const Text('START'),
          ),
        ),
      ),
    );
  }
}
