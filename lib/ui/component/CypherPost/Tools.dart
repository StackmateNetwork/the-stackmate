import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class SocialTools extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // c.push('/discover');
                },
                icon: Icon(
                  Icons.language_sharp,
                  size: 32,
                  color: c.colours.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  // c.push('/messaging');
                },
                icon: Icon(
                  Icons.message,
                  size: 24,
                  color: c.colours.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  // c.push('/peers');
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
      ),
    );
  }
}
