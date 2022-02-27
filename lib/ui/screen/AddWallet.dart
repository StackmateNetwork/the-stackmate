import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sats/navigation.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';

class WalletSelection extends StatelessWidget {
  const WalletSelection({
    Key? key,
    required this.text,
    required this.description,
    required this.colour,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String description;
  final Color colour;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        // borderRadius: BorderRadius.circular(8),
        // shadowColor: Colors.,
        // color: colour,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        primary: colour,
      ),
      child: Container(
        // height: 100,
        padding: const EdgeInsets.only(
          // left: 0,
          top: 24,
          bottom: 24,
          // right: 0,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.toUpperCase(),
                  style: context.fonts.button!.copyWith(
                    color: context.colours.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 240,
                  // height: 45,
                  child: Text(
                    description,
                    maxLines: 3,
                    // softWrap: true,
                    // overflow: TextOverflow.fade,
                    style: context.fonts.caption!.copyWith(
                      color: context.colours.onSurface.withOpacity(0.7),
                      // fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next_sharp,
              size: 40,
              color: context.colours.primary,
            ),
          ],
        ),
      ),
    );
  }
}

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
                    'SINGLE ACCOUNT',
                    style: c.fonts.overline!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                WalletSelection(
                  text: 'Seed',
                  description:
                      'Easy to use, Easy to Backup.\n12 word phase as private key.',
                  colour: c.colours.surface,
                  onPressed: () {
                    Navigator.pushNamed(c, Routes.generateSeed);
                  },
                ),
                const SizedBox(height: 16),
                WalletSelection(
                  text: 'Relocate',
                  description: 'Move your funds.\nImport an existing seed.',
                  colour: c.colours.surface,
                  onPressed: () {
                    Navigator.pushNamed(c, Routes.importSeed);
                  },
                ),
                const SizedBox(height: 16),
                WalletSelection(
                  text: 'Observe',
                  description:
                      'Public View, Maximum Privacy.\nImport your public key.',
                  colour: c.colours.surface,
                  onPressed: () {
                    Navigator.pushNamed(c, Routes.watchOnly);
                  },
                ),
                const SizedBox(height: 48),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'MULTI ACCOUNT',
                        style: c.fonts.overline!.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    WalletSelection(
                      text: 'Inheritance - New',
                      description:
                          'Time protect you assets.\nSelect your hier.',
                      colour: c.colours.surface,
                      onPressed: () {
                        Navigator.pushNamed(c, Routes.inheritanceNewSeed);
                      },
                    ),
                    const SizedBox(height: 16),
                    WalletSelection(
                      text: 'Inheritance - Import',
                      description: 'Import an existing time protected wallet.',
                      colour: c.colours.surface,
                      onPressed: () {
                        Navigator.pushNamed(c, Routes.inheritanceOldSeed);
                      },
                    ),
                    const SizedBox(height: 16),
                    Opacity(
                      opacity: 0.5,
                      child: WalletSelection(
                        text: 'Co Sign',
                        description: ' ',
                        colour: c.colours.surface,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
