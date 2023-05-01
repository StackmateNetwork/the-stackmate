import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/model/master.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/extensions.dart';

class BackupOps extends StatefulWidget {
  const BackupOps({super.key});

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
    final wallet = c.select((InfoCubit wc) => wc.state.wallet);
    final masterKey = c.select((MasterKeyCubit mc) => mc.state.key!);
    final masterKeyState = c.select((MasterKeyCubit mkc) => mkc.state);
    final isBackedUp = masterKeyState.key!.backedUp!;
    final walletType = wallet.walletType;
    final isLoading = c.select((InfoCubit wc) => wc.state.loadingTransactions);
    final zeroBal = c.select((InfoCubit wc) => wc.state.zeroBalance());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BACKUP OPERATIONS',
            style: c.fonts.labelSmall!.copyWith(
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
            const SizedBox(height: 24),
          ],
          if (walletType == primaryWallet) ...[
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
                  foregroundColor: c.colours.secondary,
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
          if (isBackedUp && wallet.walletType == primaryWallet) ...[
            SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: c.colours.tertiary,
                  disabledForegroundColor:
                      c.colours.background.withOpacity(0.38).withOpacity(0.38),
                ),
                onPressed: () {
                  peekSeed(c, masterKey);
                },
                child: Text('PEEK SEED'.toUpperCase()),
              ),
            ),
            const SizedBox(height: 24),
          ],
          if (walletType != primaryWallet) ...[
            Text(
              'There are no backup operations for this wallet.',
              style: c.fonts.bodyMedium!.copyWith(
                color: c.colours.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
          ],
          AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: isLoading ? 0.3 : 1.0,
            child: SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: c.colours.error,
                  disabledForegroundColor:
                      c.colours.background.withOpacity(0.38).withOpacity(0.38),
                ),
                onPressed: () {
                  _deleteWalletClicked(c, zeroBal, wallet);
                },
                child: Text('DELETE WALLET'.toUpperCase()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> peekSeed(BuildContext context, MasterKey key) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24.0),
        insetPadding: const EdgeInsets.all(24.0),
        backgroundColor: context.colours.onPrimaryContainer,
        elevation: 2.0,
        title: Text(
          'MNEMONIC\nSEED',
          style: context.fonts.headlineSmall!.copyWith(
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

void _deleteWalletClicked(
  BuildContext c,
  bool zeroBalance,
  Wallet wallet,
) async {
  if (!zeroBalance && wallet.isNotWatchOnly()) {
    await showCupertinoModalPopup<bool>(
      context: c,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          'Wallet is not empty'.toUpperCase(),
          style: c.fonts.titleLarge!.copyWith(color: c.colours.onPrimary),
        ),
        message: Text(
          'Please send transfer all funds before deleting wallet.',
          style: c.fonts.titleSmall!.copyWith(color: c.colours.onBackground),
        ),
        actions: [
          ColoredBox(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              child: Text(
                'Please sweep your funds'.toUpperCase(),
                style: c.fonts.labelLarge!.copyWith(color: c.colours.error),
              ),
              onPressed: () async {
                Navigator.pop(context, true);
                await Future.delayed(const Duration(milliseconds: 200));
                c.push('/send', extra: wallet);
              },
            ),
          ),
          ColoredBox(
            color: c.colours.background,
            child: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'BACK',
                style:
                    c.fonts.labelLarge!.copyWith(color: c.colours.onBackground),
              ),
            ),
          ),
        ],
      ),
    );
    return;
  }

  final delete = await showCupertinoModalPopup<bool>(
    context: c,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          'Delete Wallet ?'.toUpperCase(),
          style: c.fonts.titleLarge!.copyWith(color: c.colours.onPrimary),
        ),
      ),
      message: Text(
        'All wallet information will be deleted.',
        style: c.fonts.titleSmall!.copyWith(color: c.colours.onBackground),
      ),
      actions: [
        ColoredBox(
          color: c.colours.background,
          child: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'DELETE IT!',
              style: c.fonts.labelLarge!.copyWith(color: c.colours.error),
            ),
          ),
        ),
        // const SizedBox(height: 24),
        ColoredBox(
          color: c.colours.background,
          child: CupertinoActionSheetAction(
            child: Text(
              'CANCEL',
              style:
                  c.fonts.labelLarge!.copyWith(color: c.colours.onBackground),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        )
      ],
    ),
  );

  if (delete != null && delete) {
    c.read<InfoCubit>().deleteClicked();
  }
}
