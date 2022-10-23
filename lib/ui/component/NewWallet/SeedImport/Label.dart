import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class SeedImportLabel extends StatelessWidget {
  const SeedImportLabel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext c) {
    return BlocListener<SeedImportWalletCubit, SeedImportWalletState>(
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
      child: BlocBuilder<SeedImportWalletCubit, SeedImportWalletState>(
        builder: (context, state) {
          return IgnorePointer(
            ignoring: state.savingWallet,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: state.savingWallet ? 0.5 : 1,
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
                      style: c.fonts.headline6!
                          .copyWith(color: c.colours.onPrimary),
                      onChanged: (text) {
                        c.read<SeedImportWalletCubit>().labelChanged(text);
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
                        onPrimary: c.colours.background,
                        primary: c.colours.primary,
                      ),
                      onPressed: () async {
                        context.read<SeedImportWalletCubit>().nextClicked();
                      },
                      child: const Text('Confirm'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
