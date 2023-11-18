import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BitcoinDisplaySmall.dart';
import 'package:sats/ui/screen/WalletSingle.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.wallet,
    this.isSelection = false,
  });

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
            final state = context.read<InfoCubit>();
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    WalletScreen(infoCubit: state),
              ),
            );
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
                  // top: 10,
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
                      style: context.fonts.titleMedium!.copyWith(
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
                      style: context.fonts.bodySmall!.copyWith(
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
                      style: context.fonts.bodySmall!.copyWith(
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
          onTap: () {
            // context.push('/receive', extra: wallet);
          },
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
          onTap: () {},
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: loading ? 0.3 : 1,
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
                          context.read<InfoCubit>().updateBalance();
                        },
                        icon: Icon(
                          Icons.sync,
                          size: 21,
                          color: loading
                              ? context.colours.tertiary
                              : context.colours.primary,
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
