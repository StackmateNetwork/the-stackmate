import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
                decoration: InputDecoration(
                  labelText: 'Wallet Name',
                  labelStyle: TextStyle(
                    color: context.colours.onPrimary,
                  ),
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
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: c.colours.background,
                  primary: c.colours.primary,
                ),
                onPressed: () async {
                  final FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  c.read<SeedGenerateWalletCubit>().nextClicked();
                  if (state.walletLabelError != '') {
                    showTopSnackBar(
                      context,
                      const CustomSnackBar.error(
                        message: 'Error Enter a valid name',
                      ),
                    );
                  }
                },
                child: Text('Confirm'.toUpperCase()),
              ),
            ),
          ],
        );
      },
    );
  }
}
