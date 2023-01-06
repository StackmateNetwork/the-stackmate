import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:libcpclient/outputs.dart';
import 'package:sats/api/interface/cpsocket.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/network/chat.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';

class _NetworkChat extends StatelessWidget {
  const _NetworkChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final chatCubit = c.select((ChatCubit cc) => cc);
    // final myPubkey = c.select((SocialRootCubit sc) => sc.state.key!.pubkey);

    late List<types.Message> _messages = [];

    // chatCubit.state.chatHistory.map((e) => e.post.payload!.value).toList();

    CompletePost data;
    for (data in chatCubit.state.chatHistory) {
      final text = data.post.payload!.value;
      _messages.add(
        types.TextMessage(
          author: types.User(id: data.owner),
          id: data.id,
          text: text,
        ),
      );
    }

    Future<void> _handleSendPressed(types.PartialText message) async {
      await chatCubit.sendMessage(message.text);
    }

    return Scaffold(
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: types.User(id: chatCubit.state.counterParty),
        theme: DefaultChatTheme(
          backgroundColor: c.colours.background,
          errorColor: c.colours.error,
          inputTextColor: c.colours.onBackground,
          primaryColor: c.colours.primary,
          secondaryColor: c.colours.secondary,
          inputMargin: const EdgeInsets.all(5.0),
          receivedMessageBodyTextStyle: TextStyle(
            color: c.colours.background,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.428,
          ),
          sentMessageBodyTextStyle: TextStyle(
            color: c.colours.background,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.428,
          ),
        ),
      ),
    );
  }
}

class NetworkChatScreen extends StatelessWidget {
  const NetworkChatScreen({
    Key? key,
    required this.overviewCubit,
  }) : super(key: key);

  final OverviewCubit overviewCubit;

  @override
  Widget build(BuildContext c) {
    final chat = ChatCubit(
      locator<IStorage>(),
      c.read<Logger>(),
      locator<IClipBoard>(),
      locator<ICPSocket>(),
      c.read<TorCubit>(),
      c.read<SocialRootCubit>(),
      overviewCubit,
    );

    return BlocProvider.value(
      value: chat,
      child: const _NetworkChat(),
    );
  }
}
