import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/pkg/extensions.dart';

class TextAddress extends StatelessWidget {
  const TextAddress({
    Key? key,
    required this.address,
  }) : super(key: key);

  final String address;
  @override
  Widget build(BuildContext c) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: c.width / 2,
          child: Text(
            address,
            style: c.fonts.caption!.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
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
        const SizedBox(height: 48),
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
        )
      ],
    );
  }
}
