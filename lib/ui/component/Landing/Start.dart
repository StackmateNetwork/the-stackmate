import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);
    final masterKey = context.select((MasterKeyCubit mc) => mc.state.key);

    return SizedBox(
      height: 72,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: context.colours.background,
          primary: context.colours.primary,
        ),
        onPressed: () async {
          // CHECK IF PIN IS VERIFIED
          await pinCubit.checkPin(pinCubit.state.confirmedValue);

          if (true | pinCubit.state.isVerified) {
            // pinCubit.init(); // reset pinCubit state with init() so that isVerified is back to false
            if (masterKey != null) {
              context.push('/home');
            }
            if (masterKey == null) {
              context.push('/add-wallet');
            }
          }
        },
        child: const Text('START'),
      ),
    );
  }
}
