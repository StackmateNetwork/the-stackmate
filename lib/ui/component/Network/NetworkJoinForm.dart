import 'package:flutter/material.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

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
    final networksCubit = c.select((NetworksCubit n) => n);
    final name = c.select((NetworksCubit nc) => nc.state.name);

    return BlocListener<NetworksCubit, NetworksState>(
      listener: (c, s) {
        if (s.error != '') {
          handleError(c, s.error);
        }
        if (s.joined) {
          networksCubit.clear();
          Navigator.of(c).pop();
        }
      },
      child: BlocBuilder<NetworksCubit, NetworksState>(
        builder: (context, state) {
          return IgnorePointer(
            ignoring: state.loading != '',
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: state.loading != '' ? 0.5 : 1,
              child: WillPopScope(
                onWillPop: () async {
                  networksCubit.clear();
                  return true;
                },
                child: Form(
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
                          onChanged: (text) {
                            networksCubit.hostnameChanged(text);
                          },
                          style: TextStyle(color: c.colours.onBackground),
                          decoration: const InputDecoration(
                            labelText: 'Host Domain',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //SizedBox
                            Text(
                              'Existing User:',
                              style: c.fonts.bodySmall!.copyWith(
                                color: c.colours.secondary,
                              ),
                            ), //Text
                            Checkbox(
                              value: networksCubit.state.existingUser,
                              // ignore: avoid_types_as_parameter_names
                              onChanged: (bool) {
                                networksCubit.toggleExistingUser();
                              },
                              activeColor: c.colours.background,
                              focusColor: c.colours.background,
                              checkColor: c.colours.secondary,
                              hoverColor: c.colours.primary,
                            ),
                          ],
                        ),
                      ),
                      if (name == null)
                        Column(
                          children: [
                            SizedBox(
                              child: IconButton(
                                icon: const Icon(Icons.network_ping),
                                color: context.colours.primary,
                                tooltip: 'Ping Server',
                                onPressed: () async {
                                  await networksCubit.pingHost();
                                },
                              ),
                            ),
                            Text(
                              'Ping Host',
                              style: c.fonts.bodySmall!.copyWith(
                                color: c.colours.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            SizedBox(
                              child: IconButton(
                                icon: const Icon(Icons.network_check),
                                color: context.colours.secondary,
                                tooltip: 'Found Host',
                                onPressed: () {},
                              ),
                            ),
                            Text(
                              'Found Host!',
                              style: c.fonts.bodySmall!.copyWith(
                                color: c.colours.secondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              name,
                              style: c.fonts.bodyMedium!.copyWith(
                                color: c.colours.secondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      const SizedBox(height: 15),
                      if (!state.existingUser) ...[
                        Padding(
                          padding: EdgeInsets.zero,
                          child: TextFormField(
                            enableIMEPersonalizedLearning: false,
                            autocorrect: false,
                            //controller: textController,
                            validator: (val) {
                              return null;
                            },
                            onChanged: (text) {
                              networksCubit.usernameChanged(text);
                            },
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
                            onChanged: (text) {
                              networksCubit.inviteCodeChanged(text);
                            },
                            style: TextStyle(color: c.colours.onBackground),
                            decoration: const InputDecoration(
                              labelText: 'Invite Code',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                inviteCodeHelp(c);
                              },
                              child: Text(
                                'Need an invite code?'.notLocalised(),
                                style: c.fonts.button!
                                    .copyWith(color: c.colours.primary),
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
                            onPressed: () async {
                              networksCubit.join();
                            },
                            child: Text('JOIN'.toUpperCase()),
                          ),
                        ),
                      ] else ...[
                        SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: c.colours.background,
                              primary: c.colours.primary,
                            ),
                            onPressed: () async {
                              await networksCubit.resyncExistingUser();
                            },
                            child: Text('RE-SYNC'.toUpperCase()),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<void> inviteCodeHelp(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24.0),
        insetPadding: const EdgeInsets.all(24.0),
        backgroundColor: context.colours.onPrimaryContainer,
        elevation: 2.0,
        title: Text(
          'INVITE  CODES',
          style: context.fonts.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colours.onPrimary,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'To get an invite code you need to ask either:\n\n- AN ADMIN\n- A PRIVELAGED USER\n',
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: context.colours.onPrimary,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      );
    },
  );
}
