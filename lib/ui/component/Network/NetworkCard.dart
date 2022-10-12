import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/model/cypherpost.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkCard extends StatelessWidget {
  const NetworkCard({
    Key? key,
    this.isSelection = false,
    required this.network,
  }) : super(key: key);

  final CypherPostServerIdentity network;
  final bool isSelection;

  @override
  Widget build(BuildContext c) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: c.colours.primary,
          side: BorderSide(color: c.colours.onPrimary),
          onSurface: c.colours.background.withOpacity(0.38),
        ),
        onPressed: () {
          c.push('/discover');
        },
        child: Text(network.name),
      ),
    );
  }
}
