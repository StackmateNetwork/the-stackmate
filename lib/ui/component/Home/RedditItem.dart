import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/reddit.dart';
import 'package:sats/model/reddit-post.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({
    Key? key,
    required this.post,
  }) : super(key: key);
  final RedditPost post;

  @override
  Widget build(BuildContext c) {
    return FadeIn(
      child: GestureDetector(
        onTap: () {
          c.read<RedditCubit>().openPostLink(post);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: c.colours.surface,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 16,
                    bottom: 8,
                    top: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        post.time(),
                        style: c.fonts.overline!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        post.title,
                        style: GoogleFonts.geo(
                            fontStyle: FontStyle.normal, color: Colors.grey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
