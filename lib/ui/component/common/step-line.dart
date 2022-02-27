import 'package:flutter/material.dart';

class StepLine extends StatelessWidget {
  const StepLine({
    Key? key,
    required this.length,
    required this.idx,
  }) : super(key: key);

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
                color: i <= idx ? Colors.blue.withOpacity(0.4) : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
      ],
    );
  }
}
