import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/new-wallet/inheritance-with-new-seed.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';
import 'package:sats/ui/component/NewWallet/NewSeedInheritance/Info.dart';
import 'package:sats/ui/component/NewWallet/NewSeedInheritance/Label.dart';
import 'package:sats/ui/component/NewWallet/NewSeedInheritance/Share.dart';
import 'package:sats/ui/component/NewWallet/NewSeedInheritance/Stepper.dart';
import 'package:sats/ui/component/NewWallet/NewSeedInheritance/Timer.dart';
import 'package:sats/ui/component/NewWallet/SeedGenerate.dart';
import 'package:sats/ui/component/NewWallet/XpubImport.dart';

class _InheritanceNewSeed extends StatefulWidget {
  const _InheritanceNewSeed({Key? key}) : super(key: key);

  @override
  State<_InheritanceNewSeed> createState() => _InheritanceNewSeedState();
}

class _InheritanceNewSeedState extends State<_InheritanceNewSeed> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocConsumer<InteritanceWithNewSeedCubit, InheritanceWithNewSeedState>(
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
          context.go('/');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    // elevation: 2,
                    floating: true,
                    snap: true,
                    forceElevated: innerBoxIsScrolled,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      systemNavigationBarColor: c.colours.onBackground,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    // leading: const Back(),
                    leadingWidth: 100,
                    toolbarHeight: 64,
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Back(),
                    ),

                    actions: [
                      LogButton(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.lightbulb_outline_sharp,
                            size: 32,
                            // color: Colors.blue[400],
                            color: c.colours.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ];
              },
              body: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const Inheritance2Stepper(),
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
                          case InteritanceWithNewSeedWalletSteps.info:
                            return Inheritance2WalletInfo();
                          case InteritanceWithNewSeedWalletSteps.settings:
                            return const Timer2Settings();
                          case InteritanceWithNewSeedWalletSteps.seed:
                            return const SeedGenerateStepSelect();
                          case InteritanceWithNewSeedWalletSteps.import:
                            return const XpubFieldsImport();
                          case InteritanceWithNewSeedWalletSteps.label:
                            return const Inheritance2WalletLabel();
                          case InteritanceWithNewSeedWalletSteps.share:
                            return const Share2Details();
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

class InheritanceNewSeedScreen extends StatelessWidget {
  const InheritanceNewSeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);
    final nodeAddress = context.select((NodeAddressCubit c) => c);

    final seedGenerateCubit = SeedGenerateCubit(
      locator<IStackMateCore>(),
      networkSelect,
      logger,
    );

    final xpubCub = XpubImportCubit(
      logger,
      locator<IClipBoard>(),
    );

    final inheritance = InteritanceWithNewSeedCubit(
      locator<IStackMateCore>(),
      locator<IStorage>(),
      logger,
      wallets,
      networkSelect,
      seedGenerateCubit,
      xpubCub,
      nodeAddress,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: seedGenerateCubit),
        BlocProvider.value(value: xpubCub),
        BlocProvider.value(value: inheritance),
      ],
      child: const _InheritanceNewSeed(),
    );
  }
}
