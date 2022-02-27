import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class CornerTitle extends StatelessWidget {
  const CornerTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext c) {
    return Text(
      text,
      textAlign: TextAlign.end,
      style: c.fonts.headline6!.copyWith(
        color: Colors.white,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
