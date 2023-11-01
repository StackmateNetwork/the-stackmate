import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class AmountRow extends StatefulWidget {
  const AmountRow({super.key});

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    final amount = c.select((SendCubit sc) => sc.state.amount);
    final isSweep = c.select((SendCubit sc) => sc.state.sweepWallet);
    final balance = c.select((SendCubit sc) => sc.state.balance);

    if (amount != _controller.text) _controller.text = amount;

    return BlocListener<SendCubit, SendState>(
      listener: (context, state) => {
        if (state.errLoading != '')
          {
            handleError(
              context,
              state.errLoading,
            ),
          }
        else if (state.errAmount != '')
          {
            handleError(
              context,
              state.errAmount,
            ),
          }
        else if (state.errFees != '')
          {
            handleError(
              context,
              state.errAmount,
            ),
          },
      },
      child: BlocBuilder<SendCubit, SendState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IgnorePointer(
                ignoring: isSweep,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isSweep ? 0.5 : 1,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [ThousandsFormatter()],
                    style: TextStyle(
                      color: c.colours.onBackground,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: _controller.clear,
                        icon: const Icon(Icons.clear),
                      ),
                      hintText: isSweep
                          ? 'WALLET WILL BE SWEEP'
                          : 'Amount in SATS'.toUpperCase(),
                      hintStyle: isSweep
                          ? TextStyle(
                              color: c.colours.onBackground,
                            )
                          : null,
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
                    style: c.fonts.bodySmall!.copyWith(
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
                          : 'Sweep Wallet'.toUpperCase(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: c.colours.background,
                    backgroundColor: c.colours.primary,
                  ),
                  onPressed: () {
                    if (amount != '') {
                      context.read<SendCubit>().amountConfirmedClicked();
                    }
                  },
                  child: const Text('CONFIRM'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
