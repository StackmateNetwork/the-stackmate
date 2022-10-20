import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class BackupOps extends StatelessWidget {
  const BackupOps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'BACKUP OPTIONS',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: c.colours.background,
              primary: c.colours.primary,
            ),
            onPressed: () async {
              //
            },
            child: const Text('TEST RECOVERY'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: c.colours.background,
              primary: c.colours.primary,
            ),
            onPressed: () async {
              _showCipherBackupWarning(c);
            },
            child: const Text('CREATE BACKUP CIPHER'),
          ),
        ],
      ),
    );
  }
}

Future<void> _showCipherBackupWarning(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: context.colours.onPrimary,
        title: Text('P2P Contract Terms.', style: context.fonts.headline3),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'DO NOT STORE CIPHER BACKUPS ON YOUR PHONE! THIS WILL MAKE IT AN OPEN TARGET TO THEFT!\n',
                style: context.fonts.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'ONLY STORE CIPHER BACKUPS ON AN SD CARD!\n',
                style: context.fonts.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'If you are unsure of what to do, do not proceed, and ask our team for support!',
                style: context.fonts.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('I Understand.'),
            onPressed: () {
              Navigator.of(context).pop();
              // context.push('/contracts');
            },
          ),
          TextButton(
            child: const Text('Abort!'),
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
