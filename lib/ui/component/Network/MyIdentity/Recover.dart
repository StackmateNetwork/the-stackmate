import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class RecoverMyIdentity extends StatefulWidget {
  const RecoverMyIdentity({Key? key}) : super(key: key);

  @override
  State<RecoverMyIdentity> createState() => _RecoverMyIdentityState();
}

class _RecoverMyIdentityState extends State<RecoverMyIdentity> {
  late TextEditingController _privateKeyController;

  @override
  void initState() {
    _privateKeyController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const loading = false;

    return IgnorePointer(
      ignoring: loading,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: loading ? 0.3 : 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Social Private Key'.toUpperCase(),
              style: context.fonts.overline!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _privateKeyController,
              style: TextStyle(color: context.colours.onBackground),
              decoration: InputDecoration(
                hintText: 'Enter your 24 digit Key'.toUpperCase(),
                errorText: '',
              ),
              onChanged: (t) {
                // context.read<SendCubit>().adddressChanged(t);
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.colours.primary,
                  onPrimary: context.colours.background,
                ),
                onPressed: () {},
                child: const Text('RECOVER'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
