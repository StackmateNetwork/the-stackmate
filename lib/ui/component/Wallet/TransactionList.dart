import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Wallet/TransactionItem.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final transactions = c.select((InfoCubit w) => w.state.transactions);
    if (transactions.isEmpty) return Container();

    return FadeIn(
      delay: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 32, bottom: 24),
            child: Text(
              'HISTORY',
              style: c.fonts.overline!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
          ),
          for (var transaction in transactions)
            TransactionItem(transaction: transaction),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
