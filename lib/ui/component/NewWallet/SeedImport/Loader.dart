import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext c) {
    final loading = c.select((SeedImportWalletCubit h) => h.state.savingWallet);
    final mks = c.select((MasterKeyCubit mk) => mk.state);

    final text =
        (mks.key == null) ? 'Importing wallet...' : 'Recovering wallet...';
    if (!loading) return Container();

    return Loading(text: text);
  }
}
