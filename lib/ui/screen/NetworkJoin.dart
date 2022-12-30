import 'package:flutter/material.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/cypherpost-mock.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/Network/Loader.dart';
import 'package:sats/ui/component/Network/NetworkJoinForm.dart';

import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';
import 'package:sats/ui/component/common/SuccessHandler.dart';
import 'package:sats/ui/component/common/header.dart';

class _NetworkJoin extends StatelessWidget {
  const _NetworkJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
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
    final torCubit = context.select((TorCubit c) => c);
    final logger = context.select((Logger c) => c);
    final socialRoot = context.select((SocialRootCubit c) => c);

    final networksCubit = NetworksCubit(
      locator<IStorage>(),
      logger,
      locator<IClipBoard>(),
      torCubit,
      socialRoot,
    );

    return BlocProvider.value(
      value: networksCubit,
      child: const _NetworkJoin(),
    );
  }
}
