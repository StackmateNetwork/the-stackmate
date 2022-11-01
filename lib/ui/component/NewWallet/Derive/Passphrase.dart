import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/derivation.dart';
import 'package:sats/pkg/extensions.dart';

class DerivePassphrase extends StatefulWidget {
  @override
  State<DerivePassphrase> createState() => _DerivePassphraseState();
}

class _DerivePassphraseState extends State<DerivePassphrase> {
  late TextEditingController _textController;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<DeriveWalletCubit, DeriveWalletState>(
      builder: (context, state) {
        if (_textController.text != state.passPhrase)
          _textController.text = state.passPhrase;
        return Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'optional\npassphrase'.toUpperCase(),
                style: c.fonts.headline5!.copyWith(
                  color: c.colours.onPrimary,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.zero,
                child: TextFormField(
                  enableIMEPersonalizedLearning: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: _textController,
                  validator: (val) {
                    return null;
                  },
                  onChanged: (text) {
                    c.read<DeriveWalletCubit>().passPhrasedChanged(text);
                  },
                  style: TextStyle(color: c.colours.onBackground),
                  decoration: const InputDecoration(
                    labelText: 'Passphrase',
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: c.colours.background,
                    primary: c.colours.primary,
                  ),
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      final FocusScopeNode currentFocus =
                          FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      c.read<DeriveWalletCubit>().nextClicked();
                    }
                  },
                  child: Text('Confirm'.toUpperCase()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
