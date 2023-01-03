import 'package:flutter/material.dart';
import 'package:libcpclient/outputs.dart';
import 'package:sats/pkg/extensions.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    this.isSelection = false,
    required this.member,
  }) : super(key: key);

  final MemberIdentity member;
  final bool isSelection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSelection) {
          // context.push('/chat-directory');
        }
      },
      child: Material(
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: context.colours.background,
        child: Container(
          height: 70,
          width: context.width,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              // end: Alignment.centerRight,
              stops: const [0.3, 0.99],
              colors: [
                context.colours.surface,
                context.colours.surface,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '@' + member.username!,
                  style: context.fonts.subtitle1!.copyWith(
                    color: context.colours.onBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  member.pubkey!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: context.fonts.caption!.copyWith(
                    color: context.colours.secondary,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
