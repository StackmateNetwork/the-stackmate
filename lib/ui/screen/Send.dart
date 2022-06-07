import 'package:flutter/material.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/ui/component/Send/Address.dart';
import 'package:sats/ui/component/Send/Amount.dart';
import 'package:sats/ui/component/Send/Complete.dart';
import 'package:sats/ui/component/Send/Confirm.dart';
import 'package:sats/ui/component/Send/Loader.dart';
import 'package:sats/ui/component/Send/SelectFee.dart';
import 'package:sats/ui/component/Send/WalletDetails.dart';
import 'package:sats/ui/component/Send/ZeroBalance.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/LogButton.dart';

class _WalletSend extends StatelessWidget {
  const _WalletSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step = context.select((SendCubit sc) => sc.state.currentStep);
    final walletLabel =
        context.select((WalletsCubit c) => c.state.selectedWallet!.label);
    final walletType =
        context.select((WalletsCubit c) => c.state.selectedWallet!.walletType);

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
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Back(
                            onPressed: () {
                              if (step == SendSteps.address ||
                                  step == SendSteps.sent) {
                                Navigator.pop(context);
                                return;
                              }
                              if (step != SendSteps.fees) {
                                context.read<SendCubit>().backClicked();
                                return;
                              }
                            },
                          ),
                          LogButton(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.lightbulb_outline_sharp,
                                size: 32,
                                color: context.colours.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ZeroBalance(),
                    if (step == SendSteps.address) ...[
                      const SizedBox(height: 0),
                      Align(
                        child: Text(
                          (walletType == 'WATCHER')
                              ? 'BUILD TRANSACTION'
                              : 'SEND BITCOIN',
                          style: context.fonts.headline6!.copyWith(
                            color: context.colours.onPrimary,
                          ),
                        ),
                      ),
                      Align(
                        child: Text(
                          walletLabel.toUpperCase(),
                          style: context.fonts.caption!.copyWith(
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
                          style: context.fonts.overline!.copyWith(
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
  const WalletSendScreen({Key? key, required this.fromQr}) : super(key: key);

  final bool fromQr;

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);
    final nodeAddress = context.select((NodeAddressCubit c) => c);
    final fees = context.select((FeesCubit c) => c);
    final tor = context.select((TorCubit c) => c);

    final s = SendCubit(
      fromQr,
      wallets,
      networkSelect,
      logger,
      locator<IClipBoard>(),
      locator<IShare>(),
      nodeAddress,
      tor,
      locator<IStackMateBitcoin>(),
      fees,
      // locator<FileManager>(),
    );

    return BlocProvider.value(
      value: s,
      child: const _WalletSend(),
    );
  }
}
