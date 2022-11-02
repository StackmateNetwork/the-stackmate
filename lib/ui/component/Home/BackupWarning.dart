import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/seed-backup.dart';
import 'package:sats/pkg/extensions.dart';

class BackupWarning extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final masterKeyState = c.select((MasterKeyCubit mkc) => mkc.state);
    final isBackedUp = masterKeyState.key!.backedUp!;

    if (!isBackedUp)
      return Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 52,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: c.colours.error,
              onSurface: c.colours.background.withOpacity(0.38),
            ),
            onPressed: () {
              c.push('/backup-master');
            },
            child: Text('BACKUP WALLET!'.toUpperCase()),
          ),
        ),
      );
    else
      return Container();
  }
}
