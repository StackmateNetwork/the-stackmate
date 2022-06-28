import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/pkg/extensions.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final masterKey = context.select((MasterKeyCubit mc) => mc.state.key);

    return SizedBox(
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
    );
  }
}
