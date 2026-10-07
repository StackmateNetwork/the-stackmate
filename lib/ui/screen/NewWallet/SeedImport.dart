import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/NewWallet/SeedImport.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Label.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Loader.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Stepper.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Warning.dart';

class _SeedImport extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final tor = c.select((TorCubit t) => t.state);
    return BlocConsumer<SeedImportWalletCubit, SeedImportWalletState>(
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
          onPopInvokedWithResult: (didPop, _) async {
            if (!state.canGoBack()) {
              c.read<SeedImportWalletCubit>().backClicked();
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
                    icon: Icon(Icons.security_sharp, color: c.colours.error),
                  ),
                ],
              ],
              title: const Text('Import wallet'),
              leading: Builder(
                builder: (BuildContext context) {
                  return BackButton(
                    onPressed: () {
                      if (!state.canGoBack()) {
                        c.read<SeedImportWalletCubit>().backClicked();
                        return;
                      }
                      context.pop();
                    },
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Loader(),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: NewImportStepper(),
                  ),
                  FadeInLeft(
                    key: Key(state.currentStepLabel()),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      // padding: const EdgeInsets.all(16),
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SeedImportScreen extends StatefulWidget {
  const SeedImportScreen({super.key});

  @override
  State<SeedImportScreen> createState() => _SeedImportScreenState();
}

class _SeedImportScreenState extends State<SeedImportScreen> {
  // Created once: rebuilding must not reset the words being entered.
  late final SeedImportCubit _importCubit;
  late final SeedImportWalletCubit _walletCubit;

  @override
  void initState() {
    super.initState();
    final logger = context.read<Logger>();
    final networkSelect = context.read<ChainSelectCubit>();
    final masterKey = context.read<MasterKeyCubit>();
    _importCubit = SeedImportCubit(
      logger,
      masterKey,
      networkSelect,
      locator<IStackMateBitcoin>(),
      locator<IClipBoard>(),
    );
    _walletCubit = SeedImportWalletCubit(
      locator<IStackMateBitcoin>(),
      logger,
      locator<IStorage>(),
      context.read<WalletsCubit>(),
      networkSelect,
      context.read<NodeAddressCubit>(),
      context.read<TorCubit>(),
      _importCubit,
      masterKey,
    );
  }

  @override
  void dispose() {
    _walletCubit.close();
    _importCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _importCubit),
        BlocProvider.value(value: _walletCubit),
      ],
      child: _SeedImport(),
    );
  }
}
