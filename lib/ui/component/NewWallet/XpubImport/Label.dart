import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class XpubLabel extends StatelessWidget {
  const XpubLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final savingWallet =
        c.select((XpubImportWalletCubit sgc) => sgc.state.savingWallet);
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
                style: c.fonts.headlineMedium!.copyWith(
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
                      color: c.colours.onPrimary,
                    ),
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
                    c.read<XpubImportWalletCubit>().nextClicked();
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
