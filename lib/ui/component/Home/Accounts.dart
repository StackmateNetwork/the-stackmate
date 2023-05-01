import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/ui/component/Home/WalletCard.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final wallets = c.select((WalletsCubit w) => w.state.wallets);

    if (wallets.isEmpty)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Text(
              'No\nwallets\nadded',
              style: c.fonts.bodySmall!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
          ),
        ],
      );
    else
      return Container(
        width: c.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var w in wallets) ...[
                const SizedBox(height: 5),
                BlocProvider.value(
                  value: InfoCubit(
                    c.read<WalletsCubit>(),
                    locator<IStorage>(),
                    c.read<Logger>(),
                    locator<ILauncher>(),
                    locator<IShare>(),
                    locator<IVibrate>(),
                    c.read<NodeAddressCubit>(),
                    c.read<TorCubit>(),
                    c.read<ChainSelectCubit>(),
                    w,
                  ),
                  child: WalletCard(wallet: w),
                ),
                const SizedBox(height: 5),
              ],
            ],
          ),
        ),
      );
  }
}
