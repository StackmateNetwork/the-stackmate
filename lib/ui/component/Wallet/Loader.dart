import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class WalletLoader extends StatelessWidget {
  const WalletLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.select((InfoCubit hc) => hc.state);
    const String syncBalance = 'Syncing balance...';
    const String syncHistory = 'Syncing history...';

    if (history.loadingBalance) {
      return const Loading(
        text: syncBalance,
      );
    }
    if (history.loadingTransactions) {
      return const Loading(
        text: syncHistory,
      );
    } else {
      return Container();
    }
  }
}
