import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sats/cubit/psbt-tool.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class BroadcastPSBT extends StatefulWidget {
  const BroadcastPSBT({Key? key}) : super(key: key);

  @override
  State<BroadcastPSBT> createState() => PSBTBroacastState();
}

class PSBTBroacastState extends State<BroadcastPSBT> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<PSBTCubit, PSBTState>(
      builder: (context, psbtState) {
        if (psbtState.txId != '' || psbtState.errBroadcasting != '')
          _controller = TextEditingController();
        return Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'PSBT To Broadcast'.toUpperCase(),
                style: context.fonts.overline!.copyWith(
                  color: context.colours.onBackground,
                ),
              ),
              const SizedBox(height: 16),
              if (psbtState.psbt == '')
                const Text(
                    'Paste a PSBT from your Clipboard OR Import from File.')
              else
                const Text('Got PSBT.'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<PSBTCubit>().pastePSBT();
                    },
                    child: const Text('PASTE'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  context.read<PSBTCubit>().broadcastConfirmed();
                },
                child: const Text('CONFIRM'),
              ),
              if (psbtState.txId != '')
                Text(
                  psbtState.txId,
                  textAlign: TextAlign.center,
                  style: context.fonts.headline6!.copyWith(
                    color: context.colours.onBackground,
                  ),
                )
              else
                Container(),
              if (psbtState.errBroadcasting != '')
                Text(
                  psbtState.errBroadcasting,
                  textAlign: TextAlign.center,
                  style: context.fonts.caption!.copyWith(
                    color: context.colours.error,
                  ),
                )
              else
                Container(),
            ],
          ),
        );
      },
    );
  }
}
