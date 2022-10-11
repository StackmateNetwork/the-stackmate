import 'package:flutter/material.dart';
import 'package:sats/ui/component/Network/Messages.dart';

import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class _Chat extends StatelessWidget {
  const _Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 18),
              Header(
                cornerTitle: 'Messages'.toUpperCase(),
                children: [
                  Back(
                    onPressed: () {
                      Navigator.of(c).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 54),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ChatPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Chat();
  }
}
