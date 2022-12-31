import 'package:flutter/material.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Network/Loader.dart';
import 'package:sats/ui/component/Network/NetworkJoinForm.dart';

import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _NetworkJoin extends StatelessWidget {
  const _NetworkJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final networksCubit = c.select((NetworksCubit n) => n);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Loader(),
              const SizedBox(height: 24),
              Header(
                cornerTitle: 'Join Network '.toUpperCase(),
                children: [
                  Back(
                    onPressed: () {
                      networksCubit.clear();
                      Navigator.of(c).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 54),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: NetworkJoinForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NetworkJoinScreen extends StatelessWidget {
  const NetworkJoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _NetworkJoin();
  }
}
