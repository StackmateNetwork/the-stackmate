import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/api/rates.dart';
import 'package:sats/cubit/calculator.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/rate.dart';
import 'package:sats/pkg/_deps.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/style.dart';
import 'package:sats/pkg/validation.dart';
import 'package:sats/pkg/vibrate.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';
import 'package:sats/ui/component/common/loading.dart';

class RatesHeader extends StatelessWidget {
  const RatesHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: (child, animation) =>
          buttonToLoaderTransition(child: child, animation: animation),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, calcState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              if (!calcState.loadingRates && calcState.rates != null) ...[
                FadeIn(
                  duration: const Duration(milliseconds: 400),
                  // delay: const Duration(milliseconds: 400),
                  child: GestureDetector(
                    onTap: () {
                      c.read<CalculatorCubit>().fieldSelected(false);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              calcState.satsAmt,
                              style: c.fonts.headline5!.copyWith(
                                color: c.colours.primary.withAlpha(
                                  !calcState.editingBtc ? 160 : 255,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            iconEnabledColor: c.colours.primary,
                            dropdownColor: c.colours.background,
                            value: calcState.btcSelected ? 'BTC' : 'sats',
                            onTap: () {
                              print('eerrree');
                            },
                            onChanged: (text) {
                              c
                                  .read<CalculatorCubit>()
                                  .btcTypeChanged(text == 'BTC');
                            },
                            items: [
                              DropdownMenuItem(
                                value: 'BTC',
                                child: Text(
                                  'BTC',
                                  style: c.fonts.button!
                                      .copyWith(color: c.colours.primary),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'sats',
                                child: Text(
                                  'sats',
                                  style: c.fonts.button!.copyWith(
                                    color: c.colours.primary.withAlpha(
                                      calcState.editingBtc ? 255 : 160,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FadeIn(
                  duration: const Duration(milliseconds: 400),
                  // delay: const Duration(milliseconds: 400),
                  child: Divider(
                    color: c.colours.primary.withOpacity(0.5),
                  ),
                ),
                FadeIn(
                  duration: const Duration(milliseconds: 400),
                  // delay: const Duration(milliseconds: 400),
                  child: GestureDetector(
                    onTap: () {
                      c.read<CalculatorCubit>().fieldSelected(true);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              calcState.currencyAmt,
                              style: c.fonts.headline5!.copyWith(
                                color: c.colours.primary.withAlpha(
                                  calcState.editingBtc ? 160 : 255,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<Rate>(
                            iconEnabledColor: c.colours.primary,
                            dropdownColor: c.colours.background,
                            onTap: () {},
                            onChanged: (rate) {
                              c
                                  .read<CalculatorCubit>()
                                  .currencyTypeChanged(rate!);
                            },
                            value: calcState.selectedRate,
                            items: [
                              for (var rate in calcState.rates!)
                                DropdownMenuItem(
                                  value: rate,
                                  child: Text(
                                    rate.symbol,
                                    style: c.fonts.button!.copyWith(
                                      color: c.colours.primary.withAlpha(
                                        !calcState.editingBtc ? 255 : 160,
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]
            ],
          );
        },
      ),
    );
  }
}

class CalcKey extends StatefulWidget {
  const CalcKey({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _CalcKeyState createState() => _CalcKeyState();
}

class _CalcKeyState extends State<CalcKey> {
  // double _elevation = 2.0;

  @override
  Widget build(BuildContext c) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          // _elevation = 0;
        });
      },
      onTapUp: (details) {
        setState(() {
          // _elevation = 2;
        });
      },
      onTapCancel: () {
        setState(() {
          // _elevation = 0;
        });
      },
      onTap: () {
        c.read<CalculatorCubit>().calcKeyPressed(widget.text);
      },
      child: Container(
        width: (c.width / 5) - 5,
        height: (c.width / 5) - 5,
        child: Material(
          elevation: 1, //_elevation,
          color: Validation.isNumeric(widget.text)
              ? Colors.transparent
              : c.colours.surface,
          child: Center(
            child: Text(
              widget.text,
              style: c.fonts.headline6!.copyWith(color: c.colours.primary),
            ),
          ),
        ),
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  //static Widget _w = SizedBox(width: 4);
  static const Widget _h = SizedBox(height: 4);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: 'C'),
            //_w,
            CalcKey(text: 'del'),
            //_w,
            CalcKey(text: '1'),
            //_w,
            CalcKey(text: '2'),
            //_w,
            CalcKey(text: '3'),
            //_w,
          ],
        ),
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: '('),
            //_w,
            CalcKey(text: ')'),
            //_w,
            CalcKey(text: '4'),
            //_w,
            CalcKey(text: '5'),
            //_w,
            CalcKey(text: '6'),
            //_w,
          ],
        ),
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: '+'),
            //_w,
            CalcKey(text: '-'),
            //_w,
            CalcKey(text: '7'),
            //_w,
            CalcKey(text: '8'),
            //_w,
            CalcKey(text: '9'),
            //_w,
          ],
        ),
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: 'x'),
            //_w,
            CalcKey(text: '/'),
            //_w,
            CalcKey(text: '.'),
            //_w,
            CalcKey(text: '='),
            //_w,
            CalcKey(text: '0'),
            //_w,
          ],
        ),
        // SizedBox(height: 200)
      ],
    );
  }
}

class Calc extends StatelessWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select((CalculatorCubit c) => c.state.loadingRates);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (loading)
              const Loading(
                text: 'Fetching Rates',
              ),
            if (!loading)
              const Header(
                cornerTitle: 'STACKMATE',
                children: [
                  SizedBox(height: 8),
                  Back(),
                ],
              ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RatesHeader(),
            ),
            // const SizedBox(height: 40),
            const Spacer(flex: 4),
            if (!loading)
              FadeInUp(
                delay: const Duration(milliseconds: 1000),
                child: const Calculator(),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = context.select((LoggerCubit c) => c);

    final calcCubit = CalculatorCubit(
      logger,
      locator<IVibrate>(),
      locator<IRatesAPI>(),
    );

    return BlocProvider.value(
      value: calcCubit,
      child: const Calc(),
    );
  }
}
