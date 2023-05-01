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
        elevation: 0, backgroundColor: c.colours.surface,
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
                  'Full Node'.toUpperCase(),
                  style: c.fonts.labelLarge!.copyWith(
                    color: c.colours.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    nodeString,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: c.fonts.bodySmall!.copyWith(
                      color: c.colours.primary,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.private_connectivity_rounded,
              size: 32,
              color: c.colours.primary,
            ),
          ],
        ),
      ),
    );
  }
}
