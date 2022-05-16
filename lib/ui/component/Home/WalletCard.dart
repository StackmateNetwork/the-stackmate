import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/extensions.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
    required this.wallet,
    this.isSelection = false,
  }) : super(key: key);

  final Wallet wallet;
  final bool isSelection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read<WalletsCubit>().walletSelected(wallet);
            if (!isSelection) {
              context.push('/wallet');
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: context.colours.background,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  // sigmaX: 0,
                  // sigmaY: 0,
                  tileMode: TileMode.mirror,
                ),
                child: Container(
                  height: 92,
                  width: MediaQuery.of(context).size.width - 192,
                  padding: const EdgeInsets.only(
                      top: 21, left: 12, right: 12, bottom: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      // end: Alignment.centerRight,
                      stops: const [0.3, 0.99],
                      colors: [
                        context.colours.surface,
                        context.colours.surface,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        wallet.label,
                        style: context.fonts.subtitle1!.copyWith(
                          color: context.colours.primary,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        wallet.walletType,
                        overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.end,
                        maxLines: 10,
                        style: context.fonts.caption!.copyWith(
                          color: context.colours.onBackground,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        (wallet.balance > 0)
                            ? NumberFormat('###,000').format(
                                  double.parse(
                                    wallet.balance.toString(),
                                  ),
                                ) +
                                ' sats'
                            : '0 sats',

                        // overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                        style: context.fonts.caption!.copyWith(
                          color: context.colours.onBackground.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<WalletsCubit>().walletSelected(wallet);
            if (!isSelection) {
              context.push('/receive');
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 6, top: 12),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: context.colours.background,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  // sigmaX: 0,
                  // sigmaY: 0,
                  tileMode: TileMode.mirror,
                ),
                child: Container(
                  height: 90,
                  width: 76,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      // end: Alignment.centerRight,
                      stops: const [0.3, 0.99],
                      colors: [
                        context.colours.surface,
                        context.colours.surface,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<WalletsCubit>().walletSelected(wallet);
                          if (!isSelection) {
                            context.push('/receive');
                          }
                        },
                        icon: const Icon(
                          Icons.call_received,
                          size: 24,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<WalletsCubit>().walletSelected(wallet);
            if (!isSelection) {
              context.push('/send');
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 6, top: 12),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: context.colours.background,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  // sigmaX: 0,
                  // sigmaY: 0,
                  tileMode: TileMode.mirror,
                ),
                child: Container(
                  height: 90,
                  width: 76,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      // end: Alignment.centerRight,
                      stops: const [0.3, 0.99],
                      colors: [
                        context.colours.surface,
                        context.colours.surface,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<WalletsCubit>().walletSelected(wallet);
                          if (!isSelection) {
                            context.push('/send');
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          size: 21,
                          color: context.colours.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
