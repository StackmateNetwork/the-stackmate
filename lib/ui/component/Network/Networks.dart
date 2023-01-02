import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/ui/component/Network/NetworkCard.dart';

class Networks extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final networks = c.select((NetworksCubit nc) => nc.state.networks);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          for (var n in networks) ...[
            const SizedBox(height: 10),
            BlocProvider.value(
              value: OverviewCubit(
                locator<IStorage>(),
                c.read<Logger>(),
                c.read<TorCubit>(),
                c.read<SocialRootCubit>(),
                n,
              ),
              child: NetworkCard(network: n),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
