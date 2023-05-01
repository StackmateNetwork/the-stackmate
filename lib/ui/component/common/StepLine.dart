import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class StepLine extends StatelessWidget {
  const StepLine({
    super.key,
    required this.length,
    required this.idx,
  });

  final int idx;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < length; i++)
          Expanded(
            child: Container(
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),

              // width: 50,
              decoration: BoxDecoration(
                color: i <= idx
                    ? context.colours.onSecondary.withOpacity(1)
                    : context.colours.onPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
      ],
    );
  }
}
