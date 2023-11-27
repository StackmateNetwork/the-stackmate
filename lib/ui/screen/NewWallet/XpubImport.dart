import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/NewWallet/XpubImport.dart';
import 'package:sats/ui/component/NewWallet/XpubImport/Label.dart';
import 'package:sats/ui/component/NewWallet/XpubImport/Loader.dart';
import 'package:sats/ui/component/NewWallet/XpubImport/Stepper.dart';

class _XpubImport extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final tor = c.select((TorCubit t) => t.state);
    return BlocConsumer<XpubImportWalletCubit, XpubImportWalletState>(
      listenWhen: (previous, current) =>
          previous.currentStep != current.currentStep ||
          previous.newWalletSaved != current.newWalletSaved,
      listener: (context, state) {
        if (state.newWalletSaved) {
          context.pop();
          context.push('/home');
        }
      },
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        return PopScope(
          onPopInvoked: (_) async {
            if (!state.canGoBack()) {
              c.read<XpubImportWalletCubit>().backClicked();
              return;
            }

            return;
          },
          child: Scaffold(
            appBar: AppBar(
              actions: [
                if (tor.isConnected) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Tooltip(
                      preferBelow: false,
                      triggerMode: TooltipTriggerMode.tap,
                      message: (tor.isRunning)
                          ? 'Torified Natively.'
                          : 'Torified via External.',
                      textStyle: c.fonts.bodySmall!.copyWith(
                        color: c.colours.primary,
                      ),
                      decoration: BoxDecoration(
                        color: c.colours.surface,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Icon(
                        Icons.security_sharp,
                        color: c.colours.tertiaryContainer,
                      ),
                    ),
                  ),
                ] else ...[
                  IconButton(
                    color: c.colours.error,
                    onPressed: () {
                      c.push('/tor-config');
                    },
                    icon: Icon(
                      Icons.security_sharp,
                      color: c.colours.error,
                    ),
                  ),
                ],
              ],
              title: const Text('Watcher wallet'),
              leading: Builder(
                builder: (BuildContext context) {
                  return BackButton(
                    onPressed: () {
                      if (!state.canGoBack()) {
                        c.read<XpubImportWalletCubit>().backClicked();
                        return;
                      }
                      context.pop();
                    },
                  );
                },
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Loader(),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: XPubImportStepper(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: c.colours.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: () {
                        switch (state.currentStep) {
                          case XpubImportWalletStep.import:
                            return const XpubFieldsImport();

                          case XpubImportWalletStep.label:
                            return const XpubLabel();
                        }
                      }(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class XPubImportScreen extends StatelessWidget {
  const XPubImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final nodeSelect = context.select((NodeAddressCubit c) => c);
    final tor = context.select((TorCubit c) => c);

    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);

    final xpubCub = XpubImportCubit(
      logger,
      locator<IClipBoard>(),
    );
    final xpubCubit = XpubImportWalletCubit(
      locator<IStackMateBitcoin>(),
      logger,
      locator<IStorage>(),
      wallets,
      networkSelect,
      nodeSelect,
      tor,
      xpubCub,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: xpubCub),
        BlocProvider.value(value: xpubCubit),
      ],
      child: _XpubImport(),
    );
  }
}
