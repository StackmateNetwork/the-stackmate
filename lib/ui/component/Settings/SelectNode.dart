import 'package:flutter/material.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Settings/EditNode.dart';

class SelectNode extends StatelessWidget {
  const SelectNode();

  @override
  Widget build(BuildContext c) {
    final isEditting = c.select((NodeAddressCubit nac) => nac.state.isEditing);
    final nodeString =
        c.select((NodeAddressCubit nac) => nac.state.mainString());

    if (isEditting) return const EditNode();
    return ElevatedButton(
      onPressed: () {
        c.read<NodeAddressCubit>().toggleIsEditting();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        primary: c.colours.surface,
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
                  'Change Electrum Node',
                  style: c.fonts.button!.copyWith(
                    color: c.colours.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    nodeString,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: c.fonts.bodyMedium!.copyWith(
                      color: c.colours.onSurface.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icon/bitcoin_icons/png/outline/home.png',
              width: 52,
              height: 52,
              color: c.colours.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
