import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
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
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _Receive extends StatelessWidget {
  const _Receive({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext c) {
    final state = c.select((ReceiveCubit h) => h.state);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Loader(),
              const SizedBox(height: 24),
              Header(
                cornerTitle: 'RECEIVE',
                children: [
                  const Back(),
                  const SizedBox(height: 24),
                  Align(
                    child: Text(
                      state.wallet.label.toUpperCase(),
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
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
    Key? key,
    required this.wallet,
  }) : super(key: key);

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
