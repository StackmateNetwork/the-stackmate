import 'package:flutter/material.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class OverviewLoader extends StatelessWidget {
  const OverviewLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select((OverviewCubit h) => h.state.loading);

    switch (loading) {
      case 'inviting':
        {
          return const Loading(text: 'Requesting invite code...');
        }
      default:
        {
          return Container();
        }
    }
  }
}
