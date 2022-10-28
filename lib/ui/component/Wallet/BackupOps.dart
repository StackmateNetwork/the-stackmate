import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class BackupOps extends StatelessWidget {
  const BackupOps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    const primaryWallet = 'PRIMARY';

    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);
    final masterKeyState = c.select((MasterKeyCubit mkc) => mkc.state);
    final isBackedUp = masterKeyState.key!.backedUp!;
    final walletType = wallet.walletType;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BACKUP OPERATIONS',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          if (!isBackedUp && walletType == primaryWallet) ...[
            SizedBox(
              height: 52,
              width: c.width,
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
          ],
          ...[
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: c.colours.tertiary,
                ),
                onPressed: () async {
                  // c.push('/test-recovery');
                },
                child: const Text('TEST RECOVERY'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}

Future<void> _showCipherBackupWarning(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24.0),
        insetPadding: const EdgeInsets.all(24.0),
        backgroundColor: context.colours.onPrimaryContainer,
        elevation: 2.0,
        title: Text(
          'ENCRYPTED\nBACKUP',
          style: context.fonts.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colours.onPrimary,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'This is an advanced feature. Please read before proceeding!\n\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colours.onPrimary,
                ),
              ),
              Text(
                'DO NOT STORE ENCRYPTED BACKUPS ON YOUR DEVICE!\n\nONLY STORE THESE BACKUPS ON AN SD CARD!\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colours.onPrimary,
                ),
              ),
              Text(
                'ABORT if you are not sure! Contact our team for more information.\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colours.error,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'I Understand.',
              style: context.fonts.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colours.secondary,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              // context.push('/contracts');
              //c.push('/encrypted-backup');
            },
          ),
          TextButton(
            child: Text(
              'Abort!',
              style: context.fonts.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colours.error,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              // context.push('/contracts');
            },
          ),
        ],
      );
    },
  );
}
