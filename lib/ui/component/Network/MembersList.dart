import 'package:flutter/material.dart';
import 'package:sats/model/cypherpost-mock.dart';
import 'package:sats/ui/component/Network/MemberCard.dart';

class MembersList extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          for (var m in members) ...[
            const SizedBox(height: 5),
            MemberCard(member: m),
            const SizedBox(height: 5),
          ],
        ],
      ),
    );
  }
}
