import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/cubit/fees.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());

    return Padding(
      padding: const EdgeInsets.only(top: 42, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 16,
              left: 24,
              right: 32,
            ),
            child: Row(
              children: [
                Container(
                  width: 59,
                  height: 59,
                  child: const Image(
                    image: AssetImage('assets/icon/stackmate.png'),
                  ),
                ),
                const Spacer(),
                // const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    c.push('/settings');
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 32,
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
