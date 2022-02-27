import 'package:flutter/material.dart';
import 'package:sats/routes.dart';

class LogButton extends StatelessWidget {
  const LogButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pushNamed(context, Routes.logs);
      },
      child: child,
    );
  }
}
