import 'package:flutter/material.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/psbt-tool.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/ui/component/PSBT/Broadcast.dart';
import 'package:sats/ui/component/common/BackButton.dart';

class _PSBTTools extends StatelessWidget {
  const _PSBTTools({Key? key}) : super(key: key);

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
                    c.read<PSBTCubit>().reset();
                  },
                ),
                const Spacer(),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 32),
            const BroadcastPSBT()
          ],
        ),
      ),
    );
  }
}

class PSBTScreen extends StatelessWidget {
  const PSBTScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nodeAddressCubit = context.select((NodeAddressCubit c) => c);
    final blockchainCubit = context.select((ChainSelectCubit c) => c);
    final tor = context.select((TorCubit c) => c);

    final psbt = PSBTCubit(
      locator<IStackMateBitcoin>(),
      locator<IClipBoard>(),
      nodeAddressCubit,
      tor,
      blockchainCubit,
    );

    return BlocProvider.value(
      value: psbt,
      child: const _PSBTTools(),
    );
  }
}
