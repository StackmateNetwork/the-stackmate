import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select((ReceiveCubit h) => h.state.loadingAddress);

    if (!loading) return Container();

    return const Loading(text: 'Storing Address');
  }
}
