import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
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
    return Scaffold(
      appBar: AppBar(
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
              if (state.errLoadingAddress.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Could not find the best unused address. '
                    'Check your node and Tor connection.\n'
                    '${state.errLoadingAddress}',
                    style: c.fonts.bodySmall!.copyWith(
                      color: c.colours.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      c.read<ReceiveCubit>().getLastUnusedAddress(),
                  child: const Text('RETRY'),
                ),
              ],
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
              if (state.address.isNotEmpty)
                FadeIn(child: QRAddress(address: state.address)),
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
    return BlocProvider(
      create: (_) => ReceiveCubit(
        context.read<WalletsCubit>(),
        context.read<Logger>(),
        locator<IClipBoard>(),
        locator<IShare>(),
        locator<IVibrate>(),
        locator<IStackMateBitcoin>(),
        context.read<NodeAddressCubit>(),
        locator<IStorage>(),
        wallet,
      ),
      child: const _Receive(),
    );
  }
}
