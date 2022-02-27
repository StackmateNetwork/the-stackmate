import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/routes.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/clipboard.dart';
import 'package:sats/pkg/core.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/ui/component/Common/BackButton2.dart';
import 'package:sats/ui/component/Common/StepLine.dart';
import 'package:sats/ui/component/NewWallet/XpubImport.dart';
import 'package:sats/ui/component/common/header.dart';
import 'package:sats/ui/component/common/loading.dart';

class XPubImportStepper extends StatelessWidget {
  const XPubImportStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<XpubImportWalletCubit, XpubImportWalletState>(
      builder: (context, state) {
        // final stepLabel = state.currentStepLabel();
        final steps = XpubImportWalletStep.values.length;
        final idx = state.currentStep.index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(
            //   stepLabel,
            //   style: c.fonts.headline6!.copyWith(color: Colors.white),
            // ),
            // const SizedBox(height: 24),
            StepLine(length: steps, idx: idx),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class XpubLabel extends StatelessWidget {
  const XpubLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<XpubImportWalletCubit, XpubImportWalletState>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state.savingWallet,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'Label your wallet',
                style: c.fonts.headline4!.copyWith(
                  color: Colors.white,
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
                  decoration: const InputDecoration(
                    labelText: 'Wallet Name',
                    labelStyle: TextStyle(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              if (state.errSavingWallet != '')
                Text(
                  state.errSavingWallet,
                  style: c.fonts.caption!.copyWith(color: c.colours.error),
                ),
              if (!state.savingWallet)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      c.read<XpubImportWalletCubit>().nextClicked();
                    },
                    child: const Text('Confirm'),
                  ),
                )
              else
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Loading(text: 'Saving Wallet'),
                )
            ],
          ),
        );
      },
    );
  }
}

class XpubImport extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocConsumer<XpubImportWalletCubit, XpubImportWalletState>(
      listenWhen: (previous, current) =>
          previous.currentStep != current.currentStep ||
          previous.newWalletSaved != current.newWalletSaved,
      listener: (context, state) {
        if (state.newWalletSaved) {
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (!state.canGoBack()) {
              c.read<XpubImportWalletCubit>().backClicked();
              return false;
            }

            return true;
          },
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Header(
                      cornerTitle: 'IMPORT XPUB',
                      children: [
                        BckButton(
                          text: 'EXIT',
                          onTapped: () {
                            if (!state.canGoBack()) {
                              c.read<XpubImportWalletCubit>().backClicked();
                              return;
                            }

                            Navigator.pop(c);
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
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
                    )
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
  const XPubImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final logger = context.select((LoggerCubit c) => c);
    final wallets = context.select((WalletsCubit c) => c);

    final xpubCub = XpubImportCubit(
      logger,
      locator<IClipBoard>(),
    );
    final xpubCubit = XpubImportWalletCubit(
      locator<IStackMateCore>(),
      logger,
      locator<IStorage>(),
      wallets,
      networkSelect,
      xpubCub,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: xpubCub),
        BlocProvider.value(value: xpubCubit),
      ],
      child: XpubImport(),
    );
  }
}
