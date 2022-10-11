import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class DiscoverSearch extends StatefulWidget {
  const DiscoverSearch({Key? key}) : super(key: key);

  @override
  DiscoverSearchState createState() {
    return DiscoverSearchState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class DiscoverSearchState extends State<DiscoverSearch> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext c) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFormField(
              enableIMEPersonalizedLearning: false,
              autocorrect: false,
              obscureText: false,
              validator: (val) {
                return null;
              },
              onChanged: (text) {},
              style: TextStyle(color: c.colours.onBackground),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Search username,pubkey',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 204.0),
            child: SizedBox(
              child: IconButton(
                icon: const Icon(Icons.search_sharp),
                tooltip: 'Check username',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
