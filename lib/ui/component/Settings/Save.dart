import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class SavePreferences extends StatelessWidget {
  const SavePreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final preferences = c.select((PreferencesCubit p) => p);
    final wallets = c.select((WalletsCubit w) => w);

    return Container(
      height: 120,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: TextButton(
        onPressed: () {
          preferences.saveClicked();
          // wallets.refresh();
        },
        child: const Text('SAVE'),
      ),
    );
  }
}
