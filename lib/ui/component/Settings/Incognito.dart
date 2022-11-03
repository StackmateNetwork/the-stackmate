import 'package:flutter/material.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/pkg/extensions.dart';

class SetIncognito extends StatelessWidget {
  const SetIncognito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final incognito = c.select((PreferencesCubit p) => p.state.incognito);
    return ElevatedButton(
      onPressed: () {
        c.read<PreferencesCubit>().incognitoChanged();
        c.read<PreferencesCubit>().saveClicked();
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
                  'Incognito'.toUpperCase(),
                  style: c.fonts.button!.copyWith(
                    color: c.colours.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  incognito ? 'On' : 'Off',
                  maxLines: 3,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.hide_source,
              size: 24,
              color: c.colours.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
