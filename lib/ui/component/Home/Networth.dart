import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/cubit/fees.dart';

class Networth extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());

    return Padding(
      padding: const EdgeInsets.only(top: 1, bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Row(
              children: [
                Text(
                  '187,898 sats',
                  style: c.fonts.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
                const Spacer(),
                // const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.hide_source,
                    size: 24,
                    color: c.colours.primary,
                  ),
                ),

                // LogButton(
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.lightbulb_outline_sharp,
                //       size: 32,
                //       color: c.colours.primary,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
