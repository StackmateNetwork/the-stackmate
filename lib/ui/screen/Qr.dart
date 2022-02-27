import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';
import 'package:sats/ui/component/Qr/Actions.dart';
import 'package:sats/ui/component/Qr/SelectAccount.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showActions = context.select(
      (WalletsCubit wc) => wc.state.selectedWallet != null,
    );

    return WillPopScope(
      onWillPop: () async {
        context.read<WalletsCubit>().clearSelectedWallet();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Back(
                        onPressed: () {
                          context.read<WalletsCubit>().clearSelectedWallet();
                          Navigator.of(context).pop();
                        },
                      ),
                      LogButton(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.lightbulb_outline_sharp,
                            size: 32,
                            color: context.colours.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'select account'.toUpperCase(),
                    style: context.fonts.overline!.copyWith(
                      color: context.colours.onBackground,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SelectAccount(),
                const SizedBox(height: 40),
                if (showActions) ...[
                  Center(
                    child: Text(
                      'select action'.toUpperCase(),
                      style: context.fonts.overline!.copyWith(
                        color: context.colours.onBackground,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const AccountActions(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
