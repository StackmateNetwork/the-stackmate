import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/derivation.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class DeriveLoader extends StatelessWidget {
  const DeriveLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final deriving = c.select((DeriveWalletCubit mc) => mc.state.savingWallet);

    if (!deriving) return Container();
    return const Loading(text: 'Deriving wallet...');
  }
}
