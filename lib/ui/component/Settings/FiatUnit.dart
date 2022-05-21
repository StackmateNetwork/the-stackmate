import 'package:flutter/material.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/pkg/extensions.dart';

class SetFiatUnit extends StatelessWidget {
  const SetFiatUnit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final preferredFiatUnit =
        c.select((PreferencesCubit p) => p.state.preferredFiatUnit);
    return ElevatedButton(
      onPressed: () {
        c.read<PreferencesCubit>().preferredFiatUnitChanged('INR');
        c.read<PreferencesCubit>().saveClicked();
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
                  'Fiat Unit',
                  style: c.fonts.button!.copyWith(
                    color: c.colours.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  preferredFiatUnit,
                  maxLines: 3,
                  style: c.fonts.bodyMedium!.copyWith(
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
