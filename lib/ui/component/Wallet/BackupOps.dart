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
            child: const Text('CREATE CYPHERBACKUP'),
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
        backgroundColor: context.colours.onPrimaryContainer,
        title: Text(
          'CYPHERBACKUP',
          style: context.fonts.headline5,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Your passphrase will be used to encrypt your mnemonic seed phrase as a cipher.\n\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'DO NOT STORE A CYPHERBACKUP ON YOUR PHONE!\nTHIS WILL MAKE IT AN OPEN TARGET TO THEFT!\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ONLY STORE A CYPHERBACKUP ON AN SD CARD!\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
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
