import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Stackmate'.toUpperCase(),
          style: context.fonts.headline3!.copyWith(
            color: context.colours.primary,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Self-sovereign tools for bitcoin finance.'.toUpperCase(),
          style: context.fonts.caption!.copyWith(
            color: context.colours.onPrimary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
