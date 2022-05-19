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
          width: c.width,
          child: Text(
            address,
            style: c.fonts.caption!.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () {
            c.read<ReceiveCubit>().copyAddress();
            //.copyAddress(address);
          },
          child: Text(
            'COPY',
            style: c.fonts.caption!.copyWith(
              color: Colors.blue,
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
              //.shareAddress(address);
            },
            child: Text(
              'SHARE'.notLocalised(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: c.width / 4,
          child: Text(
            'INDEX: ' + index.toString(),
            style: c.fonts.caption!.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: c.width / 4,
          child: TextButton(
            onPressed: () {
              c.read<ReceiveCubit>().getAddress();
              //.shareAddress(address);
            },
            child: Text(
              'ROTATE'.notLocalised(),
            ),
          ),
        )
      ],
    );
  }
}
