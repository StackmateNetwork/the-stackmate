import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class BckButton extends StatelessWidget {
  const BckButton({super.key, required this.text, required this.onTapped});

  final String text;
  final Function onTapped;

  @override
  Widget build(BuildContext c) {
    return InkWell(
      onTap: () {
        onTapped();
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back_ios_sharp,
            color: c.colours.onSurface,
            size: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2, left: 4),
            child: Text(
              text,
              style: c.fonts.labelLarge!.copyWith(color: c.colours.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
