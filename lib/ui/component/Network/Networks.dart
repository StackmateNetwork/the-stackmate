import 'package:flutter/material.dart';
import 'package:sats/ui/component/Network/NetworkCard.dart';

class Networks extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Container(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            SizedBox(height: 5),
            NetworkCard(),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
