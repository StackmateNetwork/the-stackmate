// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sats/cubit/wallets.dart';
// import 'package:sats/pkg/extensions.dart';
// import 'package:sats/ui/component/common/loading.dart';

// class HomeLoader extends StatelessWidget {
//   const HomeLoader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final wallets = context.select((WalletsCubit hc) => hc.state);
//     const String updating = 'Updating Rates...';
//     if (!wallets.loadingRates && !wallets.loadingRates) return Container();

//     return Loading(
//       text: updating,
//     );
//   }
// }
