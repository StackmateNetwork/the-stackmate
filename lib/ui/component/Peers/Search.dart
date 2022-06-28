import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class SearchPeers extends StatefulWidget {
  const SearchPeers({Key? key}) : super(key: key);

  @override
  State<SearchPeers> createState() => _SearchPeersState();
}

class _SearchPeersState extends State<SearchPeers> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        style: TextStyle(color: context.colours.onBackground),
        decoration: InputDecoration(
          hintText: 'Search By Username or Pubkey'.toUpperCase(),
          errorText: '',
        ),
        onChanged: (t) {},
      ),
    );
  }
}
