import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingStart =
        context.select((SendCubit sc) => sc.state.loadingStart);
    final buildingTx = context.select((SendCubit sc) => sc.state.buildingTx);
    final calculating =
        context.select((SendCubit sc) => sc.state.calculatingFees);

    final sendingTx = context.select((SendCubit sc) => sc.state.sendingTx);

    if (loadingStart) return const Loading(text: 'Loading Balance');
    if (calculating) return const Loading(text: 'Calculating Fees');
    if (buildingTx) return const Loading(text: 'Building Transaction');
    if (sendingTx) return const Loading(text: 'Signing & Broadcasting');

    return Container();
  }
}
