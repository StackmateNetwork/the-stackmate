import 'package:material_ui/material_ui.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/node.dart';
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
import 'package:sats/ui/component/common/ErrorHandler.dart';

class _WalletSend extends StatelessWidget {
  const _WalletSend();

  @override
  Widget build(BuildContext context) {
    final step = context.select((SendCubit sc) => sc.state.currentStep);
    final walletLabel = context.select((SendCubit c) => c.state.wallet.label);
    return PopScope(
      canPop: step == SendSteps.address || step == SendSteps.sent,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.read<SendCubit>().backClicked();
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('SEND'),
            leading: Builder(
              builder: (BuildContext context) {
                return BackButton(
                  onPressed: () {
                    if (step == SendSteps.address || step == SendSteps.sent) {
                      Navigator.pop(context);
                    } else {
                      context.read<SendCubit>().backClicked();
                    }
                  },
                );
              },
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: BlocListener<SendCubit, SendState>(
                listenWhen: (p, c) => _error(c).isNotEmpty && _error(c) != _error(p),
                listener: (context, state) => handleError(context, _error(state)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Loader(),
                    const SizedBox(height: 24),
                    if (step == SendSteps.address) ...[
                      const ZeroBalance(),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Select Network Fee'.toUpperCase(),
                          style: context.fonts.labelSmall!.copyWith(
                            color: context.colours.onSurface,
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

/// The message of whichever error is set; at most one is at a time.
String _error(SendState s) => [
      s.errLoading,
      s.errAddress,
      s.errAmount,
      s.errFees,
      s.errSending,
    ].firstWhere((e) => e.isNotEmpty, orElse: () => '');

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
    return BlocProvider(
      create: (_) => SendCubit(
        fromQr,
        context.read<WalletsCubit>(),
        context.read<ChainSelectCubit>(),
        context.read<Logger>(),
        locator<IClipBoard>(),
        locator<IShare>(),
        context.read<NodeAddressCubit>(),
        locator<IStackMateBitcoin>(),
        context.read<FeesCubit>(),
        locator<IStorage>(),
        context.read<MasterKeyCubit>(),
        wallet,
      ),
      child: const _WalletSend(),
    );
  }
}
