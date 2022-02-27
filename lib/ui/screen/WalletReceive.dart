import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sats/cubit/wallet/receive.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';
import 'package:sats/ui/component/common/loading.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select((ReceiveCubit h) => h.state.loadingAddress);

    if (!loading) return Container();

    return const Loading(text: 'Gettting Address');
  }
}

class QR extends StatelessWidget {
  const QR({
    Key? key,
    required this.address,
  }) : super(key: key);

  final String address;

  @override
  Widget build(BuildContext c) {
    return Center(
      child: Container(
        width: c.width * 0.7,
        height: c.width * 0.7,
        color: c.colours.onBackground,
        child: QrImage(
          data: address,
          // version: QrVersions.auto,
        ),
      ),
    );
  }
}

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
          width: c.width / 3,
          child: Text(
            address,
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            c.read<ReceiveCubit>().copyAddress();
            //.copyAddress(address);
          },
          child: const Text('COPY'),
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

class ReceivePage extends StatelessWidget {
  const ReceivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final state = c.select((ReceiveCubit h) => h.state);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Loader(),
              Header(
                cornerTitle: 'STACKMATE',
                children: [
                  const SizedBox(height: 8),
                  const Back(),
                  const SizedBox(height: 60),
                  Text(
                    ' RECEIVE',
                    style: c.fonts.headline4!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
              if (state.address != null) ...[
                FadeIn(
                  // delay: const Duration(milliseconds: 400),
                  child: QR(address: state.address!),
                ),
                const SizedBox(height: 24),
                FadeIn(
                  delay: const Duration(milliseconds: 300),
                  child: TextAddress(address: state.address!),
                ),
                const SizedBox(height: 48),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
