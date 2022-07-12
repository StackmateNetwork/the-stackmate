import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/pkg/extensions.dart';

class HomeActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (ModalRoute.of(context)!.settings.name != '/home')
                context.push('/home');
            },
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              size: 32,
              color: context.colours.primary,
            ),
          ),
          IconButton(
            onPressed: () {
              if (ModalRoute.of(context)!.settings.name != '/network')
                context.push('/network');
            },
            icon: Icon(
              Icons.schema_outlined,
              size: 32,
              color: context.colours.primary,
            ),
          ),
          IconButton(
            onPressed: () {
              if (ModalRoute.of(context)!.settings.name != '/settings')
                context.push('/settings');
            },
            icon: Icon(
              Icons.settings,
              size: 32,
              color: context.colours.primary,
            ),
          ),
        ],
      ),
    );
  }
}
