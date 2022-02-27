import 'package:animate_do/animate_do.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/Header.dart';
import 'package:sats/ui/component/Home/WalletCard.dart';

class ReorderCards extends StatelessWidget {
  const ReorderCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final wallets = c.select((WalletsCubit wc) => wc.state.wallets);

    return WillPopScope(
      onWillPop: () async {
        c.read<WalletsCubit>().toggleRearranging();
        return false;
      },
      child: Scaffold(
        body: FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Drag wallet to rearrange'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: c.fonts.overline!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
              ),
              Expanded(
                child: DragAndDropLists(
                  listWidth: 400,
                  horizontalAlignment: MainAxisAlignment.center,
                  lastItemTargetHeight: 300,
                  listPadding: const EdgeInsets.symmetric(horizontal: 16),
                  onListReorder: (s, ss) {},
                  onItemReorder: (
                    int oldItemIndex,
                    int oldListIndex,
                    int newItemIndex,
                    int newListIndex,
                  ) {
                    c
                        .read<WalletsCubit>()
                        .rearrange(oldItemIndex, newItemIndex);
                  },
                  itemDecorationWhileDragging: BoxDecoration(
                    color: c.colours.background,
                    boxShadow: [
                      BoxShadow(
                        color: c.colours.onBackground.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 3,
                        // offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  contentsWhenEmpty: Container(),
                  children: [
                    DragAndDropList(
                      contentsWhenEmpty: Container(),
                      // horizontalAlignment: MainAxisAlignment.center,
                      children: [
                        for (final wallet in wallets) ...[
                          DragAndDropItem(
                            child: WalletCard(
                              wallet: wallet,
                              isSelection: true,
                            ),
                          )
                        ],
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
