import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sats/cubit/new-wallet/inheritance-with-old-seed.dart';
import 'package:sats/navigation.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';
import 'package:sats/ui/component/Common/StepLine.dart';
import 'package:sats/ui/component/NewWallet/SeedImport.dart';
import 'package:sats/ui/component/NewWallet/XpubImport.dart';
import 'package:sats/ui/component/common/loading.dart';

class InheritanceStepper extends StatelessWidget {
  const InheritanceStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<InheritanceWithOldSeedCubit,
        InheritanceWithOldSeedState>(
      builder: (context, state) {
        // final stepLabel = state.currentStepLabel();
        final steps = InteritanceWithOldSeedWalletSteps.values.length;
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

class InheritanceWalletInfo extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          'STEPS'.toUpperCase(),
          style: c.fonts.headline5!.copyWith(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

      ''',
          style: c.fonts.caption!.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: () {
            c.read<InheritanceWithOldSeedCubit>().nextClicked();
          },
          child: Text(
            'I Understand'.toUpperCase().notLocalised(),
          ),
        ),
      ],
    );
  }
}

class TimerSettings extends StatelessWidget {
  const TimerSettings({Key? key}) : super(key: key);

  void _selectDate(BuildContext c, {DateTime? date}) async {
    final dt = await showDatePicker(
      context: c,
      initialDate: date ?? DateTime(2022),
      firstDate: DateTime(2022),
      lastDate: DateTime(3000),
    );

    if (dt != null && dt != date) {
      c.read<InheritanceWithOldSeedCubit>().dateSelected(dt);
    }
  }

  @override
  Widget build(BuildContext c) {
    final date = c.select((InheritanceWithOldSeedCubit itc) => itc.state.date);
    final err =
        c.select((InheritanceWithOldSeedCubit itc) => itc.state.errDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        if (date == null)
          Text(
            '   No Date Selected',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          )
        else
          Text(
            '   ' + date.toString(),
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              _selectDate(c, date: date);
            },
            child: Text(
              'Select Inheritance Unlock Date'.toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 80),
        if (err != '') ...[
          Text(
            err,
            style: c.fonts.caption!.copyWith(
              color: c.colours.error,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextButton(
          onPressed: () {
            c.read<InheritanceWithOldSeedCubit>().nextClicked();
          },
          child: const Text(
            'Confirm',
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class InheritanceWalletLabel extends StatelessWidget {
  const InheritanceWalletLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<InheritanceWithOldSeedCubit,
        InheritanceWithOldSeedState>(
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
                    c.read<InheritanceWithOldSeedCubit>().labelChanged(text);
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
                      c.read<InheritanceWithOldSeedCubit>().nextClicked();
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

class ShareDetails extends StatelessWidget {
  const ShareDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class InheritanceOldSeedPage extends StatefulWidget {
  const InheritanceOldSeedPage({Key? key}) : super(key: key);

  @override
  State<InheritanceOldSeedPage> createState() => _InheritanceOldSeedPageState();
}

class _InheritanceOldSeedPageState extends State<InheritanceOldSeedPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocConsumer<InheritanceWithOldSeedCubit,
        InheritanceWithOldSeedState>(
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
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
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
                    const InheritanceStepper(),
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
                          case InteritanceWithOldSeedWalletSteps.info:
                            return InheritanceWalletInfo();
                          case InteritanceWithOldSeedWalletSteps.settings:
                            return const TimerSettings();
                          case InteritanceWithOldSeedWalletSteps.seedimport:
                            return const SeedImportSteps();
                          case InteritanceWithOldSeedWalletSteps.import:
                            return const XpubFieldsImport();
                          case InteritanceWithOldSeedWalletSteps.label:
                            return const InheritanceWalletLabel();
                          case InteritanceWithOldSeedWalletSteps.share:
                            return const ShareDetails();
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
