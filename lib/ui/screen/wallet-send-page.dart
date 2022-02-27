import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/back-button.dart';
import 'package:sats/ui/component/common/loading.dart';
import 'package:sats/ui/component/common/log-button.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingStart =
        context.select((SendCubit sc) => sc.state.loadingStart);
    final buildingTx = context.select((SendCubit sc) => sc.state.buildingTx);
    final calculating =
        context.select((SendCubit sc) => sc.state.calculatingFees);

    final sendingTx = context.select((SendCubit sc) => sc.state.sendingTx);

    if (loadingStart) return const Loading(text: 'Loading Balance');
    if (calculating) return const Loading(text: 'Calculating Fees');
    if (buildingTx) return const Loading(text: 'Building Transaction');
    if (sendingTx) return const Loading(text: 'Sending Amount');

    return Container();
  }
}

class ZeroBalance extends StatelessWidget {
  const ZeroBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zerobal = context.select((SendCubit sc) => sc.state.zeroBalanceAmt());

    if (zerobal)
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'SORRY !\nYou have\nZero\nBalance.',
          style: context.fonts.headline5!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
      );

    return Container();
  }
}

class WalletDetails extends StatelessWidget {
  const WalletDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final walletName = context.select(
    //   (WalletsCubit wc) => wc.state.selectedWallet!.label,
    // );
    final balance = context.select((SendCubit sc) => sc.state.balance);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text(
        //   walletName,
        //   style: context.fonts.headline5!.copyWith(
        //     color: context.colours.onBackground,
        //   ),
        // ),
        // const SizedBox(height: 40),
        if (balance != null) ...[
          Text(
            'Balance'.toUpperCase(),
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Text(
            balance.toString() + ' sats',
            style: context.fonts.headline6!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Text(
            balance.toBtc() + ' BTC',
            style: context.fonts.caption!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
        ],
      ],
    );
  }
}

class SendAddress extends StatefulWidget {
  const SendAddress({Key? key}) : super(key: key);

  @override
  State<SendAddress> createState() => _SendAddressState();
}

class _SendAddressState extends State<SendAddress> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final address = context.select((SendCubit sc) => sc.state.address);
    final errAddress = context.select((SendCubit sc) => sc.state.errAddress);
    final loading = context.select((SendCubit sc) => sc.state.loadingStart);

    if (address != _controller.text) _controller.text = address;

    return IgnorePointer(
      ignoring: loading,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: loading ? 0.3 : 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'To Address'.toUpperCase(),
              style: context.fonts.overline!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              style: TextStyle(color: context.colours.onBackground),
              decoration: InputDecoration(
                hintText: 'Enter Address'.toUpperCase(),
                errorText: errAddress.nullIfEmpty(),
              ),
              onChanged: (t) {
                context.read<SendCubit>().adddressChanged(t);
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<SendCubit>().pasteAddress();
                  },
                  child: const Text('PASTE'),
                ),
                IconButton(
                  onPressed: () {
                    context.read<SendCubit>().scanAddress(false);
                  },
                  icon: Icon(
                    Icons.qr_code,
                    size: 32,
                    color: context.colours.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            TextButton(
              onPressed: () {
                context.read<SendCubit>().addressConfirmedClicked();
              },
              child: const Text('CONFIRM'),
            ),
          ],
        ),
      ),
    );
  }
}

class AmountRow extends StatefulWidget {
  const AmountRow({
    Key? key,
  }) : super(key: key);

  @override
  State<AmountRow> createState() => _AmountRowState();
}

