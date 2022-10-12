import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/model/cypherpost-mock.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 24),
              Header(
                cornerTitle: 'User Details'.toUpperCase(),
                children: [
                  Back(
                    onPressed: () {
                      Navigator.of(c).pop();
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 56),
                    Text(
                      'USER\nINFORMATION',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Public Key',
                      style: c.fonts.headlineSmall!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      myId.pubkey,
                      style: c.fonts.headline6!.copyWith(
                        color: c.colours.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Username',
                      style: c.fonts.headline6!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    Text(
                      myId.username,
                      style: c.fonts.headline6!.copyWith(
                        color: c.colours.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {},
                      child: Text('Copy'.toUpperCase()),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Only your mnemonic and passphrase are enough to recover this wallet.',
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
