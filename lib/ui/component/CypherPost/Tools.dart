import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/pkg/extensions.dart';

class SocialTools extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());
    final preferences = c.select((PreferencesCubit p) => p);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                c.push('/discover');
              },
              icon: Icon(
                Icons.language_sharp,
                size: 32,
                color: c.colours.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                c.push('/messaging');
              },
              icon: Icon(
                Icons.message,
                size: 24,
                color: c.colours.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                c.push('/peers');
              },
              icon: Icon(
                Icons.people,
                size: 32,
                color: c.colours.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
