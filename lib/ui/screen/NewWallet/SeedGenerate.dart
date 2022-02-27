import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/navigation.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/core.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/StepLine.dart';
import 'package:sats/ui/component/NewWallet/SeedGenerate.dart';

class GenerateWalletStepper extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        // final stepLabel = state.currentStepLabel();
        final steps = SeedGenerateWalletSteps.values.length;
        final idx = state.currentStep.index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const SizedBox(height: 24),
            StepLine(length: steps, idx: idx),
            const SizedBox(height: 24),
            // Text(
            //   stepLabel.toUpperCase(),
            //   style: c.fonts.headline6!.copyWith(color: Colors.white),
            // ),
            // const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class SeedGenerateWarning extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          'Security\nInformation'.toUpperCase(),
          style: c.fonts.headline5!.copyWith(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '''
Write down your seed phrase on a piece of paper
and store in a safe place.

Don’t risk losing your funds. protect your wallet
by saving your Seed Phrase in a place you trust.

It’s the only way to recover your wallet if you are 
locked out of the app or get a new device.

For maximum security, you will be forced to turn off
all networking for your device during this process.
      ''',
          style: c.fonts.caption!.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: () {
            c.read<SeedGenerateWalletCubit>().nextClicked();
          },
          child: Text(
            'I Understand'.toUpperCase().notLocalised(),
          ),
        ),
      ],
    );
  }
}

class SeedGenerateLabel extends StatelessWidget {
  const SeedGenerateLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      buildWhen: (previous, current) =>
          previous.walletLabelError != current.walletLabelError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              'Name your wallet',
              style: c.fonts.headline4!.copyWith(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
            // const HeaderTextDark(text: 'Name your wallet'),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                onChanged: (text) {
                  c.read<SeedGenerateWalletCubit>().labelChanged(text);
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Wallet Name',
                  labelStyle: TextStyle(color: Colors.transparent),
                ),
              ),
            ),
            const SizedBox(height: 40),
            if (state.walletLabelError != '')
              Text(
                state.walletLabelError,
                style: c.fonts.caption!.copyWith(color: c.colours.error),
              ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  c.read<SeedGenerateWalletCubit>().nextClicked();
                },
                child: Text('Confirm'.toUpperCase()),
              ),
            )
          ],
        );
      },
    );
  }
}

class SeedGenerate extends StatefulWidget {
  @override
  _SeedGenerateState createState() => _SeedGenerateState();
}

class _SeedGenerateState extends State<SeedGenerate> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocConsumer<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      listenWhen: (previous, current) =>
          previous.currentStep != current.currentStep ||
          previous.newWalletSaved != current.newWalletSaved,
      listener: (context, state) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceIn,
        );

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
              c.read<SeedGenerateWalletCubit>().backClicked();
              return false;
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: c.colours.secondary,
            body: SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Back(
                        // text: 'EXIT',
                        onPressed: () {
                          if (!state.canGoBack()) {
                            c.read<SeedGenerateWalletCubit>().backClicked();
                            return;
                          }

                          Navigator.pop(c);
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: GenerateWalletStepper(),
                    ),
                    FadeInLeft(
                      // key: Key(state.currentStepLabel()),
                      child: Container(
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
                            case SeedGenerateWalletSteps.warning:
                              return SeedGenerateWarning();
                            case SeedGenerateWalletSteps.generate:
                              return const SeedGenerateStepSelect();
                            case SeedGenerateWalletSteps.label:
                              return const SeedGenerateLabel();
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

class SeedGenerateScreen extends StatelessWidget {
  const SeedGenerateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final logger = context.select((LoggerCubit c) => c);
    final wallets = context.select((WalletsCubit c) => c);

    final seedGenerateCubit = SeedGenerateCubit(
      locator<IStackMateCore>(),
      networkSelect,
      logger,
    );

    final seedGenerateWalletCubit = SeedGenerateWalletCubit(
      locator<IStackMateCore>(),
      locator<IStorage>(),
      logger,
      wallets,
      networkSelect,
      seedGenerateCubit,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: seedGenerateCubit),
        BlocProvider.value(value: seedGenerateWalletCubit),
      ],
      child: SeedGenerate(),
    );
  }
}
