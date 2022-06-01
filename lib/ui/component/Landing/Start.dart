import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final torRunning = context.select((TorCubit sc) => sc.state.isRunning);

    return IgnorePointer(
      ignoring: torRunning,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: !torRunning ? 0.3 : 1.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: context.colours.primary,
            onPrimary: context.colours.background,
          ),
          onPressed: () {
            context.push('/home');
          },
          child: const Text('START'),
        ),
      ),
    );
  }
}
