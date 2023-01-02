import 'package:flutter/material.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class NetworkInfoScreen extends StatelessWidget {
  const NetworkInfoScreen({Key? key, required this.network}) : super(key: key);

  final NetworkIdentity network;

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Header(
                cornerTitle: 'Network Info'.toUpperCase(),
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
                      'USERNAME',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      network.username,
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
                      network.kind,
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
                      network.inviteCount.toString(),
                      style: c.fonts.headline6!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(16),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                        onPressed: () {
                          // overviewCubit.generateInvite()
                        },
                        child: Text('Generate Invite Code'.toUpperCase()),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
