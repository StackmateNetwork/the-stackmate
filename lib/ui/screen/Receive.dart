import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Receive/Loader.dart';
import 'package:sats/ui/component/Receive/QrAddress.dart';
import 'package:sats/ui/component/Receive/TextAddress.dart';
import 'package:sats/ui/component/common/header.dart';

class _Receive extends StatelessWidget {
  const _Receive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final state = c.select((ReceiveCubit h) => h.state);
    final walletLabel =
        c.select((WalletsCubit c) => c.state.selectedWallet!.label);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Loader(),
              Header(
                cornerTitle: '',
                children: [
                  const SizedBox(height: 8),
                  const Back(),
                  const SizedBox(height: 28),
                  Align(
                    child: Text(
                      'RECEIVE BITCOIN',
                      style: c.fonts.headline6!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    child: Text(
                      walletLabel.toUpperCase(),
                      style: c.fonts.caption!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
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
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);

    final receive = ReceiveCubit(
      wallets,
      logger,
      locator<IClipBoard>(),
      locator<IShare>(),
      locator<IVibrate>(),
      locator<IStorage>(),
      locator<IStackMateCore>(),
    );

    return BlocProvider.value(
      value: receive,
      child: const _Receive(),
    );
  }
}
