import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class RegisterMyIdentity extends StatefulWidget {
  const RegisterMyIdentity({Key? key}) : super(key: key);

  @override
  State<RegisterMyIdentity> createState() => _RegisterMyIdentityState();
}

class _RegisterMyIdentityState extends State<RegisterMyIdentity> {
  late TextEditingController _usernymController;
  late TextEditingController _inviteCodeController;

  @override
  void initState() {
    _usernymController = TextEditingController();
    _inviteCodeController = TextEditingController();

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
              'Username'.toUpperCase(),
              style: context.fonts.overline!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernymController,
              style: TextStyle(color: context.colours.onBackground),
              decoration: InputDecoration(
                hintText: 'Choose a unique nym'.toUpperCase(),
                errorText: '',
              ),
              onChanged: (t) {
                // context.read<SendCubit>().adddressChanged(t);
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Invite Code'.toUpperCase(),
              style: context.fonts.overline!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _inviteCodeController,
              style: TextStyle(color: context.colours.onBackground),
              decoration: InputDecoration(
                hintText: 'Ask an existing user'.toUpperCase(),
                errorText: '',
              ),
              onChanged: (t) {
                // context.read<SendCubit>().adddressChanged(t);
              },
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('PASTE'),
                ),
              ],
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
                child: const Text('JOIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
