import 'package:flutter/material.dart';
import 'package:sats/model/cypherpost-mock.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:go_router/go_router.dart';

class NetworkName extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          serverId.name,
          style: c.fonts.headline4!.copyWith(
            color: c.colours.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
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
                c.push('/chat-directory');
              },
              icon: Icon(
                Icons.message,
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
