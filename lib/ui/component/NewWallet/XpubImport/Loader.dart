import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select((XpubImportWalletCubit h) => h.state.savingWallet);

    if (!loading) return Container();

    return const Loading(text: 'Importing watcher wallet...');
  }
}
