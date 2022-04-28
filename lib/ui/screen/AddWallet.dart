import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/AddWallet/SelectButton.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';

class AddWalletScreen extends StatelessWidget {
  const AddWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Create\nWallet'.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: c.fonts.headline5!.copyWith(
                      color: c.colours.onBackground,
                      // color: Colors.blue[400],
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'SOLO ACCOUNT',
                    style: c.fonts.overline!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SelectButton(
                  text: 'New',
                  description: 'Generate a new mnemonic seed.',
                  colour: c.colours.surface,
                  onPressed: () {
                    c.push('/generate-seed');
                  },
                ),
                const SizedBox(height: 16),
                SelectButton(
                  text: 'Recover',
                  description: 'Import an existing wallet.',
                  colour: c.colours.surface,
                  onPressed: () {
                    c.push('/import-seed');
                  },
                ),
                const SizedBox(height: 16),
                SelectButton(
                  text: 'Watcher',
                  description: 'Import a public key.',
                  colour: c.colours.surface,
                  onPressed: () {
                    c.push('/watch-only');
                  },
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
