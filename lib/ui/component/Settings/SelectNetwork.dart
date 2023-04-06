import 'package:flutter/material.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/SuccessHandler.dart';

class SelectNetwork extends StatelessWidget {
  const SelectNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final blockchain = c.select((ChainSelectCubit b) => b.state.blockchain);
    return ElevatedButton(
      onPressed: () {
        if (blockchain == Blockchain.main) {
          c.read<ChainSelectCubit>().changeBlockchain(Blockchain.test);
          handleHelp(c, 'Modify full node uri or click on reset to default');
        } else {
          c.read<ChainSelectCubit>().changeBlockchain(Blockchain.main);
          handleHelp(c, 'Modify full node uri or click on reset to default');
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: c.colours.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Container(
        height: 80,
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
                  'Network'.toUpperCase(),
                  style: c.fonts.button!.copyWith(
                    color: c.colours.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  blockchain.displayName,
                  maxLines: 3,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.public_rounded,
              size: 24,
              color: c.colours.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
