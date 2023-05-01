import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/NewWallet/SeedGenerate.dart';
import 'package:sats/ui/component/NewWallet/SeedGenerate/Label.dart';
import 'package:sats/ui/component/NewWallet/SeedGenerate/Stepper.dart';
import 'package:sats/ui/component/NewWallet/SeedGenerate/Warning.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _SeedGenerate extends StatefulWidget {
  @override
  _SeedGenerateState createState() => _SeedGenerateState();
}

class _SeedGenerateState extends State<_SeedGenerate> {
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
          context.pop();
          context.push('/home');
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
            body: SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Header(
                      cornerTitle: 'KEYGEN',
                      children: [
                        Back(
                          onPressed: () {
                            if (!state.canGoBack()) {
                              c.read<SeedGenerateWalletCubit>().backClicked();
                              return;
                            }

                            Navigator.pop(c);
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: GenerateWalletStepper(),
                    ),
                    FadeInLeft(
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
  const SeedGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);
    final masterKey = context.select((MasterKeyCubit c) => c);

    final seedGenerateCubit = SeedGenerateCubit(
      locator<IStackMateBitcoin>(),
      masterKey,
      networkSelect,
      logger,
      locator<ILauncher>(),
    );

    final seedGenerateWalletCubit = SeedGenerateWalletCubit(
      locator<IStackMateBitcoin>(),
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
      child: _SeedGenerate(),
    );
  }
}
