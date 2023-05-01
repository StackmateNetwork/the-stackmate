import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/derivation.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class DeriveLabel extends StatelessWidget {
  const DeriveLabel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext c) {
    final savingWallet =
        c.select((DeriveWalletCubit sgc) => sgc.state.savingWallet);
    return BlocListener<DeriveWalletCubit, DeriveWalletState>(
      listener: (context, state) => {
        if (state.walletLabelError != '')
          {
            handleError(
              context,
              state.walletLabelError,
            )
          }
        else if (state.errSavingWallet != '')
          {
            handleError(
              context,
              state.errSavingWallet,
            )
          }
      },
      child: IgnorePointer(
        ignoring: savingWallet,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: savingWallet ? 0.5 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'Label your wallet',
                style: c.fonts.headline4!.copyWith(
                  color: c.colours.onPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.zero,
                child: TextField(
                  style:
                      c.fonts.titleLarge!.copyWith(color: c.colours.onPrimary),
                  onChanged: (text) {
                    c.read<DeriveWalletCubit>().labelChanged(text);
                  },
                  decoration: InputDecoration(
                    labelText: 'Wallet Name',
                    labelStyle: TextStyle(color: c.colours.onPrimary),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: c.colours.background,
                    backgroundColor: c.colours.primary,
                  ),
                  onPressed: () async {
                    final FocusScopeNode currentFocus = FocusScope.of(c);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    c.read<DeriveWalletCubit>().nextClicked();
                    // if (state.walletLabelError != '') {
                    //   handleError(
                    //     context,
                    //     state.walletLabelError,
                    //   );
                    // }
                    // if (state.errSavingWallet != '') {
                    //   handleError(
                    //     context,
                    //     state.errSavingWallet,
                    //   );
                    // }
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
