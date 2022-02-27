import 'package:flutter/material.dart';
import 'package:sats/cubit/reddit.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/RedditItem.dart';

class RedditFeed extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final redditState = c.select((RedditCubit c) => c.state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (redditState.error != '') ...[
          const SizedBox(height: 32),
          Center(
            child: Text(
              redditState.error,
              style: c.fonts.overline!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                c.read<RedditCubit>().getPosts();
              },
              child: const Text(
                'Try Again.',
                // style: c.fonts.button!.copyWith(
                // color: Colors.white,
                // ),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ] else ...[
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              'REDDIT FEED',
              style: c.fonts.overline!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          for (var post in redditState.posts) FeedItem(post: post),
          const SizedBox(height: 40),
        ]
      ],
    );
  }
}
