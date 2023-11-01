import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Broadcast/Hex.dart';

class _Broadcast extends StatelessWidget {
  const _Broadcast();

  @override
  Widget build(BuildContext c) {
    final tor = c.select((TorCubit _) => _.state);
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (tor.isConnected) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Tooltip(
                preferBelow: false,
                triggerMode: TooltipTriggerMode.tap,
                message: (tor.isRunning)
                    ? 'Torified Natively.'
                    : 'Torified via External.',
                textStyle: c.fonts.bodySmall!.copyWith(
                  color: c.colours.primary,
                ),
                decoration: BoxDecoration(
                  color: c.colours.surface,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.security_sharp,
                  color: c.colours.tertiaryContainer,
                ),
              ),
            ),
          ] else ...[
            IconButton(
              color: c.colours.error,
              onPressed: () {
                c.push('/tor-config');
              },
              icon: Icon(
                Icons.security_sharp,
                color: c.colours.error,
              ),
            ),
          ],
        ],
        title: const Text('Broadcast'),
        leading: Builder(
          builder: (BuildContext context) {
            return BackButton(
              onPressed: () {
                c.read<BroadcastCubit>().reset();
                c.pop();
              },
            );
          },
        ),
      ),
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 64),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: BroadcastHex(),
            ),
          ],
        ),
      ),
    );
  }
}

class BroadcastScreen extends StatelessWidget {
  const BroadcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final nodeAddressCubit = context.select((NodeAddressCubit c) => c);
    // final blockchainCubit = context.select((ChainSelectCubit c) => c);
    // final tor = context.select((TorCubit c) => c);
    // final logger = context.select((Logger c) => c);
    // final psbt = BroadcastCubit(
    //   logger,
    //   locator<IStackMateBitcoin>(),
    //   locator<IClipBoard>(),
    //   nodeAddressCubit,
    //   tor,
    //   blockchainCubit,
    // );

    return const _Broadcast();
  }
}
