import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class WalletName extends StatelessWidget {
  const WalletName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((WalletsCubit wc) => wc.state.selectedWallet);
    if (wallet == null) return Container();

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '' + wallet.label.toUpperCase(),
          style: context.fonts.headline6!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
      ),
    );
  }
}
