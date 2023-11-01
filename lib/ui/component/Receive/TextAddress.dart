import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/pkg/extensions.dart';

class TextAddress extends StatelessWidget {
  const TextAddress({
    super.key,
    required this.address,
    required this.index,
  });

  final String address;
  final int index;
  @override
  Widget build(BuildContext c) {
    final loading = c.select((ReceiveCubit h) => h.state.loadingAddress);

    return Column(
      children: [
        Container(
          width: c.width / 1.2,
          child: Text(
            address,
            style: c.fonts.bodySmall!.copyWith(
              color: c.colours.onPrimary,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (!loading)
          TextButton(
            onPressed: () {
              c.read<ReceiveCubit>().copyAddress();
            },
            child: Text(
              'COPY',
              style: c.fonts.bodySmall!.copyWith(
                color: c.colours.primary,
                fontSize: 18,
              ),
            ),
          ),
        const SizedBox(height: 24),
        if (!loading)
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
                style: c.fonts.bodySmall!.copyWith(
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
          'Wait for the wallet to load the best address to use.\nIf manually indexing addresses\n ensure not to create large gaps (10+)\nbetween used addresses.',
          style: c.fonts.bodySmall!.copyWith(
            color: c.colours.error,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
