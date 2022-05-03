import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/RedditLoader.dart';
import 'package:sats/cubit/fees.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final isRearranging = c.select((WalletsCubit wc) => wc.state.isRearranging);
    c.select((FeesCubit wc) => wc.update());

    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RedditLoader(),
          Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 24,
              right: !isRearranging ? 16 : 0,
            ),
            child: Row(
              children: [
                Text(
                  'Stackmate',
                  style: c.fonts.headline5!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                // const SizedBox(width: 16),
                if (!isRearranging) ...[
                  IconButton(
                    onPressed: () {
                      c.read<WalletsCubit>().toggleRearranging();
                      // Navigator.pushNamed(c, Routes.setting);
                    },
                    icon: Icon(
                      Icons.sort,
                      size: 32,
                      color: c.colours.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
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
                ] else ...[
                  TextButton(
                    onPressed: () {
                      c.read<WalletsCubit>().toggleRearranging();
                    },
                    child: const Text('DONE'),
                  )
                ]

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
