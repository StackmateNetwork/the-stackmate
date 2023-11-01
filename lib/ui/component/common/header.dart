import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/CornerTitle.dart';
import 'package:sats/ui/component/common/LogButton.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.cornerTitle, required this.children});

  final String cornerTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext c) {
    return Material(
      // elevation: 0,
      type: MaterialType.transparency,
      child: Container(
        width: c.width,
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          // bottom: 0,
        ),
        decoration: BoxDecoration(
          color: c.colours.background,
        ),
        child: Stack(
          children: [
            FadeIn(
              delay: const Duration(milliseconds: 200),
              duration: const Duration(seconds: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: LogButton(child: CornerTitle(text: cornerTitle)),
            ),
          ],
        ),
      ),
    );
  }
}
