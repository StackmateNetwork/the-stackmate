import 'package:flutter/material.dart';
import 'package:libcpclient/outputs.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/pkg/extensions.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    this.isSelection = false,
    required this.history,
  }) : super(key: key);

  final Verified history;
  final bool isSelection;

  @override
  Widget build(BuildContext context) {
    final overviewCubit = context.select((OverviewCubit dc) => dc);

    return GestureDetector(
      onTap: () {
        if (!isSelection) {
          // context.push('/network-chat');
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
                  '@' +
                      overviewCubit
                          .usernameByPubkey(history.counterParty!)!
                          .username!,
                  style: context.fonts.subtitle1!.copyWith(
                    color: context.colours.onBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
