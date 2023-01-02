import 'package:flutter/material.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/loading.dart';

class JoinLoader extends StatelessWidget {
  const JoinLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select((NetworksCubit h) => h.state.loading);

    switch (loading) {
      case 'ping':
        {
          return const Loading(text: 'Pinging host...');
        }

      case 'joining':
        {
          return const Loading(text: 'Attempting to register...');
        }

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
