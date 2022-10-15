import 'package:flutter/material.dart';
import 'package:sats/model/cypherpost-mock.dart';
import 'package:sats/ui/component/Network/NetworkCard.dart';

class Networks extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          for (var n in networks) ...[
            const SizedBox(height: 10),
            NetworkCard(network: n),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
