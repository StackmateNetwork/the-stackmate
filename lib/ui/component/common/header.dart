import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/corner-title.dart';
import 'package:sats/ui/component/common/log-button.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.cornerTitle, required this.children})
      : super(key: key);

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
          color: c.colours.secondary,
          //boxShadow: [
          //  BoxShadow(
          //    offset: Offset(0, 2),
          //    blurRadius: 3,
          //    spreadRadius: 3,
          //  ),
          //],
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
            )
          ],
        ),
      ),
    );
  }
}
