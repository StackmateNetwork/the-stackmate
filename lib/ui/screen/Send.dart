import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/Send/Address.dart';
import 'package:sats/ui/component/Send/Amount.dart';
import 'package:sats/ui/component/Send/Complete.dart';
import 'package:sats/ui/component/Send/Confirm.dart';
import 'package:sats/ui/component/Send/Loader.dart';
import 'package:sats/ui/component/Send/SelectFee.dart';
import 'package:sats/ui/component/Send/WalletDetails.dart';
import 'package:sats/ui/component/Send/ZeroBalance.dart';

class _WalletSend extends StatelessWidget {
  const _WalletSend();

  @override
  Widget build(BuildContext context) {
    final step = context.select((SendCubit sc) => sc.state.currentStep);
    final walletLabel = context.select((SendCubit c) => c.state.wallet.label);
    final walletType =
        context.select((SendCubit c) => c.state.wallet.walletType);
    final tor = context.select((TorCubit t) => t.state);
    return WillPopScope(
      onWillPop: () async {
        if (step == SendSteps.address || step == SendSteps.sent) {
          return true;
        }
        context.read<SendCubit>().backClicked();
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
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
                    textStyle: context.fonts.bodySmall!.copyWith(
                      color: context.colours.primary,
                    ),
                    decoration: BoxDecoration(
                      color: context.colours.surface,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.security_sharp,
                      color: context.colours.tertiaryContainer,
                    ),
                  ),
                ),
              ] else ...[
                IconButton(
                  color: context.colours.error,
                  onPressed: () {
                    context.push('/tor-config');
                  },
                  icon: Icon(
                    Icons.security_sharp,
                    color: context.colours.error,
                  ),
                ),
              ],
            ],
            title: Text((walletType == 'WATCHER') ? 'BUILD' : 'SEND'),
            leading: Builder(
              builder: (BuildContext context) {
                return BackButton(
                  onPressed: () {
                    if (step == SendSteps.address || step == SendSteps.sent) {
                      Navigator.pop(context);
                      return;
                    }
                    if (step != SendSteps.fees) {
                      context.read<SendCubit>().backClicked();
                      return;
                    }
                  },
                );
              },
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: BlocListener<SendCubit, SendState>(
                listener: (context, state) async {
                  if (state.zeroBalanceAmt()) {
                    Navigator.pop(context);
                  }
                },
                listenWhen: (p, c) =>
                    p.zeroBalanceAmt().not(c.zeroBalanceAmt()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Loader(),
                    const SizedBox(height: 24),
                    const ZeroBalance(),
                    if (step == SendSteps.address) ...[
                      const SizedBox(height: 0),
                      Align(
                        child: Text(
                          walletLabel.toUpperCase(),
                          style: context.fonts.bodySmall!.copyWith(
                            color: context.colours.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SendAddress(),
                      ),
                    ],
                    if (step == SendSteps.amount) ...[
                      const SizedBox(height: 0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: WalletDetails(),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: AmountRow(),
                      ),
                    ],
                    if (step == SendSteps.fees) ...[
                      const SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Select Network Fee'.toUpperCase(),
                          style: context.fonts.labelSmall!.copyWith(
                            color: context.colours.onBackground,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SelectFee(),
                      ),
                    ],
                    if (step == SendSteps.confirm) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ConfirmTransaction(),
                      ),
                    ],
                    if (step == SendSteps.sent) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TransactionComplete(),
                      ),
                    ],
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WalletSendScreen extends StatelessWidget {
  const WalletSendScreen({
    super.key,
    required this.fromQr,
    required this.wallet,
  });

  final bool fromQr;
  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    final send = SendCubit(
      fromQr,
      context.read<WalletsCubit>(),
      context.read<ChainSelectCubit>(),
      context.read<Logger>(),
      locator<IClipBoard>(),
      locator<IShare>(),
      context.read<NodeAddressCubit>(),
      context.read<TorCubit>(),
      locator<IStackMateBitcoin>(),
      context.read<FeesCubit>(),
      locator<IStorage>(),
      context.read<MasterKeyCubit>(),
      wallet,
      // locator<FileManager>(),
    );

    return BlocProvider.value(
      value: send,
      child: const _WalletSend(),
    );
  }
}
