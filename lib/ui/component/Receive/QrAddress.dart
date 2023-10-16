import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sats/pkg/extensions.dart';

class QRAddress extends StatelessWidget {
  const QRAddress({
    super.key,
    required this.address,
  });

  final String address;

  @override
  Widget build(BuildContext c) {
    return Center(
      child: Container(
        width: c.width * 0.7,
        height: c.width * 0.7,
        color: c.colours.onBackground,
        child: QrImageView(
          data: address,
          // version: QrVersions.auto,
        ),
      ),
    );
  }
}
