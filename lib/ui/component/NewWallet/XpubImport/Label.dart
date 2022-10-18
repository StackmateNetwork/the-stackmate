import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class XpubLabel extends StatelessWidget {
  const XpubLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocListener<XpubImportWalletCubit, XpubImportWalletState>(
      listener: (context, state) => {
        if (state.errSavingWallet != '')
          {
            handleError(
              context,
              state.errSavingWallet,
            )
          }
      },
      child: BlocBuilder<XpubImportWalletCubit, XpubImportWalletState>(
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
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: TextField(
                      onChanged: (text) {
                        c.read<XpubImportWalletCubit>().labelChanged(text);
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
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: c.colours.background,
                        primary: c.colours.primary,
                      ),
                      onPressed: () async {
                        c.read<XpubImportWalletCubit>().nextClicked();
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
