import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';

class SeedGenerateLabel extends StatelessWidget {
  const SeedGenerateLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      buildWhen: (previous, current) =>
          previous.walletLabelError != current.walletLabelError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              'Name your wallet',
              style: c.fonts.headline4!.copyWith(
                color: c.colours.onPrimary,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                onChanged: (text) {
                  c.read<SeedGenerateWalletCubit>().labelChanged(text);
                },
                style: TextStyle(color: c.colours.onPrimary),
                decoration: const InputDecoration(
                  labelText: 'Wallet Name',
                  labelStyle: TextStyle(color: Colors.transparent),
                ),
              ),
            ),
            const SizedBox(height: 40),
            if (state.walletLabelError != '')
              Text(
                state.walletLabelError,
                style: c.fonts.caption!.copyWith(color: c.colours.error),
              ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  c.read<SeedGenerateWalletCubit>().nextClicked();
                },
                child: Text('Confirm'.toUpperCase()),
              ),
            )
          ],
        );
      },
    );
  }
}
