import 'package:flutter/material.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkInfo extends StatelessWidget {
  const NetworkInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final pubkey = c.select((SocialRootCubit src) => src.state.key!.pubkey);
    final network = c.select((OverviewCubit oc) => oc.state.network);
    final overviewCubit = c.select((OverviewCubit oc) => oc);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'USERNAME',
                  style: c.fonts.overline!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '@' + network.username,
                  style: c.fonts.headline6!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'PUBLIC KEY',
                  style: c.fonts.overline!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pubkey,
                  style: c.fonts.bodySmall!.copyWith(
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
                    onPressed: () async {
                      await overviewCubit.generateInvite();
                    },
                    child: Text('Generate Invite Code'.toUpperCase()),
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  child: GestureDetector(
                    onTap: () {
                      overviewCubit.copyInviteCode();
                    },
                    child: Text(
                      overviewCubit.state.generatedInviteCode,
                      style: c.fonts.bodySmall!.copyWith(
                        color: c.colours.secondary,
                      ),
                    ),
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
                      overviewCubit.leaveNetwork();
                    },
                    child: Text(
                      'Leave Network'.toUpperCase(),
                      style: c.fonts.bodyMedium!.copyWith(
                        color: c.colours.error,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
