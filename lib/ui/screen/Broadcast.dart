import 'package:flutter/material.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Broadcast/Hex.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _Broadcast extends StatelessWidget {
  const _Broadcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<BroadcastCubit, BroadcastState>(
      builder: (context, broadcastState) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Header(
                  cornerTitle: 'Broadcaster'.toUpperCase(),
                  children: [
                    Back(
                      onPressed: () {
                        Navigator.of(c).pop();
                        c.read<BroadcastCubit>().reset();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 64),
                const BroadcastHex()
              ],
            ),
          ),
        );
      },
    );
  }
}

class BroadcastScreen extends StatelessWidget {
  const BroadcastScreen({Key? key}) : super(key: key);

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
