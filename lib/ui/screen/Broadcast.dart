import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Broadcast/Hex.dart';

class _Broadcast extends StatelessWidget {
  const _Broadcast();

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<BroadcastCubit, BroadcastState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // actions: <Widget>[
            //   TextButton(
            //     onPressed: () {},
            //     child: const Text('Action 1'),
            //   ),
            // ],
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
      },
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
