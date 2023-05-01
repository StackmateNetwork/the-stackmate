import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class Back extends StatelessWidget {
  const Back({
    super.key,
    this.onPressed,
  });

  final Function? onPressed;

  @override
  Widget build(BuildContext c) {
    return FadeIn(
      delay: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          if (onPressed == null) {
            Navigator.pop(c);
            return;
          }
          onPressed!();
        },
        child: SizedBox(
          height: 24,
          child: Row(
            children: [
              const SizedBox(width: 4),
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
                  style: c.fonts.labelLarge!.copyWith(
                    color: c.colours.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
