import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class SendAddress extends StatefulWidget {
  const SendAddress({Key? key}) : super(key: key);

  @override
  State<SendAddress> createState() => _SendAddressState();
}

class _SendAddressState extends State<SendAddress> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final address = context.select((SendCubit sc) => sc.state.address);
    final errAddress = context.select((SendCubit sc) => sc.state.errAddress);
    final loading = context.select((SendCubit sc) => sc.state.loadingStart);

    if (address != _controller.text) _controller.text = address;

    return IgnorePointer(
      ignoring: loading,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: loading ? 0.3 : 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'To Address'.toUpperCase(),
              style: context.fonts.overline!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              style: TextStyle(color: context.colours.onBackground),
              decoration: InputDecoration(
                hintText: 'Enter Address'.toUpperCase(),
                errorText: errAddress.nullIfEmpty(),
              ),
              onChanged: (t) {
                context.read<SendCubit>().adddressChanged(t);
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<SendCubit>().pasteAddress();
                  },
                  child: const Text('PASTE'),
                ),
                IconButton(
                  onPressed: () {
                    context.read<SendCubit>().scanAddress(false);
                  },
                  icon: Icon(
                    Icons.qr_code,
                    size: 32,
                    color: context.colours.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: context.colours.background,
                  backgroundColor: context.colours.primary,
                ),
                onPressed: () {
                  context.read<SendCubit>().addressConfirmedClicked();
                },
                child: const Text('CONFIRM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
