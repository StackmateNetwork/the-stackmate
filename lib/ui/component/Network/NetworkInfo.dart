import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class NetworkInfo extends StatelessWidget {
  const NetworkInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final networksCubit = c.select((NetworksCubit nc) => nc);
    final pubkey = c.select((SocialRootCubit src) => src.state.key!.pubkey);
    final network = c.select((OverviewCubit oc) => oc.state.network);
    final overviewCubit = c.select((OverviewCubit oc) => oc);

    return BlocListener<OverviewCubit, OverviewState>(
      listener: (c, s) {
        if (s.error != '') {
          handleError(c, s.error);
        }
      },
      child: SingleChildScrollView(
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
                        _newInviteSecret(
                          c,
                          overviewCubit,
                          networksCubit,
                        );
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
                        overviewCubit.state.displayedInviteSecret,
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
                      onPressed: () async {
                        _leaveServer(c, overviewCubit, networksCubit);
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
      ),
    );
  }
}

void _leaveServer(
  BuildContext c,
  OverviewCubit overviewCubit,
  NetworksCubit networksCubit,
) async {
  final leave = await showCupertinoModalPopup<bool>(
    context: c,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          'Leave Network?'.toUpperCase(),
          style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
        ),
      ),
      message: Text(
        'All network history will be deleted locally and remotely.',
        style: c.fonts.subtitle2!.copyWith(color: c.colours.onBackground),
      ),
      actions: [
        Container(
          color: c.colours.background,
          child: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'LEAVE!',
              style: c.fonts.button!.copyWith(color: c.colours.error),
            ),
          ),
        ),
        // const SizedBox(height: 24),
        Container(
          color: c.colours.background,
          child: CupertinoActionSheetAction(
            child: Text(
              'CANCEL',
              style: c.fonts.button!.copyWith(color: c.colours.onBackground),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        )
      ],
    ),
  );

  if (leave != null && leave) {
    await overviewCubit.generateInvite();
    await networksCubit.load();
  }
}

void _newInviteSecret(
  BuildContext c,
  OverviewCubit overviewCubit,
  NetworksCubit networksCubit,
) async {
  final getNew = await showCupertinoModalPopup<bool>(
    context: c,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          'NOTE:'.toUpperCase(),
          style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
        ),
      ),
      message: Text(
        'Your last invite secret will be lost. Continue?',
        style: c.fonts.subtitle2!.copyWith(color: c.colours.onBackground),
      ),
      actions: [
        Container(
          color: c.colours.background,
          child: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'Yes',
              style: c.fonts.button!.copyWith(color: c.colours.primary),
            ),
          ),
        ),
        // const SizedBox(height: 24),
        Container(
          color: c.colours.background,
          child: CupertinoActionSheetAction(
            child: Text(
              'CANCEL',
              style: c.fonts.button!.copyWith(color: c.colours.error),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        )
      ],
    ),
  );

  if (getNew != null && getNew) {
    await overviewCubit.generateInvite();
    await networksCubit.load();
  }
}
