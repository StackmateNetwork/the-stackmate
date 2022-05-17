import 'package:flutter/material.dart';
import 'package:sats/cubit/psbt-tool.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class BroadcastPSBT extends StatefulWidget {
  const BroadcastPSBT({Key? key}) : super(key: key);

  @override
  State<BroadcastPSBT> createState() => PSBTState();
}

class PSBTState extends State<BroadcastPSBT> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 32),
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
          TextField(
            controller: _controller,
            style: TextStyle(color: context.colours.onBackground),
            decoration: InputDecoration(
              hintText: 'Enter PSBT'.toUpperCase(),
              errorText: '',
            ),
            onChanged: (t) {
              context.read<PSBTCubit>().psbtChanged(t);
            },
          ),
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
          const SizedBox(height: 100),
          TextButton(
            onPressed: () {
              context.read<PSBTCubit>().broadcastConfirmed();
            },
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }
}
