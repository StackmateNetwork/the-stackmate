import 'package:flutter/material.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/pkg/extensions.dart';

class SetIncognito extends StatelessWidget {
  const SetIncognito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final preferences = c.select((PreferencesCubit p) => p);
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, prefState) {
        return ElevatedButton(
          onPressed: () {
            preferences.incognitoChanged();
            preferences.saveClicked();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
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
                      'Incognito Default',
                      style: c.fonts.button!.copyWith(
                        color: c.colours.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Will use incognito mode by default:\n' +
                          prefState.incognito.toString().toUpperCase(),
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
      },
    );
  }
}
