import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/pkg/extensions.dart';

class WalletName extends StatelessWidget {
  const WalletName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((InfoCubit wc) => wc.state.wallet);

    return Align(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '' + wallet!.label.toUpperCase(),
          style: context.fonts.titleLarge!.copyWith(
            color: context.colours.primary,
          ),
        ),
      ),
    );
  }
}
