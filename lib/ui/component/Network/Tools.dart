import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:go_router/go_router.dart';

class SocialTools extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _showTradeWarning(c);
                },
                icon: Icon(
                  Icons.currency_exchange,
                  size: 32,
                  color: c.colours.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  c.push('/messages');
                },
                icon: Icon(
                  Icons.message,
                  size: 24,
                  color: c.colours.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  c.push('/peers');
                },
                icon: Icon(
                  Icons.people,
                  size: 32,
                  color: c.colours.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> _showTradeWarning(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: context.colours.onPrimary,
        title: Text('P2P Trade Terms.', style: context.fonts.headline3!),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'You are responsible to protect yourself from fraud by being selective about who you trade with.\n',
                style: context.fonts.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'The role of escrows is to handle disputes.\n',
                style: context.fonts.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Only trade via Verified Escrows whom you Trust to be fair and fast in handling disputes.\n',
                style: context.fonts.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('I Agree.'),
            onPressed: () {
              Navigator.of(context).pop();
              context.push('/trades');
            },
          ),
        ],
      );
    },
  );
}
