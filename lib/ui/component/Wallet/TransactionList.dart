import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/wallet.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Wallet/TransactionItem.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final transactions = c.select((WalletCubit w) => w.state.transactions);

    if (transactions == null || transactions.isEmpty) return Container();

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

          // if (!state.loadingTransactions) ...[
          const SizedBox(height: 24),
          //   Center(
          //       child: TextButton(
          //           onPressed: () {
          //             c.read<HistoryCubit>().getHistory();
          //           },
          //           child: Text('Load More'))),
          //   SizedBox(height: 24),
          // ]
        ],
      ),
    );
  }
}
