import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-master-key.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class MasterDeriveLabel extends StatelessWidget {
  const MasterDeriveLabel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext c) {
    return BlocListener<MasterDeriveWalletCubit, MasterDeriveWalletState>(
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
      child: BlocBuilder<MasterDeriveWalletCubit, MasterDeriveWalletState>(
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
                        c.read<MasterDeriveWalletCubit>().labelChanged(text);
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
                        final FocusScopeNode currentFocus =
                            FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        context.read<MasterDeriveWalletCubit>().nextClicked();
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
          );
        },
      ),
    );
  }
}
