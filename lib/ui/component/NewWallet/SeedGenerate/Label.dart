import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
                  primary: c.colours.primary,
                  onPrimary: c.colours.background,
                ),
                onPressed: () async {
                  final FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  c.read<SeedGenerateWalletCubit>().nextClicked();
                  if (state.walletLabelError != '') {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: state.walletLabelError,
                        message: 'Please input minimum 4 letters',
                        contentType: ContentType.warning,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