class _AmountRowState extends State<AmountRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    final amount = c.select((SendCubit sc) => sc.state.amount);
    final errAmount = c.select((SendCubit sc) => sc.state.errAmount);
    final isSweep = c.select((SendCubit sc) => sc.state.sweepWallet);
    final balance = c.select((SendCubit sc) => sc.state.balance!);

    if (amount != _controller.text) _controller.text = amount;

    return Column(
      children: [
        IgnorePointer(
          ignoring: isSweep,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isSweep ? 0.5 : 1,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: TextStyle(color: c.colours.onBackground),
              decoration: InputDecoration(
                hintText: isSweep
                    ? 'WALLET WILL BE EMPTIED'
                    : 'Enter SATS Amount'.toUpperCase(),
                hintStyle: isSweep
                    ? TextStyle(
                        color: c.colours.onBackground,
                      )
                    : null,
                errorText: errAmount.nullIfEmpty(),
              ),
              onChanged: (t) {
                if (!isSweep) c.read<SendCubit>().amountChanged(t);
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isSweep
                  ? '    BTC: ' + balance.toBtc()
                  : '    BTC: ' + amount.toBtc(),
              style: c.fonts.caption!.copyWith(
                color: c.colours.onBackground.withOpacity(0.7),
              ),
            ),
            TextButton(
              onPressed: () {
                c.read<SendCubit>().toggleSweep();
              },
              child: Text(
                isSweep
                    ? 'Change amount'.toUpperCase()
                    : 'Empty Wallet'.toUpperCase(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 100),
        TextButton(
          onPressed: () {
            context.read<SendCubit>().amountConfirmedClicked();
          },
          child: const Text('CONFIRM'),
        ),
      ],
    );
  }
}

class FeeSelect extends StatefulWidget {
  const FeeSelect({
    Key? key,
  }) : super(key: key);

  @override
  State<FeeSelect> createState() => _FeeSelectState();
}

class _FeeSelectState extends State<FeeSelect> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendCubit, SendState>(
      builder: (context, state) {
        if (state.feeSlow == null ||
            state.feeMedium == null ||
            state.feeFast == null) return Container();

        final slow = state.feeSlow!.toString();
        final medium = state.feeMedium!.toString();
        final fast = state.feeFast!.toString();

        final buildingTx = state.buildingTx;
        final calculatingFees = state.calculatingFees;

        if (state.fees != _controller.text) _controller.text = state.fees;

        return IgnorePointer(
          ignoring: buildingTx || calculatingFees,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: (buildingTx || calculatingFees) ? 0.3 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Opacity(
                          opacity: state.feesOption == 0 ? 1 : 0.6,
                          child: TextButton(
                            onPressed: () {
                              context.read<SendCubit>().feeSelected(0);
                            },
                            child: Text('slow'.toUpperCase()),
                          ),
                        ),
                        Text(
                          '~ 60 minutes\n($slow sats)',
                          textAlign: TextAlign.center,
                          style: context.fonts.caption!.copyWith(
                            fontSize: 10,
                            color:
                                context.colours.onBackground.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Opacity(
                          opacity: state.feesOption == 1 ? 1 : 0.6,
                          child: TextButton(
                            onPressed: () {
                              context.read<SendCubit>().feeSelected(1);
                            },
                            child: Text('medium'.toUpperCase()),
                          ),
                        ),
                        Text(
                          '~ 30 minutes\n($medium sats)',
                          textAlign: TextAlign.center,
                          style: context.fonts.caption!.copyWith(
                            fontSize: 10,
                            color:
                                context.colours.onBackground.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Opacity(
                          opacity: state.feesOption == 2 ? 1 : 0.6,
                          child: TextButton(
                            onPressed: () {
                              context.read<SendCubit>().feeSelected(2);
                            },
                            child: Text('Fast'.toUpperCase()),
                          ),
                        ),
                        Text(
                          '~ 10 minutes\n($fast sats)',
                          textAlign: TextAlign.center,
                          style: context.fonts.caption!.copyWith(
                            fontSize: 10,
                            color:
                                context.colours.onBackground.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _controller,
                  style: TextStyle(color: context.colours.onBackground),
                  decoration: InputDecoration(
                    hintText: 'Enter custom fee'.toUpperCase(),
                    errorText: state.errFees.nullIfEmpty(),
                  ),
                  onChanged: (t) {
                    context.read<SendCubit>().feeChanged(t);
                  },
                ),
                const SizedBox(height: 60),
                if (state.finalFee != null) ...[
                  Text(
                    'FINAL FEES',
                    style: context.fonts.overline!.copyWith(
                      color: context.colours.onBackground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${state.finalFee} sats',
                    style: context.fonts.subtitle1!.copyWith(
                      color: context.colours.onBackground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${state.finalFee!.toBtc()} BTC',
                    style: context.fonts.caption!.copyWith(
                      color: context.colours.onBackground,
                    ),
                  ),
                ],
                const SizedBox(height: 80),
                TextButton(
                  onPressed: () {
                    context.read<SendCubit>().feeConfirmedClicked();
                  },
                  child: const Text('CONFIRM'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ConfirmTransaction extends StatelessWidget {
  const ConfirmTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((SendCubit sc) => sc.state);

    if (state.finalAmount == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // const SizedBox(height: 24),
        Text(
          'Confirm\nTransaction',
          style: context.fonts.headline5!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Address'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.address,
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 60),
        Text(
          'Amount'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.finalAmount.toString() + ' sats',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '' + state.finalAmount.toBtc() + ' BTC',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 60),
        Text(
          'Network Fee'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.finalFee.toString() + ' sats',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 60),
        Text(
          'Total'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.total().toString() + ' sats',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '' + state.total().toBtc() + ' BTC',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () {
            context.read<SendCubit>().sendClicked();
          },
          child: const Text('SEND'),
        )
      ],
    );
  }
}

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txid = context.select((SendCubit sc) => sc.state.txId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 60),
        Text(
          'Confirm\nTransaction',
          style: context.fonts.headline5!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Transaction ID'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + txid,
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () {
            context.read<SendCubit>().shareTxId();
          },
          child: const Text('SHARE TRANSACTION ID'),
        )
      ],
    );
  }
}

class WalletSendPage extends StatelessWidget {
  const WalletSendPage({Key? key}) : super(key: key);

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

                              // if (step != SendSteps.fees) {
                              context.read<SendCubit>().backClicked();
                              // return;
                              // }
                              // if (confirmedStep)
                              //   context.read<HistoryCubit>().getHistory();
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
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Text(
                      //     'Amount'.toUpperCase(),
                      //     style: context.fonts.overline!.copyWith(
                      //       color: context.colours.onBackground,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 16),
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
                        child: FeeSelect(),
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
