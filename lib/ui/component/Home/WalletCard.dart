import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  width: MediaQuery.of(context).size.width - 200,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        wallet.label,
                        style: context.fonts.subtitle1!.copyWith(
                          color: context.colours.primary,
                        ),
                      ),
                      Text(
                        wallet.walletType,
                        overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.end,
                        maxLines: 10,
                        style: context.fonts.caption!.copyWith(
                          color: context.colours.onBackground,
                          fontSize: 8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (wallet.balance != null) ...[
                        Text(
                          NumberFormat('###,000').format(
                                  double.parse(wallet.balance.toString())) +
                              ' sats',

                          // overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: context.fonts.caption!.copyWith(
                            color:
                                context.colours.onBackground.withOpacity(0.8),
                            // fontSize: 8,
                          ),
                        ),
                      ],
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  width: 75,
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
                        icon: Icon(
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  width: 75,
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
                          size: 24,
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
