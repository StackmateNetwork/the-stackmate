import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class Back extends StatelessWidget {
  const Back({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final Function? onPressed;

  @override
  Widget build(BuildContext c) {
    return GestureDetector(
      onTap: () {
        if (onPressed == null) {
          Navigator.pop(c);
          return;
        }
        onPressed!();
      },
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 0),
          Icon(
            Icons.arrow_back_ios_outlined,
            size: 16,
            color: c.colours.primary,
            // Colors.white,
          ),
          const SizedBox(width: 4),
          Padding(
            padding: EdgeInsets.zero,
            child: Text(
              'Back',
              style: c.fonts.button!.copyWith(
                color: c.colours.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
