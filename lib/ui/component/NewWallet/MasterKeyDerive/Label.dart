import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-master-key.dart';
import 'package:sats/pkg/extensions.dart';

class MasterDeriveLabel extends StatelessWidget {
  const MasterDeriveLabel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext c) {
    return BlocBuilder<MasterDeriveWalletCubit, MasterDeriveWalletState>(
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
                    style:
                        c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
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
                if (state.walletLabelError != '')
                  Text(
                    state.walletLabelError,
                    style: c.fonts.caption!.copyWith(color: c.colours.error),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: c.colours.primary,
                      onPrimary: c.colours.background,
                    ),
                    onPressed: () async {
                      context.read<MasterDeriveWalletCubit>().nextClicked();
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
