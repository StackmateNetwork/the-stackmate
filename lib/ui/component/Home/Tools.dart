import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/pkg/extensions.dart';

class WalletTools extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final preferences = c.select((PreferencesCubit p) => p);

    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  c.push('/broadcast');
                },
                icon: Icon(
                  Icons.language_sharp,
                  size: 32,
                  color: c.colours.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  preferences.incognitoChanged();
                },
                icon: Icon(
                  Icons.hide_source,
                  size: 24,
                  color: c.colours.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  c.push('/add-wallet');
                },
                icon: Icon(Icons.add, size: 32, color: c.colours.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
