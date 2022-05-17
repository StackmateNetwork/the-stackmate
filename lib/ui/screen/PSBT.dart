import 'package:flutter/material.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/PSBT/Broadcast.dart';

class _PSBTTools extends StatelessWidget {
  const _PSBTTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              children: [
                const SizedBox(width: 16),
                Back(
                  onPressed: () {
                    Navigator.of(c).pop();
                  },
                ),
                const Spacer(),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 32),
            BroadcastPSBT()
          ],
        ),
      ),
    );
  }
}

class PSBTScreen extends StatelessWidget {
  const PSBTScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _PSBTTools();
  }
}
