import 'package:flutter/material.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/pkg/extensions.dart';

class SetBitcoinUnit extends StatelessWidget {
  const SetBitcoinUnit({super.key});

  @override
  Widget build(BuildContext c) {
    final preferredBitcoinUnit =
        c.select((PreferencesCubit p) => p.state.preferredBitcoinUnit);
    return ElevatedButton(
      onPressed: () {
        c.read<PreferencesCubit>().preferredBitcoinUnitChanged();
        c.read<PreferencesCubit>().saveClicked();
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
                  'Unit'.toUpperCase(),
                  style: c.fonts.labelLarge!.copyWith(
                    color: c.colours.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  preferredBitcoinUnit,
                  maxLines: 3,
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.paid_outlined,
              size: 24,
              color: c.colours.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
