import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          child: Image.asset(
            'assets/icon/sm92.png',
            width: 400,
            height: 200,
          ),
        ),
      ],
    );
  }
}
