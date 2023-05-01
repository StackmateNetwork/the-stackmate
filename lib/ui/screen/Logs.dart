import 'package:flutter/material.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Logs/Item.dart';

class _Logs extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final logs = c.select((Logger l) => l.state.logs);
    return Scaffold(
      backgroundColor: c.colours.background,
      appBar: AppBar(
        title: const Text(
          'LOGS',
          style: TextStyle(
              // color: Colors.black,
              ),
        ),
        backgroundColor: c.colours.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(c);
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => LogItem(logs[index]),
        itemCount: logs.length,
      ),
    );
  }
}

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = context.select((Logger c) => c);

    return BlocProvider.value(
      value: logger,
      child: _Logs(),
    );
  }
}
