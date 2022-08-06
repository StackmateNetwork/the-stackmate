import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/ui/component/Wallet/Balance.dart';
import 'package:sats/ui/component/Wallet/Info.dart';
import 'package:sats/ui/component/Wallet/Loader.dart';
import 'package:sats/ui/component/Wallet/TransactionList.dart';
import 'package:sats/ui/component/common/BackButton.dart';

class _Wallet extends StatelessWidget {
  const _Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final zeroBal = c.select((InfoCubit wc) => wc.state.zeroBalance());
    final showInfo = c.select((InfoCubit wc) => wc.state.showInfo);
    var isLoading = true;
    isLoading = c.select((InfoCubit wc) => wc.state.loadingTransactions);
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet);

    if (wallet == null) return Container();

    return BlocListener<InfoCubit, InfoState>(
      listener: (c, s) {
        if (s.deleted) Navigator.pop(c);
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
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 100),
                                  opacity: isLoading ? 0.2 : 1.0,
                                  child: IconButton(
                                    iconSize: 28,
                                    color: c.colours.error,
                                    onPressed: () {
                                      if (!isLoading)
                                        _deleteWalletClicked(
                                          c,
                                          zeroBal,
                                          wallet,
                                        );
                                    },
                                    icon: const Icon(
                                      Icons.delete_sweep_outlined,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  color: c.colours.primary,
                                  onPressed: () {
                                    c.read<InfoCubit>().toggleShowInfo();
                                  },
                                  icon: const Icon(Icons.info_outline),
                                ),
                                IconButton(
                                  color: c.colours.secondary,
                                  onPressed: () {
                                    c.push('/receive');
                                  },
                                  icon: Icon(
                                    Icons.call_received,
                                    color: c.colours.secondary,
                                  ),
                                ),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: zeroBal ? 0.4 : 1,
                                  child: IconButton(
                                    color: c.colours.tertiary,
                                    onPressed: () {
                                      if (!zeroBal) c.push('/send');
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

  void _deleteWalletClicked(
    BuildContext c,
    bool zeroBalance,
    Wallet wallet,
  ) async {
    if (!zeroBalance && wallet.isNotWatchOnly()) {
      await showCupertinoModalPopup<bool>(
        context: c,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(
            'Wallet is not empty'.toUpperCase(),
            style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
          ),
          message: Text(
            'Please send transfer all funds before deleting wallet.',
            style: c.fonts.subtitle2!.copyWith(color: c.colours.onBackground),
          ),
          actions: [
            Container(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                child: Text(
                  'Please sweep your funds'.toUpperCase(),
                  style: c.fonts.button!.copyWith(color: c.colours.error),
                ),
                onPressed: () async {
                  Navigator.pop(context, true);
                  await Future.delayed(const Duration(milliseconds: 200));
                  c.push('/send');
                },
              ),
            ),
            Container(
              color: c.colours.background,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'BACK',
                  style:
                      c.fonts.button!.copyWith(color: c.colours.onBackground),
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }

    final delete = await showCupertinoModalPopup<bool>(
      context: c,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            'Delete Wallet ?'.toUpperCase(),
            style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
          ),
        ),
        message: Text(
          'All wallet information will be deleted.',
          style: c.fonts.subtitle2!.copyWith(color: c.colours.onBackground),
        ),
        actions: [
          Container(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'DELETE IT!',
                style: c.fonts.button!.copyWith(color: c.colours.error),
              ),
            ),
          ),
          // const SizedBox(height: 24),
          Container(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              child: Text(
                'CANCEL',
                style: c.fonts.button!.copyWith(color: c.colours.onBackground),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          )
        ],
      ),
    );

    if (delete != null && delete) {
      await c.read<InfoCubit>().deleteClicked();
    }
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);
    final nodeAddress = context.select((NodeAddressCubit c) => c);
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final tor = context.select((TorCubit c) => c);

    final history = InfoCubit(
      wallets,
      locator<IStorage>(),
      logger,
      locator<ILauncher>(),
      locator<IShare>(),
      locator<IVibrate>(),
      nodeAddress,
      tor,
      networkSelect,
    );

    return BlocProvider.value(
      value: history,
      child: const _Wallet(),
    );
  }
}
