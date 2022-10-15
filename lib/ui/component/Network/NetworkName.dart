import 'package:flutter/material.dart';
import 'package:sats/model/cypherpost-mock.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkName extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            serverId.name,
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
