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
                      'PUBLIC KEY',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      myId.pubkey,
                      style: c.fonts.bodySmall!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'USERNAME',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      myId.username,
                      style: c.fonts.headline6!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'TYPE',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Privileged',
                      style: c.fonts.headline6!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'INVITES REMAINING',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '7',
                      style: c.fonts.headline6!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(16),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                        onPressed: () {},
                        child: Text('Generate Invite Code'.toUpperCase()),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
