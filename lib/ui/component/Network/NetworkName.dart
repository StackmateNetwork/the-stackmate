import 'package:flutter/material.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkName extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final network = c.select((OverviewCubit oc) => oc.state.network);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            network.name,
            style: c.fonts.headline6!.copyWith(
              color: c.colours.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
