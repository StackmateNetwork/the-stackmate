import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';
import 'package:sats/ui/component/Network/MyIdentity/Key.dart';
import 'package:sats/ui/component/Network/MyIdentity/Recover.dart';
import 'package:sats/ui/component/Network/MyIdentity/Register.dart';

class _Peers extends StatelessWidget {
  const _Peers({Key? key}) : super(key: key);

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
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                    Icons.people,
                    size: 32,
                    color: context.colours.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'DISCOVER PEERS',
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

class PeersScreen extends StatelessWidget {
  const PeersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Peers();
  }
}
