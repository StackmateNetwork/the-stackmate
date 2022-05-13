import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  final Transaction transaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext c) {
    final isReceive = widget.transaction.isReceive();

    if (isReceive) {
      return AnimatedSwitcher(
        key: _isExpanded ? const ValueKey(1) : const ValueKey(2),
        duration: const Duration(milliseconds: 2000),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
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
                          Padding(padding: const EdgeInsets.only(top: 8)),
                          Text(
                            NumberFormat('###,000').format(
                                  double.parse(
                                    widget.transaction.received.toString(),
                                  ),
                                ) +
                                ' sats',
                            style: (widget.transaction.height > 0)
                                ? c.fonts.headline6!.copyWith(
                                    color: c.colours.onBackground,
                                  )
                                : c.fonts.headline6!.copyWith(
                                    color: Colors.blue,
                                  ),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            widget.transaction.amountToBtc() + ' BTC',
                            style: c.fonts.overline!.copyWith(
                              color: c.colours.onBackground,
                            ),
                          ),
                          if (widget.transaction.height == 0)
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
                    c.read<InfoCubit>().openLink(widget.transaction);
                  },
                  child: Container(
                    width: c.width / 2,
                    child: Text(
                      !_isExpanded
                          ? widget.transaction.txIdBlur()
                          : widget.transaction.txid,
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.primary,
                      ),
                    ),
                  ),
                ),
                if (_isExpanded) ...[
                  if (widget.transaction.timeStr() != '') ...[
                    const SizedBox(height: 16),
                    Text(
                      'TIME'.notLocalised(),
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    Text(
                      widget.transaction.timeStr(),
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  //SizedBox(height: 8),
                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: c.width / 4,
                        child: TextButton(
                          onPressed: () {
                            c
                                .read<InfoCubit>()
                                .shareTransaction(widget.transaction);
                          },
                          child: Text(
                            'SHARE'.notLocalised(),
                          ),
                        ),
                      )
                    ],
                  )
                ]
              ],
            ),
          ),
        ),
      );
    }

    return AnimatedSwitcher(
      key: _isExpanded ? const ValueKey(1) : const ValueKey(2),
      duration: const Duration(milliseconds: 2000),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
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
                        Padding(padding: const EdgeInsets.only(top: 8)),
                        Text(
                          NumberFormat('###,000').format(
                                double.parse(
                                  (widget.transaction.sent +
                                          widget.transaction.fee)
                                      .toString(),
                                ),
                              ) +
                              ' sats',
                          style: c.fonts.headline6!.copyWith(
                            color: c.colours.onBackground,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          widget.transaction.amountToBtc() + ' BTC',
                          style: c.fonts.overline!.copyWith(
                            color: c.colours.onBackground,
                          ),
                        )
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
                  c.read<InfoCubit>().openLink(widget.transaction);
                },
                child: Container(
                  width: c.width / 2,
                  child: Text(
                    !_isExpanded
                        ? widget.transaction.txIdBlur()
                        : widget.transaction.txid,
                    style: c.fonts.caption!.copyWith(
                      color: c.colours.primary,
                    ),
                  ),
                ),
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 16),
                if (widget.transaction.timeStr() != '') ...[
                  const SizedBox(height: 16),
                  Text(
                    'TIME'.notLocalised(),
                    style: c.fonts.overline!.copyWith(
                      color: c.colours.onBackground,
                    ),
                  ),
                  Text(
                    widget.transaction.timeStr(),
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
                  NumberFormat('###,000').format(
                          double.parse(widget.transaction.sent.toString())) +
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
                  NumberFormat('###,000').format(
                          double.parse(widget.transaction.fee.toString())) +
                      ' sats',
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        c
                            .read<InfoCubit>()
                            .shareTransaction(widget.transaction);
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
      ),
    );
  }
}
