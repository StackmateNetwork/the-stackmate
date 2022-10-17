import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/seed-backup.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/ui/component/BackupWallet/Complete.dart';
import 'package:sats/ui/component/BackupWallet/Stepper.dart';
import 'package:sats/ui/component/BackupWallet/Warning.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _BackupWallet extends StatefulWidget {
  @override
  _BackupWalletState createState() => _BackupWalletState();
}

class _BackupWalletState extends State<_BackupWallet> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocConsumer<SeedBackupCubit, SeedBackupState>(
      listenWhen: (previous, current) =>
          previous.currentStep != current.currentStep ||
          previous.backupComplete != current.backupComplete,
      listener: (context, state) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceIn,
        );

        if (state.backupComplete) {
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
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Header(
                      cornerTitle: 'BACKUP',
                      children: [
                        Back(
                          onPressed: () {
                            if (state.canGoBack()) {
                              c.read<SeedBackupCubit>().backClicked();
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
                      child: BackupWalletStepper(),
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
                            case SeedBackupSteps.warning:
                              c.read<SeedBackupCubit>().init();
                              return SeedBackupWarning();
                            case SeedBackupSteps.display:
                              return SeedBackup();
                            case SeedBackupSteps.quiz:
                              return SeedConfirm();
                            case SeedBackupSteps.passphrase:
                              return SeedBackupPassphrase();
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

class BackupWalletScreen extends StatelessWidget {
  const BackupWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final masterKey = context.select((MasterKeyCubit c) => c);

    final seedBackupCubit = SeedBackupCubit(
      masterKey,
      locator<ILauncher>(),
    );

    return BlocProvider.value(
      value: seedBackupCubit,
      child: _BackupWallet(),
    );
  }
}
