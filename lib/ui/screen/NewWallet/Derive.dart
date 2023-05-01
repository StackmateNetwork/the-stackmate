import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/derivation.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/NewWallet/Derive.dart';
import 'package:sats/ui/component/NewWallet/Derive/Label.dart';
import 'package:sats/ui/component/NewWallet/Derive/Loader.dart';
import 'package:sats/ui/component/NewWallet/Derive/Passphrase.dart';
import 'package:sats/ui/component/NewWallet/Derive/Stepper.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _Derive extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocConsumer<DeriveWalletCubit, DeriveWalletState>(
      listenWhen: (previous, current) =>
          previous.currentStep != current.currentStep ||
          previous.newWalletSaved != current.newWalletSaved,
      listener: (context, state) {
        if (state.newWalletSaved) {
          context.go('/home');
        }
      },
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DeriveLoader(),
                    const SizedBox(height: 24),
                    Header(
                      cornerTitle: 'DERIVE',
                      children: [
                        Back(
                          onPressed: () {
                            Navigator.pop(c);
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: DeriveStepper(),
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
                          case DeriveWalletStep.purpose:
                            return const DeriveSteps();
                          case DeriveWalletStep.passphrase:
                            return DerivePassphrase();
                          case DeriveWalletStep.label:
                            return const DeriveLabel();
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

class DeriveScreen extends StatelessWidget {
  const DeriveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final nodeSelect = context.select((NodeAddressCubit c) => c);
    final tor = context.select((TorCubit c) => c);

    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);
    final masterKey = context.select((MasterKeyCubit c) => c);

    final deriveMasterCubit = DeriveWalletCubit(
      locator<IStackMateBitcoin>(),
      logger,
      locator<IStorage>(),
      wallets,
      networkSelect,
      nodeSelect,
      tor,
      masterKey,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: deriveMasterCubit),
      ],
      child: _Derive(),
    );
  }
}
