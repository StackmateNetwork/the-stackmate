import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/wallet.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class WalletLoader extends StatelessWidget {
  const WalletLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history = context.select((WalletCubit hc) => hc.state);

    if (!history.loadingTransactions && !history.loadingBalance)
      return Container();

    return Loading(
      text: history.loadingTransactions ? 'Loading History' : 'Loading Balance',
    );
  }
}
