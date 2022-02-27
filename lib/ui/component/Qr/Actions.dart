import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/routes.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final selected = c.select((WalletsCubit w) => w.state.selectedWallet);

    return Opacity(
      opacity: selected != null ? 1.0 : 0.5,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              if (selected != null)
                Navigator.pushNamed(
                  c,
                  Routes.receive,
                  // arguments: state.wallet!,
                );
            },
            child: Text('receive'.toUpperCase()),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              if (selected != null)
                Navigator.pushNamed(
                  c,
                  Routes.sendFromQR,
                  // arguments: state.wallet!,
                );
            },
            child: Text('send'.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
