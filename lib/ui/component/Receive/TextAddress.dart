import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/pkg/extensions.dart';

class TextAddress extends StatelessWidget {
  const TextAddress({
    Key? key,
    required this.address,
    required this.index,
  }) : super(key: key);

  final String address;
  final int index;
  @override
  Widget build(BuildContext c) {
    return Column(
      children: [
        Container(
          width: c.width / 1.2,
          child: Text(
            address,
            style: c.fonts.caption!.copyWith(
              color: c.colours.onPrimary,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () {
            c.read<ReceiveCubit>().copyAddress();
          },
          child: Text(
            'COPY',
            style: c.fonts.caption!.copyWith(
              color: c.colours.primary,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: c.width / 4,
          child: TextButton(
            onPressed: () {
              c.read<ReceiveCubit>().shareAddress();
            },
            child: Text(
              'SHARE'.notLocalised(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: c.width / 3,
              child: TextButton(
                onPressed: () {
                  c.read<ReceiveCubit>().getLastAddress();
                },
                child: Text(
                  '<'.notLocalised(),
                ),
              ),
            ),
            Container(
              width: c.width / 4,
              child: Text(
                'INDEX: ' + index.toString(),
                style: c.fonts.caption!.copyWith(
                  color: c.colours.onPrimary,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: c.width / 3,
              child: TextButton(
                onPressed: () {
                  c.read<ReceiveCubit>().getNewAddress();
                },
                child: Text(
                  '>'.notLocalised(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Always use a new address for each transaction.\nAdditionally, ensure not to create large gaps (10+) between used addresses.',
          style: c.fonts.bodySmall!.copyWith(
            color: c.colours.error,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
