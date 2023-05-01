import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Wallet/Balance.dart';
import 'package:sats/ui/component/Wallet/Info.dart';
import 'package:sats/ui/component/Wallet/Loader.dart';
import 'package:sats/ui/component/Wallet/TransactionList.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';
import 'package:sats/ui/component/common/SuccessHandler.dart';

class _Wallet extends StatelessWidget {
  const _Wallet();

  @override
  Widget build(BuildContext c) {
    final zeroBal = c.select((InfoCubit wc) => wc.state.zeroBalance());
    final showInfo = c.select((InfoCubit wc) => wc.state.showInfo);
    final isLoading = c.select((InfoCubit wc) => wc.state.loadingTransactions);
    final wallet = c.select((InfoCubit wc) => wc.state.wallet);

    return BlocListener<InfoCubit, InfoState>(
      listener: (c, s) {
        if (s.deleted) Navigator.pop(c);
        if (s.errorPPTest != emptyString) {
          handleError(c, s.errorPPTest);
        }
        if (s.ppTestPassed) {
          handleSuccess(c, 'Fingerprint Match!');
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          c.read<WalletsCubit>().clearSelectedWallet();
          return true;
        },
        child: Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                c.read<InfoCubit>().sqliteSyncHistory();
                return;
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const WalletLoader(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Back(
                          onPressed: () {
                            c.read<WalletsCubit>().clearSelectedWallet();
                            Navigator.of(c).pop();
                          },
                        ),
                        const Spacer(),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Balance(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  color: c.colours.primary,
                                  onPressed: () {
                                    c.read<InfoCubit>().toggleShowInfo();
                                  },
                                  icon: const Icon(Icons.info_outline),
                                ),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 100),
                                  opacity: isLoading ? 0.2 : 1.0,
                                  child: IconButton(
                                    iconSize: 28,
                                    color: isLoading
                                        ? c.colours.tertiary
                                        : c.colours.primary,
                                    onPressed: () {
                                      if (!isLoading)
                                        c.read<InfoCubit>().sqliteSyncHistory();
                                    },
                                    icon: const Icon(
                                      Icons.sync,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  color: c.colours.secondary,
                                  onPressed: () {
                                    c.push('/receive', extra: wallet);
                                  },
                                  icon: Icon(
                                    Icons.call_received,
                                    color: c.colours.secondary,
                                  ),
                                ),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: zeroBal ? 0.3 : 1,
                                  child: IconButton(
                                    color: c.colours.tertiary,
                                    onPressed: () {
                                      if (!zeroBal)
                                        c.push('/send', extra: wallet);
                                    },
                                    icon: Icon(
                                      wallet.walletType == 'WATCHER'
                                          ? Icons.build
                                          : Icons.send,
                                      color: c.colours.tertiary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    if (!showInfo) TransactionsList() else const WalletInfo()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key, required this.infoCubit});

  final InfoCubit infoCubit;

  @override
  Widget build(BuildContext c) {
    return BlocProvider.value(
      value: infoCubit,
      child: const _Wallet(),
    );
  }
}
