import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/LogButton.dart';

class _Messages extends StatelessWidget {
  const _Messages({Key? key}) : super(key: key);

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
                    Icons.message,
                    size: 32,
                    color: context.colours.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'PRIVATE MESSAGING',
                    style: context.fonts.caption!
                        .copyWith(color: context.colours.primary),
                    textAlign: TextAlign.center,
                  ),
                  DefaultTabController(
                    length: 2, // length of tabs
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: context.width,
                            maxHeight: 92,
                          ),
                          child: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: context.colours.background,
                            bottom: TabBar(
                              indicatorColor: context.colours.primary,
                              tabs: [
                                Tab(
                                  child: Text(
                                    'DIRECT',
                                    style: context.fonts.headline6!.copyWith(
                                      color: context.colours.onBackground,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'GROUP',
                                    style: context.fonts.headline6!.copyWith(
                                      color: context.colours.onBackground,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            title: const Text(''),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: context.width,
                            maxHeight: context.height / 1.2,
                          ),
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: const [
                                    SizedBox(
                                      height: 32,
                                    ),
                                    // IdentityKey(),
                                    // RegisterMyIdentity()
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: const [
                                    SizedBox(
                                      height: 32,
                                    ),
                                    // RecoverMyIdentity()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Messages();
  }
}
