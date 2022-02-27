import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/inheritance-with-old-seed.dart';
import 'package:sats/pkg/extensions.dart';

class TimerSettings extends StatelessWidget {
  const TimerSettings({Key? key}) : super(key: key);

  void _selectDate(BuildContext c, {DateTime? date}) async {
    final dt = await showDatePicker(
      context: c,
      initialDate: date ?? DateTime(2022),
      firstDate: DateTime(2022),
      lastDate: DateTime(3000),
    );

    if (dt != null && dt != date) {
      c.read<InheritanceWithOldSeedCubit>().dateSelected(dt);
    }
  }

  @override
  Widget build(BuildContext c) {
    final date = c.select((InheritanceWithOldSeedCubit itc) => itc.state.date);
    final err =
        c.select((InheritanceWithOldSeedCubit itc) => itc.state.errDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        if (date == null)
          Text(
            '   No Date Selected',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          )
        else
          Text(
            '   ' + date.toString(),
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              _selectDate(c, date: date);
            },
            child: Text(
              'Select Inheritance Unlock Date'.toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 80),
        if (err != '') ...[
          Text(
            err,
            style: c.fonts.caption!.copyWith(
              color: c.colours.error,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextButton(
          onPressed: () {
            c.read<InheritanceWithOldSeedCubit>().nextClicked();
          },
          child: const Text(
            'Confirm',
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
