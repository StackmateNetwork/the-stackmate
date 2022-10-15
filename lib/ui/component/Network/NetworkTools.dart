import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkTools extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {
                c.push('/user-info');
              },
              icon: Icon(
                Icons.info,
                size: 32,
                color: c.colours.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                c.push('/discover-members');
              },
              icon: Icon(
                Icons.person_search_sharp,
                size: 32,
                color: c.colours.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
