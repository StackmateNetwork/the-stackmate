import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class NetworkJoinForm extends StatefulWidget {
  @override
  State<NetworkJoinForm> createState() => _NetworkJoinFormState();
}

class _NetworkJoinFormState extends State<NetworkJoinForm> {
  late TextEditingController textController;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  void initState() {
    textController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: TextFormField(
              enableIMEPersonalizedLearning: false,
              autocorrect: false,
              controller: textController,
              validator: (val) {
                return null;
              },
              onChanged: (text) {},
              style: TextStyle(color: c.colours.onBackground),
              decoration: const InputDecoration(
                labelText: 'Host Domain',
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              icon: const Icon(Icons.https_outlined),
              tooltip: 'Check host',
              onPressed: () {},
            ),
          ),
          Text(
            'click to ping',
            style: c.fonts.bodySmall!.copyWith(
              color: c.colours.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.zero,
            child: TextFormField(
              enableIMEPersonalizedLearning: false,
              autocorrect: false,
              //controller: textController,
              validator: (val) {
                return null;
              },
              onChanged: (text) {},
              style: TextStyle(color: c.colours.onBackground),
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.zero,
            child: TextFormField(
              enableIMEPersonalizedLearning: false,
              autocorrect: false,
              //controller: textController,
              validator: (val) {
                return null;
              },
              onChanged: (text) {},
              style: TextStyle(color: c.colours.onBackground),
              decoration: const InputDecoration(
                labelText: 'Invite Code',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Need an invite code?'.notLocalised(),
                  style: c.fonts.button!.copyWith(color: c.colours.primary),
                ),
              ),
            ),
          ),
          const SizedBox(height: 54),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: c.colours.background,
                primary: c.colours.primary,
              ),
              onPressed: () {
                if (_form.currentState!.validate()) {
                  final FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  Navigator.pop(context);
                }
              },
              child: Text('JOIN'.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
