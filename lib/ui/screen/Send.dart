import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';
import 'package:sats/ui/component/Send/Address.dart';
import 'package:sats/ui/component/Send/Amount.dart';
import 'package:sats/ui/component/Send/Complete.dart';
import 'package:sats/ui/component/Send/Confirm.dart';
import 'package:sats/ui/component/Send/Loader.dart';
import 'package:sats/ui/component/Send/SelectFee.dart';
import 'package:sats/ui/component/Send/WalletDetails.dart';
import 'package:sats/ui/component/Send/ZeroBalance.dart';

class _WalletSend extends StatelessWidget {
  const _WalletSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step = context.select((SendCubit sc) => sc.state.currentStep);

    return WillPopScope(
      onWillPop: () async {
        if (step != SendSteps.address && step != SendSteps.sent) {
          context.read<SendCubit>().backClicked();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: BlocListener<SendCubit, SendState>(
                listener: (context, state) async {
                  if (state.zeroBalanceAmt()) {
                    await Future.delayed(const Duration(milliseconds: 2000));
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
                              if (step == SendSteps.confirm)
                                context.read<InfoCubit>().getHistory();
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
                    const SizedBox(height: 40),
                    const ZeroBalance(),
                    if (step == SendSteps.address) ...[
                      const SizedBox(height: 0),
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
                      const SizedBox(height: 80),
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
                    if (step == SendSteps.confirm)
                      FadeIn(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ConfirmTransaction(),
                        ),
                      ),
                    if (step == SendSteps.sent)
                      FadeIn(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TransactionComplete(),
                        ),
                      ),
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

    final s = SendCubit(
        fromQr,
        wallets,
        networkSelect,
        logger,
        locator<IClipBoard>(),
        locator<IShare>(),
        nodeAddress,
        locator<IStackMateCore>(),
        fees);

    return BlocProvider.value(
      value: s,
      child: const _WalletSend(),
    );
  }
}
