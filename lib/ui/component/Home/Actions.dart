import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/routes.dart';

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
              Navigator.pushNamed(context, Routes.qr);
            },
            icon: Icon(Icons.qr_code, size: 32, color: context.colours.primary),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.addWallet);
            },
            icon: Icon(Icons.add, size: 32, color: context.colours.primary),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.addressBook);
            },
            icon: Icon(
              Icons.schema_outlined,
              size: 32,
              color: context.colours.primary,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.calc);
            },
            icon: Icon(
              Icons.calculate_sharp,
              size: 32,
              color: context.colours.primary,
            ),
          ),
        ],
      ),
    );
  }
}
