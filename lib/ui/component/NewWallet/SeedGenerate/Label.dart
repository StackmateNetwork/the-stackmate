import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class SeedGenerateLabel extends StatelessWidget {
  const SeedGenerateLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final savingWallet =
        c.select((SeedGenerateWalletCubit sgc) => sgc.state.savingWallet);
    return BlocListener<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      listener: (context, state) => {
        if (state.walletLabelError != '')
          {
            handleError(
              context,
              state.walletLabelError,
            )
          }
        else if (state.savingWalletError != '')
          {
            handleError(
              context,
              state.savingWalletError,
            )
          }
      },
      child: IgnorePointer(
        ignoring: savingWallet,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: savingWallet ? 0.1 : 1,
          child: Column(
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
                      color: c.colours.onPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const SizedBox(height: 24),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: c.colours.background,
                    primary: c.colours.primary,
                  ),
                  onPressed: () async {
                    final FocusScopeNode currentFocus = FocusScope.of(c);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    await c.read<SeedGenerateCubit>().finalize();
                    c.read<SeedGenerateWalletCubit>().nextClicked();
                  },
                  child: Text('Confirm'.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
