import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/LogButton.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());

    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 32,
            ),
            child: Row(
              children: [
                const Spacer(),
                LogButton(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lightbulb_outline_sharp,
                      size: 32,
                      color: c.colours.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
