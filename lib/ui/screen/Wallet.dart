import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallet/wallet.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Wallet/Balance.dart';
import 'package:sats/ui/component/Wallet/Info.dart';
import 'package:sats/ui/component/Wallet/Loader.dart';
import 'package:sats/ui/component/Wallet/Name.dart';
import 'package:sats/ui/component/Wallet/TransactionList.dart';

class _Wallett extends StatelessWidget {
  const _Wallett({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final zeroBal = c.select((WalletCubit wc) => wc.state.zeroBalance());
    final showInfo = c.select((WalletCubit wc) => wc.state.showInfo);
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet);

    if (wallet == null) return Container();

    return BlocListener<WalletCubit, WalletState>(
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
                c.read<WalletCubit>().getHistory();
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
                    const SizedBox(height: 16),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 8),
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
                    // const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              WalletName(),
                              SizedBox(height: 24),
                              Balance(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Opacity(
                                  opacity: 0.4,
                                  child: IconButton(
                                    iconSize: 28,
                                    // alignment: Alignment.centerRight,
                                    color: c.colours.error,
                                    onPressed: () {
                                      _deleteWalletClicked(c, zeroBal, wallet);
                                    },
                                    icon: const Icon(Icons.delete_sweep_outlined),
                                  ),
                                ),
                                // const SizedBox(height: 24),
                                IconButton(
                                  // alignment: Alignment.centerRight,
                                  color: c.colours.primary,
                                  onPressed: () {
                                    c.read<WalletCubit>().toggleShowInfo();
                                  },
                                  icon: const Icon(Icons.info_outline),
                                ),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: (zeroBal || !wallet.isNotWatchOnly()) ? 0.4 : 1,
                                  child: IconButton(
                                    // alignment: Alignment.centerRight,
                                    color: c.colours.primary,
                                    onPressed: () {
                                      if (!zeroBal && wallet.isNotWatchOnly()) c.push('/send');
                                    },
                                    icon: const Icon(
                                      Icons.call_missed_outgoing_outlined,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  // alignment: Alignment.centerRight,
                                  color: c.colours.primary,
                                  onPressed: () {
                                    c.push('/receive');
                                  },
                                  icon: const Icon(Icons.call_received),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    if (!showInfo)
                      // const SizedBox(height: 48),
                      TransactionsList()
                    else
                      const WalletInfo()
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
        // barrierColor: c.colours.background,

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
                  'SEND',
                  style: c.fonts.button!.copyWith(color: c.colours.onBackground),
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
                // isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  'BACK',
                  style: c.fonts.button!.copyWith(color: c.colours.onBackground),
                ),
              ),
            ),

            // const SizedBox(height: 24),
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
              child: const Text('Yes, Delete'),
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
      c.read<WalletCubit>().deleteClicked();
    }
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = context.select((LoggerCubit c) => c);
    final wallets = context.select((WalletsCubit c) => c);
    final nodeAddress = context.select((NodeAddressCubit c) => c);
    final networkSelect = context.select((ChainSelectCubit c) => c);

    final history = WalletCubit(
      wallets,
      locator<IStorage>(),
      logger,
      locator<ILauncher>(),
      locator<IShare>(),
      locator<IVibrate>(),
      nodeAddress,
      networkSelect,
    );

    return BlocProvider.value(
      value: history,
      child: const _Wallett(),
    );
  }
}
