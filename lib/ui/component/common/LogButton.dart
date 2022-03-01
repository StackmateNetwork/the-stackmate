import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        context.push('/logs');
      },
      child: child,
    );
  }
}
