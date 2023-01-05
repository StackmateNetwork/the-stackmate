import 'package:flutter/material.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/model/cypherpost-mock.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Network/ChatCard.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final history = c.select((OverviewCubit dc) => dc.state.verifiedPosts);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          for (var h in history) ...[
            const SizedBox(height: 2),
            ChatCard(history: h),
            const SizedBox(height: 2),
          ],
        ],
      ),
    );
  }
}
