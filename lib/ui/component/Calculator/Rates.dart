import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/calculator.dart';
import 'package:sats/model/rate.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';
import 'package:sats/ui/style.dart';

class Rates extends StatelessWidget {
  const Rates({
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
                              Validation.formatSatsString(calcState.satsAmt),
                              style: c.fonts.headline4!.copyWith(
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
                              Validation.formatSatsString(
                                  calcState.currencyAmt),
                              style: c.fonts.headline4!.copyWith(
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
