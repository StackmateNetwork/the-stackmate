import 'package:flutter/material.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/ui/component/Broadcast/Hex.dart';
import 'package:sats/ui/component/common/BackButton.dart';

class _Broadcast extends StatelessWidget {
  const _Broadcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              children: [
                const SizedBox(width: 16),
                Back(
                  onPressed: () {
                    Navigator.of(c).pop();
                    c.read<BroadcastCubit>().reset();
                  },
                ),
                const Spacer(),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 32),
            const BroadcastHex()
          ],
        ),
      ),
    );
  }
}

class BroadcastScreen extends StatelessWidget {
  const BroadcastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nodeAddressCubit = context.select((NodeAddressCubit c) => c);
    final blockchainCubit = context.select((ChainSelectCubit c) => c);
    final tor = context.select((TorCubit c) => c);
    final logger = context.select((Logger c) => c);
    final psbt = BroadcastCubit(
      logger,
      locator<IStackMateBitcoin>(),
      locator<IClipBoard>(),
      nodeAddressCubit,
      tor,
      blockchainCubit,
    );

    return BlocProvider.value(
      value: psbt,
      child: const _Broadcast(),
    );
  }
}
