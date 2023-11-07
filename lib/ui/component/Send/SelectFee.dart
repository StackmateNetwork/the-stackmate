import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class SelectFee extends StatefulWidget {
  const SelectFee({super.key});

  @override
  State<SelectFee> createState() => _SelectFeeState();
}

class _SelectFeeState extends State<SelectFee> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((SendCubit sc) => sc.state);
    // return BlocBuilder<SendCubit, SendState>(
    //   builder: (context, state) {
    // context.read<FeesCubit>().update();
    if (state.feeSlow == null ||
        state.feeMedium == null ||
        state.feeFast == null) return Container();

    final slow = state.feeSlow!.toString();
    final medium = state.feeMedium!.toString();
    final fast = state.feeFast!.toString();

    final buildingTx = state.buildingTx;
    final calculatingFees = state.calculatingFees;

    if (state.fees != _controller.text) _controller.text = state.fees;

    return BlocListener<SendCubit, SendState>(
      listener: (context, state) => {
        if (state.feeSlow == null ||
            state.feeMedium == null ||
            state.feeFast == null)
          handleError(context, 'Check tor connection'),
        if (state.errLoading != '')
          {
            handleError(
              context, 'Error loading fees', //state.errLoading,
            ),
          }
        else if (state.errFees != '')
          {
            handleError(
              context,
              'Error loading fee,Check tor connection', // state.errFees,
            ),
          },
      },
      child: BlocBuilder<SendCubit, SendState>(
        builder: (context, state) {
          return IgnorePointer(
            ignoring: buildingTx || calculatingFees,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: (buildingTx || calculatingFees) ? 0.3 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Opacity(
                            opacity: state.feesOption == 0 ? 1 : 0.6,
                            child: TextButton(
                              onPressed: () {
                                context.read<SendCubit>().feeSelected(0);
                              },
                              child: Text('slow'.toUpperCase()),
                            ),
                          ),
                          Text(
                            '~ 2 - 3 hours\n($slow sats)',
                            textAlign: TextAlign.center,
                            style: context.fonts.bodySmall!.copyWith(
                              fontSize: 10,
                              color:
                                  context.colours.onBackground.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Opacity(
                            opacity: state.feesOption == 1 ? 1 : 0.6,
                            child: TextButton(
                              onPressed: () {
                                context.read<SendCubit>().feeSelected(1);
                              },
                              child: Text('medium'.toUpperCase()),
                            ),
                          ),
                          Text(
                            '~ 60 - 90 minutes \n($medium sats)',
                            textAlign: TextAlign.center,
                            style: context.fonts.bodySmall!.copyWith(
                              fontSize: 10,
                              color:
                                  context.colours.onBackground.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Opacity(
                            opacity: state.feesOption == 2 ? 1 : 0.6,
                            child: TextButton(
                              onPressed: () {
                                context.read<SendCubit>().feeSelected(2);
                              },
                              child: Text('Fast'.toUpperCase()),
                            ),
                          ),
                          Text(
                            '~ 20 minutes\n($fast sats)',
                            textAlign: TextAlign.center,
                            style: context.fonts.bodySmall!.copyWith(
                              fontSize: 10,
                              color:
                                  context.colours.onBackground.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Slider(
                    divisions: 6,
                    min: double.parse(
                      (context.read<SendCubit>().state.feeSlow!).toString(),
                    ),
                    max: double.parse(
                      (context.read<SendCubit>().state.feeFast! + 250)
                          .toString(),
                    ),
                    value: double.parse(
                      (context.read<SendCubit>().state.finalFee!).toString(),
                    ),
                    onChanged: (f) {
                      context
                          .read<SendCubit>()
                          .feeChanged(f.round().toString());
                    },
                  ),
                  // TextField(
                  //   controller: _controller,
                  //   keyboardType: TextInputType.number,
                  //   style: TextStyle(color: context.colours.onBackground),
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter custom fee'.toUpperCase(),
                  //     errorText: state.errFees.nullIfEmpty(),
                  //   ),
                  //   onChanged: (t) {
                  //     context.read<SendCubit>().feeChanged(t);
                  //   },
                  // ),
                  const SizedBox(height: 60),
                  if (state.finalFee != null) ...[
                    Text(
                      'FINAL FEES',
                      style: context.fonts.labelSmall!.copyWith(
                        color: context.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${state.finalFee} sats',
                      style: context.fonts.titleMedium!.copyWith(
                        color: context.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${state.finalFee!.toBtc()} BTC',
                      style: context.fonts.bodySmall!.copyWith(
                        color: context.colours.onBackground,
                      ),
                    ),
                  ],
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: context.colours.background,
                        backgroundColor: context.colours.primary,
                      ),
                      onPressed: () {
                        context.read<SendCubit>().feeConfirmedClicked();
                      },
                      child: const Text('CONFIRM'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    //   },
    // );
  }
}
