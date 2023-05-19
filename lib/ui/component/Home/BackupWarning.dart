import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/pkg/extensions.dart';

class BackupWarning extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final masterKeyState = c.select((MasterKeyCubit mkc) => mkc.state);
    // final isBackedUp = masterKeyState;

    bool isBackedUp = false;
    if (!isBackedUp)
      return Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 52,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: c.colours.error,
              disabledForegroundColor:
                  c.colours.background.withOpacity(0.38).withOpacity(0.38),
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
