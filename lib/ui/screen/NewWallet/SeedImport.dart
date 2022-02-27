import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/routes.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/core.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/ui/component/Common/StepLine.dart';
import 'package:sats/ui/component/NewWallet/SeedImport.dart';
import 'package:sats/ui/component/common/header.dart';

import '../../component/Common/BackButton2.dart';

class NewImportStepper extends StatelessWidget {
  const NewImportStepper();
  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedImportWalletCubit, SeedImportWalletState>(
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        final steps = SeedImportWalletSteps.values.length;
        final idx = state.currentStep.index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StepLine(length: steps, idx: idx),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class SeedImportWarning extends StatelessWidget {
  const SeedImportWarning();
  @override
  Widget build(BuildContext c) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Security\nInformation'.toUpperCase(),
            style: c.fonts.headline5!.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
              ''',
            style: c.fonts.caption!.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              c.read<SeedImportWalletCubit>().nextClicked();
            },
            child: Text('I Understand'.toUpperCase()),
          )
        ],
      ),
    );
  }
}

class SeedImportLabel extends StatefulWidget {
  const SeedImportLabel({Key? key}) : super(key: key);

  @override
  State<SeedImportLabel> createState() => _SeedImportLabelState();
}

class _SeedImportLabelState extends State<SeedImportLabel> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedImportWalletCubit, SeedImportWalletState>(
      buildWhen: (previous, current) =>
          previous.walletLabelError != current.walletLabelError,
      builder: (context, state) {
        if (state.walletLabel != _controller!.text)
          _controller!.text = state.walletLabel;

        final isFixed = state.labelFixed;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              isFixed ? 'Label' : 'Label your wallet',
              style: c.fonts.headline4!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.zero,
              child: IgnorePointer(
                ignoring: isFixed,
                child: TextField(
                  controller: _controller,
                  onChanged: (text) {
                    if (!isFixed)
                      c.read<SeedImportWalletCubit>().labelChanged(text);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Wallet Name',
                    labelStyle: TextStyle(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            if (state.walletLabelError != '')
              Text(
                state.walletLabelError,
                style: c.fonts.caption!.copyWith(color: c.colours.error),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  c.read<SeedImportWalletCubit>().nextClicked();
                },
                child: const Text('Confirm'),
              ),
            )
          ],
        );
      },
    );
  }
}

class SeedImport extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocConsumer<SeedImportWalletCubit, SeedImportWalletState>(
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
              c.read<SeedImportWalletCubit>().backClicked();
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
                      cornerTitle: 'IMPORT SEED',
                      children: [
                        BckButton(
                          text: 'EXIT',
                          onTapped: () {
                            if (!state.canGoBack()) {
                              c.read<SeedImportWalletCubit>().backClicked();
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
                      child: NewImportStepper(),
                    ),
                    FadeInLeft(
                      key: Key(state.currentStepLabel()),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 24,
                        ),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: c.colours.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: () {
                          switch (state.currentStep) {
                            case SeedImportWalletSteps.warning:
                              return const SeedImportWarning();

                            case SeedImportWalletSteps.import:
                              return const SeedImportSteps();

                            case SeedImportWalletSteps.label:
                              return const SeedImportLabel();
                          }
                        }(),
                      ),
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

class SeedImportScreen extends StatelessWidget {
  const SeedImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = context.select((LoggerCubit c) => c);
    final wallets = context.select((WalletsCubit c) => c);
    final networkSelect = context.select((ChainSelectCubit c) => c);

    final importCubit = SeedImportCubit(
      logger,
      networkSelect,
      locator<IStackMateCore>(),
    );

    final seedImportCubit = SeedImportWalletCubit(
      locator<IStackMateCore>(),
      locator<IStorage>(),
      wallets,
      networkSelect,
      logger,
      importCubit,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: importCubit),
        BlocProvider.value(value: seedImportCubit),
      ],
      child: SeedImport(),
    );
  }
}
