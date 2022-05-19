import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final balance = c.select((InfoCubit hc) => hc.state.balance);
    final preferences = c.select((PreferencesCubit pc) => pc.state);
    final wallet = c.select((WalletsCubit w) => w.state.selectedWallet!);

    return FadeIn(
      child: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: Column(
          children: [
            if (preferences.incognito) ...[
              Text(
                wallet.label,
                style: c.fonts.headline4!.copyWith(
                  color: Colors.white,
                ),
              ),
            ] else ...[
              Text(
                Validation.formatSatsString(balance.toString()),
                style: c.fonts.headline4!.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'sats',
                style: c.fonts.headline6!.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                balance.toBtc() + ' BTC',
                style: c.fonts.caption!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
