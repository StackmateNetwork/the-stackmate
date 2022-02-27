import 'package:flutter/material.dart';
import 'package:sats/cubit/calculator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';

class CalcKey extends StatefulWidget {
  const CalcKey({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _CalcKeyState createState() => _CalcKeyState();
}

class _CalcKeyState extends State<CalcKey> {
  // double _elevation = 2.0;

  @override
  Widget build(BuildContext c) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          // _elevation = 0;
        });
      },
      onTapUp: (details) {
        setState(() {
          // _elevation = 2;
        });
      },
      onTapCancel: () {
        setState(() {
          // _elevation = 0;
        });
      },
      onTap: () {
        c.read<CalculatorCubit>().calcKeyPressed(widget.text);
      },
      child: Container(
        width: (c.width / 5) - 5,
        height: (c.width / 5) - 5,
        child: Material(
          elevation: 1, //_elevation,
          color: Validation.isNumeric(widget.text)
              ? Colors.transparent
              : c.colours.surface,
          child: Center(
            child: Text(
              widget.text,
              style: c.fonts.headline6!.copyWith(color: c.colours.primary),
            ),
          ),
        ),
      ),
    );
  }
}
