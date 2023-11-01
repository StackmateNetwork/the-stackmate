import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BitcoinDisplayMedium.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext c) {
    final preferences = c.select((PreferencesCubit pc) => pc.state);
    final currentHeight = c.select((InfoCubit w) => w.state.currentHeight);
    final confirmations = (currentHeight - transaction.height) + 1;
    final isReceive = transaction.isReceive();
    if (isReceive) {
      return GestureDetector(
        onTap: () {
          _showTxinfo(c, transaction);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: c.colours.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 9.0),
                    child: Text(
                      'RECEIVE'.notLocalised(),
                      style: c.fonts.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: c.colours.onBackground,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (preferences.incognito) ...[
                          Text(
                            transaction.timeStr(),
                            style: c.fonts.bodySmall!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                        ] else ...[
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          BitcoinDisplayMedium(
                            satsAmount: transaction.received.toString(),
                            bitcoinUnit: preferences.preferredBitcoinUnit,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'TRANSACTION ID'.notLocalised(),
                style: c.fonts.labelSmall!.copyWith(
                  color: c.colours.onBackground,
                ),
              ),
              GestureDetector(
                onTap: () {
                  //c.read<InfoCubit>().openLink(transaction);
                },
                child: Container(
                  width: c.width / 2,
                  child: Text(
                    transaction.txIdBlur(),
                    // transaction.txid,
                    style: c.fonts.bodySmall!.copyWith(
                      color: c.colours.primary,
                    ),
                  ),
                ),
              ),
              if (transaction.height == 0)
                Text(
                  'UNCONFIRMED',
                  style: c.fonts.labelSmall!.copyWith(
                    color: c.colours.error,
                  ),
                )
              else if (transaction.height != 0 &&
                  (confirmations <= 6 && confirmations >= 1))
                Text(
                  '$confirmations' + ' Confirmations',
                  style: c.fonts.labelSmall!.copyWith(
                    color: c.colours.secondary,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        _showTxinfo(c, transaction);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: c.colours.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 9.0),
                  child: Text(
                    'SEND'.notLocalised(),
                    style: c.fonts.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: c.colours.onBackground,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (preferences.incognito) ...[
                        Text(
                          transaction.timeStr(),
                          style: c.fonts.bodySmall!.copyWith(
                            color: c.colours.onBackground,
                          ),
                        ),
                      ] else ...[
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        BitcoinDisplayMedium(
                          satsAmount: transaction.sent.toString(),
                          bitcoinUnit: preferences.preferredBitcoinUnit,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'TRANSACTION ID'.notLocalised(),
              style: c.fonts.labelSmall!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
            GestureDetector(
              onTap: () {
                // c.read<InfoCubit>().openLink(transaction);
              },
              child: Container(
                width: c.width / 2,
                child: Text(
                  transaction.txIdBlur(),
                  // transaction.txid,
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ),
            ),
            if (transaction.height == 0)
              Text(
                'UNCONFIRMED',
                style: c.fonts.labelSmall!.copyWith(
                  color: c.colours.error,
                ),
              )
            else if (transaction.height != 0 &&
                (confirmations <= 6 && confirmations >= 1))
              Text(
                '$confirmations' + ' Confirmations',
                style: c.fonts.labelSmall!.copyWith(
                  color: c.colours.secondary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void _showTxinfo(BuildContext c, Transaction transaction) {
  const sats = 'sats';
  final isReceive = transaction.isReceive();
  if (isReceive) {
    showCupertinoModalPopup(
      context: c,
      builder: (BuildContext context) => CupertinoActionSheet(
        cancelButton: ColoredBox(
          color: c.colours.background,
          child: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'BACK',
              style:
                  c.fonts.labelLarge!.copyWith(color: c.colours.onBackground),
            ),
          ),
        ),
        title: Text(
          'Transaction Details'.toUpperCase(),
          style: c.fonts.titleLarge!.copyWith(color: c.colours.onPrimary),
        ),
        message: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: c.colours.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'RECEIVE'.notLocalised(),
                    style: c.fonts.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: c.colours.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        BitcoinDisplayMedium(
                          satsAmount: transaction.received.toString(),
                          bitcoinUnit: sats,
                        ),
                        if (transaction.height == 0)
                          Text(
                            'UNCONFIRMED',
                            style: c.fonts.labelSmall!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'TRANSACTION ID'.notLocalised(),
                style: c.fonts.labelSmall!.copyWith(
                  color: c.colours.onBackground,
                ),
              ),
              GestureDetector(
                onTap: () {
                  c.read<InfoCubit>().openLink(transaction);
                },
                child: Container(
                  width: c.width / 2,
                  child: Text(
                    // transaction.txIdBlur(),
                    transaction.txid,
                    style: c.fonts.bodySmall!.copyWith(
                      color: c.colours.primary,
                    ),
                  ),
                ),
              ),
              if (transaction.timeStr() != '') ...[
                const SizedBox(height: 16),
                Text(
                  'TIME'.notLocalised(),
                  style: c.fonts.labelSmall!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                Text(
                  transaction.timeStr(),
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
              ],
              const SizedBox(height: 16),
              //SizedBox(height: 8),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      c.read<InfoCubit>().shareTransaction(transaction);
                    },
                    child: Text(
                      'SHARE'.notLocalised(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          if (transaction.height == 0)
            ColoredBox(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                child: Text(
                  'Bump fee',
                  style: c.fonts.labelLarge!.copyWith(color: c.colours.primary),
                ),
                onPressed: () async {
                  // c.read<InfoCubit>().openLink(transaction);
                },
              ),
            )
          else
            ColoredBox(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'Success',
                  style: c.fonts.labelLarge!
                      .copyWith(color: c.colours.onBackground),
                ),
              ),
            ),
          ColoredBox(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'BACK',
                style:
                    c.fonts.labelLarge!.copyWith(color: c.colours.onBackground),
              ),
            ),
          ),
        ],
      ),
    );
  } else {
    showCupertinoModalPopup(
      context: c,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          'Transaction Details'.toUpperCase(),
          style: c.fonts.titleLarge!.copyWith(color: c.colours.onPrimary),
        ),
        message: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: c.colours.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'SEND'.notLocalised(),
                    style: c.fonts.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: c.colours.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        BitcoinDisplayMedium(
                          satsAmount: transaction.sent.toString(),
                          bitcoinUnit: sats,
                        ),
                        if (transaction.height == 0)
                          Text(
                            'UNCONFIRMED',
                            style: c.fonts.labelSmall!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'TRANSACTION ID'.notLocalised(),
                style: c.fonts.labelSmall!.copyWith(
                  color: c.colours.onBackground,
                ),
              ),
              GestureDetector(
                onTap: () {
                  c.read<InfoCubit>().openLink(transaction);
                },
                child: Container(
                  width: c.width / 2,
                  child: Text(
                    // transaction.txIdBlur()
                    transaction.txid,
                    style: c.fonts.bodySmall!.copyWith(
                      color: c.colours.primary,
                    ),
                  ),
                ),
              ),
              ...[
                const SizedBox(height: 16),
                if (transaction.timeStr() != '') ...[
                  const SizedBox(height: 16),
                  Text(
                    'TIME'.notLocalised(),
                    style: c.fonts.labelSmall!.copyWith(
                      color: c.colours.onBackground,
                    ),
                  ),
                  Text(
                    transaction.timeStr(),
                    style: c.fonts.bodySmall!.copyWith(
                      color: c.colours.onBackground,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                Text(
                  'AMOUNT'.notLocalised(),
                  style: c.fonts.labelSmall!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                Text(
                  NumberFormat('###,000')
                          .format(double.parse(transaction.sent.toString())) +
                      ' sats',
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Fees'.notLocalised(),
                  style: c.fonts.labelSmall!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                Text(
                  NumberFormat('###,000')
                          .format(double.parse(transaction.fee.toString())) +
                      ' sats',
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        c.read<InfoCubit>().shareTransaction(transaction);
                      },
                      child: Text('SHARE'.notLocalised()),
                    ),
                    const SizedBox(width: 32),
                  ],
                ),
              ],
            ],
          ),
        ),
        actions: [
          if (transaction.height == 0)
            ColoredBox(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                child: Text(
                  'Bump fee',
                  style: c.fonts.labelLarge!.copyWith(color: c.colours.primary),
                ),
                onPressed: () async {
                  // c.read<InfoCubit>().openLink(transaction);
                },
              ),
            )
          else
            ColoredBox(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'Success',
                  style: c.fonts.labelLarge!
                      .copyWith(color: c.colours.onBackground),
                ),
              ),
            ),
          ColoredBox(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'BACK',
                style:
                    c.fonts.labelLarge!.copyWith(color: c.colours.onBackground),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
