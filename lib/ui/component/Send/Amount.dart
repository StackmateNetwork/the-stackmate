import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class AmountRow extends StatefulWidget {
  const AmountRow({Key? key}) : super(key: key);

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
    final balance = c.select((SendCubit sc) => sc.state.balance);

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
              //inputFormatters: [ThousandsFormatter()],
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
