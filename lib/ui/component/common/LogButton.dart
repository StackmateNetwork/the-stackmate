import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogButton extends StatelessWidget {
  const LogButton({
    super.key,
    required this.child,
  });

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
