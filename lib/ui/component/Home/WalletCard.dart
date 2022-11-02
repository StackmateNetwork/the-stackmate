import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BitcoinDisplaySmall.dart';
import 'package:sats/ui/screen/Receive.dart';

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
    final preferences = context.select((PreferencesCubit p) => p);
    final loading = context.select((InfoCubit x) => x.state.loadingBalance);
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            context.push('/wallet', extra: wallet);
          },
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
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
                width: context.width / 2,
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 12,
                  right: 12,
                  bottom: 12,
                ),
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
                        color: context.colours.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      wallet.walletType,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: context.fonts.caption!.copyWith(
                        color: wallet.walletType == 'WATCHER'
                            ? context.colours.secondary
                            : context.colours.tertiary,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      (wallet.descriptor.startsWith('w'))
                          ? 'SEGWIT'
                          : wallet.descriptor.startsWith('tr')
                              ? 'TAPROOT'
                              : 'LEGACY',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: context.fonts.caption!.copyWith(
                        color: context.colours.primary,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (!preferences.state.incognito)
                      BitcoinDisplaySmall(
                        satsAmount: wallet.balance.toString(),
                        bitcoinUnit: preferences.state.preferredBitcoinUnit,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: context.colours.background,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                tileMode: TileMode.mirror,
              ),
              child: Container(
                height: 92,
                width: context.width / 5,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: const [0.3, 0.99],
                    colors: [
                      context.colours.surface,
                      context.colours.surface,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.push('/receive', extra: wallet);

                        // context.push('/receive', extra: wallet);
                      },
                      icon: Icon(
                        Icons.call_received,
                        size: 24,
                        color: context.colours.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<WalletsCubit>().walletSelected(wallet);
            if (!isSelection && wallet.balance > 0) {
              context.read<InfoCubit>().updateBalance();
            }
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: (wallet.balance == 0) ? 0.2 : 1,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: context.colours.background,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  tileMode: TileMode.mirror,
                ),
                child: Container(
                  height: 92,
                  width: context.width / 5,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      stops: const [0.3, 0.99],
                      colors: [
                        context.colours.surface,
                        context.colours.surface,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // context.read<InfoCubit>().updateBalance();
                        },
                        icon: Icon(
                          Icons.sync,
                          size: 21,
                          color: loading ? Colors.red : Colors.green,
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
