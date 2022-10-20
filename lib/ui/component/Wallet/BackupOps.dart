import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class BackupOps extends StatelessWidget {
  const BackupOps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);
    final masterKeyState = c.select((MasterKeyCubit mkc) => mkc.state);
    final isBackedUp = masterKeyState.key!.seed!.isEmpty;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'BACKUP OPERATIONS',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          if (!isBackedUp) ...[
            Text(
              'STANDARD BACKUP PENDING!',
              style: c.fonts.overline!.copyWith(
                color: c.colours.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: c.colours.error,
                  side: BorderSide(color: c.colours.error),
                  onSurface: c.colours.background.withOpacity(0.38),
                ),
                onPressed: () {
                  c.push('/backup-master');
                },
                child: Text('BACKUP WALLET!'.toUpperCase()),
              ),
            ),
          ],
          if (isBackedUp)
            Text(
              'STANDARD BACKUP COMPLETE.',
              style: c.fonts.overline!.copyWith(
                color: c.colours.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 24),
          SizedBox(
            height: 52,
            width: c.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: c.colours.background,
                primary: c.colours.primary,
              ),
              onPressed: () async {
                //
              },
              child: const Text('TEST RECOVERY'),
            ),
          ),
          const SizedBox(height: 24),
          if (true) // WALLET HAS A PASSPHRASE
            SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: c.colours.primary,
                ),
                onPressed: () async {
                  _showCipherBackupWarning(c);
                },
                child: const Text('ENCRYPTED BACKUP'),
              ),
            ),
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
                'Your passphrase will be used to encrypt your mnemonic seed phrase as a cipher.\n\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colours.onPrimary,
                ),
              ),
              Text(
                'DO NOT STORE THIS BACKUP ON YOUR PHONE!\nTHIS WILL MAKE IT AN OPEN TARGET TO THEFT!\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colours.onPrimary,
                ),
              ),
              Text(
                'ONLY STORE A THIS BACKUP ON AN SD CARD!\n',
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
