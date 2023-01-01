import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkCard extends StatelessWidget {
  const NetworkCard({
    Key? key,
    this.isSelection = false,
    required this.network,
  }) : super(key: key);

  final NetworkIdentity network;
  final bool isSelection;

  @override
  Widget build(BuildContext c) {
    return GestureDetector(
      onTap: () {
        c.push('/network-overview');
      },
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: c.colours.background,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            // sigmaX: 0,
            // sigmaY: 0,
            tileMode: TileMode.mirror,
          ),
          child: Container(
            height: 92,
            width: c.width,
            padding: const EdgeInsets.only(
              top: 16,
              left: 12,
              right: 12,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                // end: Alignment.centerRight,
                stops: const [0.3, 0.99],
                colors: [
                  c.colours.surface,
                  c.colours.surface,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  network.name,
                  style: c.fonts.subtitle1!.copyWith(
                    color: c.colours.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  network.kind,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.secondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
