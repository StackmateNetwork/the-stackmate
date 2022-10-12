import 'package:flutter/material.dart';
import 'package:sats/ui/component/Network/ChatDirectory.dart';
//import 'package:sats/ui/component/Network/Messages.dart';

import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _Chat extends StatelessWidget {
  const _Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return const ChatDirectory();
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Chat();
  }
}
