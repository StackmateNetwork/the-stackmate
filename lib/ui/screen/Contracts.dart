import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/LogButton.dart';

class _Contracts extends StatelessWidget {
  const _Contracts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
        // if (step == SendSteps.address || step == SendSteps.sent) {
        //   return true;
        // }
        // context.read<SendCubit>().backClicked();
        // return false;
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Back(
                          onPressed: () {
                            if (true) {
                              Navigator.pop(context);
                              return;
                            }
                            // ignore: dead_code
                            if (false) {
                              // context.read<SendCubit>().backClicked();
                              return;
                            }
                          },
                        ),
                        LogButton(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.lightbulb_outline_sharp,
                              size: 32,
                              color: context.colours.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Icon(
                    Icons.currency_exchange,
                    size: 32,
                    color: context.colours.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ONGOING CONTRACTS',
                    style: context.fonts.caption!
                        .copyWith(color: context.colours.primary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Contracts();
  }
}
