import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/ui/component/Receive/Loader.dart';
import 'package:sats/ui/component/Receive/QrAddress.dart';
import 'package:sats/ui/component/Receive/TextAddress.dart';

class _Receive extends StatelessWidget {
  const _Receive();
  @override
  Widget build(BuildContext c) {
    final state = c.select((ReceiveCubit h) => h.state);
    final tor = c.select((TorCubit t) => t.state);
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
        title: const Text('Receive'),
        leading: Builder(
          builder: (BuildContext context) {
            return BackButton(
              onPressed: () {
                context.pop();
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Loader(),
              const SizedBox(height: 24),
              Align(
                child: Text(
                  state.wallet.label.toUpperCase(),
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeIn(
                // delay: const Duration(milliseconds: 400),
                child: QRAddress(address: state.address),
              ),
              const SizedBox(height: 24),
              FadeIn(
                delay: const Duration(milliseconds: 300),
                child: TextAddress(address: state.address, index: state.index),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({
    super.key,
    required this.wallet,
  });

  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    final receive = ReceiveCubit(
      context.read<WalletsCubit>(),
      context.read<Logger>(),
      locator<IClipBoard>(),
      locator<IShare>(),
      locator<IVibrate>(),
      locator<IStackMateBitcoin>(),
      context.read<NodeAddressCubit>(),
      context.read<TorCubit>(),
      locator<IStorage>(),
      wallet,
    );

    return BlocProvider.value(
      value: receive,
      child: const _Receive(),
    );
  }
}
