import 'package:flutter/material.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BitcoinDisplaySmall.dart';

class WalletDetails extends StatelessWidget {
  const WalletDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final balance = context.select((SendCubit sc) => sc.state.balance);
    final preferences = context.select((PreferencesCubit pc) => pc.state);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (preferences.incognito) ...[
          Text(
            'Do you have what it takes?'.toUpperCase(),
            style: context.fonts.labelSmall!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
        ] else ...[
          Text(
            'Balance'.toUpperCase(),
            style: context.fonts.labelSmall!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          BitcoinDisplaySmall(
            satsAmount: balance.toString(),
            bitcoinUnit: preferences.preferredBitcoinUnit,
          )
        ],
      ],
    );
  }
}
