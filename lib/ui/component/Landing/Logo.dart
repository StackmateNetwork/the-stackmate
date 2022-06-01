import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Image.asset(
        'assets/icon/sm92.png',
        width: context.width,
        height: context.height / 2,
      ),
    );
  }
}
