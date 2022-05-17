import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/cubit/fees.dart';
import 'package:intl/intl.dart';

class AddWallet extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              c.push('/add-wallet');
            },
            icon: Icon(Icons.add, size: 32, color: c.colours.primary),
          ),
        ],
      ),
    );
  }
}
