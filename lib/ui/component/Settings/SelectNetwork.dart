import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/extensions.dart';

class SelectNetwork extends StatelessWidget {
  const SelectNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final blockchain = c.select((ChainSelectCubit b) => b.state.blockchain);
    return ElevatedButton(
      onPressed: () {
        if (blockchain == Blockchain.mainNet)
          c.read<ChainSelectCubit>().changeBlockchain(Blockchain.testNet);
        else
          c.read<ChainSelectCubit>().changeBlockchain(Blockchain.mainNet);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        primary: c.colours.surface,
      ),
      child: Container(
        height: 120,
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Network',
                  style: c.fonts.button!.copyWith(
                    color: c.colours.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Only wallets from selected network will be displayed\n\nCurrent network:   ' +
                      blockchain.displayName.toUpperCase(),
                  maxLines: 3,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
