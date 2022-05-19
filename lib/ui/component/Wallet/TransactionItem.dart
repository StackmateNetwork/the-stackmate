import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/pkg/extensions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext c) {
    final preferences = c.select((PreferencesCubit pc) => pc.state);

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
                  Text(
                    'RECEIVE'.notLocalised(),
                    style: c.fonts.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: c.colours.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (preferences.incognito) ...[
                          Text(
                            transaction.timeStr(),
                            style: c.fonts.caption!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                        ] else ...[
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            NumberFormat('###,000').format(
                                  double.parse(
                                    transaction.received.toString(),
                                  ),
                                ) +
                                ' sats',
                            style: (transaction.height > 0)
                                ? c.fonts.headline6!.copyWith(
                                    color: c.colours.onBackground,
                                  )
                                : c.fonts.headline6!.copyWith(
                                    color: c.colours.error,
                                  ),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            transaction.amountToBtc() + ' BTC',
                            style: c.fonts.overline!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                          if (transaction.height == 0)
                            Text(
                              'UNCONFIRMED',
                              style: c.fonts.overline!.copyWith(
                                color: c.colours.onBackground,
                              ),
                            ),
                        ],
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'TRANSACTION ID'.notLocalised(),
                style: c.fonts.overline!.copyWith(
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
                    style: c.fonts.caption!.copyWith(
                      color: c.colours.primary,
                    ),
                  ),
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
                Text(
                  'SEND'.notLocalised(),
                  style: c.fonts.subtitle2!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: c.colours.onBackground,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (preferences.incognito) ...[
                        Text(
                          transaction.timeStr(),
                          style: c.fonts.caption!.copyWith(
                            color: c.colours.onBackground,
                          ),
                        ),
                      ] else ...[
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Text(
                          NumberFormat('###,000').format(
                                double.parse(
                                  (transaction.sent + transaction.fee)
                                      .toString(),
                                ),
                              ) +
                              ' sats',
                          style: (transaction.height > 0)
                              ? c.fonts.headline6!.copyWith(
                                  color: c.colours.onBackground,
                                )
                              : c.fonts.headline6!.copyWith(
                                  color: c.colours.error,
                                ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          transaction.amountToBtc() + ' BTC',
                          style: c.fonts.overline!.copyWith(
                            color: c.colours.onBackground,
                          ),
                        ),
                        if (transaction.height == 0)
                          Text(
                            'UNCONFIRMED',
                            style: c.fonts.overline!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                      ],
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'TRANSACTION ID'.notLocalised(),
              style: c.fonts.overline!.copyWith(
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
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showTxinfo(BuildContext c, Transaction transaction) {
  final isReceive = transaction.isReceive();
  if (isReceive) {
    showCupertinoModalPopup(
      context: c,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          'Transaction Details'.toUpperCase(),
          style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
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
                    style: c.fonts.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: c.colours.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Text(
                          NumberFormat('###,000').format(
                                double.parse(
                                  transaction.received.toString(),
                                ),
                              ) +
                              ' sats',
                          style: (transaction.height > 0)
                              ? c.fonts.headline6!.copyWith(
                                  color: c.colours.onBackground,
                                )
                              : c.fonts.headline6!.copyWith(
                                  color: c.colours.error,
                                ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          transaction.amountToBtc() + ' BTC',
                          style: c.fonts.overline!.copyWith(
                            color: c.colours.onBackground,
                          ),
                        ),
                        if (transaction.height == 0)
                          Text(
                            'UNCONFIRMED',
                            style: c.fonts.overline!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'TRANSACTION ID'.notLocalised(),
                style: c.fonts.overline!.copyWith(
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
                    style: c.fonts.caption!.copyWith(
                      color: c.colours.primary,
                    ),
                  ),
                ),
              ),
              if (transaction.timeStr() != '') ...[
                const SizedBox(height: 16),
                Text(
                  'TIME'.notLocalised(),
                  style: c.fonts.overline!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                Text(
                  transaction.timeStr(),
                  style: c.fonts.caption!.copyWith(
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
              )
            ],
          ),
        ),
        actions: [
          if (transaction.height == 0)
            Container(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                child: Text(
                  'Bump fee',
                  style: c.fonts.button!.copyWith(color: c.colours.primary),
                ),
                onPressed: () async {
                  // c.read<InfoCubit>().openLink(transaction);
                },
              ),
            )
          else
            Container(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'Success',
                  style:
                      c.fonts.button!.copyWith(color: c.colours.onBackground),
                ),
              ),
            ),
          Container(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'BACK',
                style: c.fonts.button!.copyWith(color: c.colours.onBackground),
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
          style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
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
                    style: c.fonts.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: c.colours.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Text(
                          NumberFormat('###,000').format(
                                double.parse(
                                  (transaction.sent + transaction.fee)
                                      .toString(),
                                ),
                              ) +
                              ' sats',
                          style: (transaction.height > 0)
                              ? c.fonts.headline6!.copyWith(
                                  color: c.colours.onBackground,
                                )
                              : c.fonts.headline6!.copyWith(
                                  color: c.colours.error,
                                ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          transaction.amountToBtc() + ' BTC',
                          style: c.fonts.overline!.copyWith(
                            color: c.colours.onBackground,
                          ),
                        ),
                        if (transaction.height == 0)
                          Text(
                            'UNCONFIRMED',
                            style: c.fonts.overline!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'TRANSACTION ID'.notLocalised(),
                style: c.fonts.overline!.copyWith(
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
                    style: c.fonts.caption!.copyWith(
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
                    style: c.fonts.overline!.copyWith(
                      color: c.colours.onBackground,
                    ),
                  ),
                  Text(
                    transaction.timeStr(),
                    style: c.fonts.caption!.copyWith(
                      color: c.colours.onBackground,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                Text(
                  'AMOUNT'.notLocalised(),
                  style: c.fonts.overline!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                Text(
                  NumberFormat('###,000')
                          .format(double.parse(transaction.sent.toString())) +
                      ' sats',
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Fees'.notLocalised(),
                  style: c.fonts.overline!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                Text(
                  NumberFormat('###,000')
                          .format(double.parse(transaction.fee.toString())) +
                      ' sats',
                  style: c.fonts.caption!.copyWith(
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
                )
              ]
            ],
          ),
        ),
        actions: [
          if (transaction.height == 0)
            Container(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                child: Text(
                  'Bump fee',
                  style: c.fonts.button!.copyWith(color: c.colours.primary),
                ),
                onPressed: () async {
                  // c.read<InfoCubit>().openLink(transaction);
                },
              ),
            )
          else
            Container(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'Success',
                  style:
                      c.fonts.button!.copyWith(color: c.colours.onBackground),
                ),
              ),
            ),
          Container(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'BACK',
                style: c.fonts.button!.copyWith(color: c.colours.onBackground),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
