import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/master.dart';
import 'package:sats/pkg/extensions.dart';

class BackupOps extends StatefulWidget {
  const BackupOps({Key? key}) : super(key: key);

  @override
  State<BackupOps> createState() => _BackupOpsState();
}

class _BackupOpsState extends State<BackupOps> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    const primaryWallet = 'PRIMARY';
    // const recoveredWallet = 'RECOVERED';
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);
    final masterKey = c.select((MasterKeyCubit mc) => mc.state.key!);
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
          if (walletType == primaryWallet) ...[
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.zero,
              child: TextFormField(
                enableIMEPersonalizedLearning: false,
                autocorrect: false,
                obscureText: true,
                obscuringCharacter: '*',
                controller: _controller,
                validator: (val) {
                  return null;
                },
                onChanged: (text) {
                  c.read<InfoCubit>().passPhraseChanged(text);
                },
                style: TextStyle(color: c.colours.onBackground),
                decoration: const InputDecoration(
                  labelText: 'Passphrase',
                ),
              ),
            ),
            SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: c.colours.tertiary,
                ),
                onPressed: () async {
                  c.read<InfoCubit>().testPassPhrase(masterKey.seed!);
                  _controller.clear();
                },
                child: const Text('TEST PASSPHRASE'),
              ),
            ),
            const SizedBox(height: 24),
          ],
          const SizedBox(height: 24),
          if (isBackedUp && wallet.walletType == primaryWallet)
            SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: c.colours.error,
                  onSurface: c.colours.background.withOpacity(0.38),
                ),
                onPressed: () {
                  peekSeed(c, masterKey);
                },
                child: Text('PEEK SEED'.toUpperCase()),
              ),
            ),
          if (walletType != primaryWallet) ...[
            Text(
              'There are no backup operations for this wallet.',
              style: c.fonts.bodyMedium!.copyWith(
                color: c.colours.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

Future<void> peekSeed(BuildContext context, MasterKey key) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24.0),
        insetPadding: const EdgeInsets.all(24.0),
        backgroundColor: context.colours.onPrimaryContainer,
        elevation: 2.0,
        title: Text(
          'MNEMONIC\nSEED',
          style: context.fonts.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colours.onPrimary,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                key.seed!,
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colours.onPrimary,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Got it!',
              style: context.fonts.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colours.primary,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
