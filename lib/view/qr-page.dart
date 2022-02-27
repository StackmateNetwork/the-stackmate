import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/navigation.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/view/common/back-button.dart';
import 'package:sats/view/common/log-button.dart';
import 'package:sats/view/home-page.dart';

class AccountsRowSelection extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final state = c.select((WalletsCubit w) => w.state);    
    final wallets = state.wallets;
    final selected = state.selectedWallet;

    if (wallets.isEmpty)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 66),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'No\nwallets\nadded',
              style: c.fonts.caption!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
          ),
        ],
      );
    return Container(
      width: c.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            for (var w in wallets)
              AnimatedOpacity(
                opacity: (selected != null && selected == w) ? 1.0 : 0.4,
                duration: const Duration(milliseconds: 300),
                child: WalletCard(wallet: w, isSelection: true),
              ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final selected = c.select((WalletsCubit w) => w.state.selectedWallet);

    return Opacity(
      opacity: selected != null ? 1.0 : 0.5,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              if (selected != null)
                Navigator.pushNamed(
                  c,
                  Routes.receive,
                  // arguments: state.wallet!,
                );
            },
            child: Text('receive'.toUpperCase()),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              if (selected != null)
                Navigator.pushNamed(
                  c,
                  Routes.sendFromQR,
                  // arguments: state.wallet!,
                );
            },
            child: Text('send'.toUpperCase()),
          ),
        ],
      ),
    );
  }
}

class QRPage extends StatelessWidget {
  const QRPage({Key? key}) : super(key: key);

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
                AccountsRowSelection(),
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
                  const Buttons(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
