import 'package:flutter/material.dart';
import 'package:sats/cubit/reddit.dart';
import 'package:sats/pkg/extensions.dart';

class RedditLoader extends StatelessWidget {
  const RedditLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final loading = c.select((RedditCubit c) => c.state.loading);

    if (loading) return const LinearProgressIndicator();

    return Container();
  }
}
