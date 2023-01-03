import 'package:flutter/material.dart';
import 'package:sats/cubit/network/discover.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Network/MemberCard.dart';

class MembersList extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final members = c.select((DiscoverCubit dc) => dc.state.members);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          for (var m in members) ...[
            const SizedBox(height: 2),
            MemberCard(member: m),
            const SizedBox(height: 2),
          ],
        ],
      ),
    );
  }
}
