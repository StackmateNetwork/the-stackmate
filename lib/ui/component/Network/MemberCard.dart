import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/model/cypherpost.dart';
import 'package:sats/pkg/extensions.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    this.isSelection = false,
    required this.member,
  }) : super(key: key);

  final CypherPostIdentity member;
  final bool isSelection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSelection) {
          context.push('/chat');
        }
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(22),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: context.colours.background,
        child: Container(
          height: 52,
          width: context.width,
          padding: const EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '@' + member.username,
                style: context.fonts.subtitle1!.copyWith(
                  color: context.colours.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                member.pubkey,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: context.fonts.caption!.copyWith(
                  color: context.colours.secondary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
