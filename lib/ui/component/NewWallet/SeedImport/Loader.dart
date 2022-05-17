import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class ImportSyncLoader extends StatelessWidget {
  const ImportSyncLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((SeedImportWalletCubit hc) => hc.state);

    const String syncing = 'Syncing wallet...';
    if (!state.savingWallet) return Container();

    return Loading(
      text: syncing,
    );
  }
}
