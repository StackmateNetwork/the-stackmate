import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

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
              if (selected != null) c.push('/receive');
            },
            child: Text('receive'.toUpperCase()),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              if (selected != null) c.push('/send-from-qr');
            },
            child: Text('send'.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
