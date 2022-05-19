import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/api/interface/coincap.dart';
import 'package:sats/cubit/calculator.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/ui/component/Calculator/Keyboard.dart';
import 'package:sats/ui/component/Calculator/Rates.dart';
import 'package:sats/ui/component/Home/Actions.dart';
import 'package:sats/ui/component/common/loading.dart';

class _Calc extends StatelessWidget {
  const _Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select(
      (CalculatorCubit c) => c.state.loadingRates,
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (loading)
              const Loading(
                text: 'Fetching Rates',
              ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Rates(),
            ),
            const Spacer(flex: 4),
            if (!loading)
              FadeInUp(
                delay: const Duration(milliseconds: 1000),
                child: const Keyboard(),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      bottomNavigationBar: HomeActions(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = context.select((Logger c) => c);

    final calcCubit = CalculatorCubit(
      logger,
      locator<IVibrate>(),
      locator<IRatesAPI>(),
    );

    return BlocProvider.value(
      value: calcCubit,
      child: const _Calc(),
    );
  }
}
