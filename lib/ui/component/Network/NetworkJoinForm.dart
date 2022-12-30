import 'package:flutter/material.dart';
import 'package:sats/cubit/networks.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';
import 'package:sats/ui/component/common/SuccessHandler.dart';

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
    final name = c.select((NetworksCubit nc)=> nc.state.name);

    return BlocListener<NetworksCubit, NetworksState>(
      listener: (c, s) {
        if (s.error != '') {
          handleError(c, s.error);
        }
        // if (s.name != '') {
        //   handleSuccess(c, s.name!);
        // }
      },
      child: WillPopScope(
        onWillPop: () async {
          c.read<NetworksCubit>().clear();
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
              else Column(
                children: [
              SizedBox(
                child: IconButton(
                  icon: const Icon(Icons.network_check),
                  color: context.colours.secondary,
                  tooltip: 'Found Host',
                  onPressed: () {
                    
                  },
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
                    onTap: () {},
                    child: Text(
                      'Need an invite code?'.notLocalised(),
                      style: c.fonts.button!.copyWith(color: c.colours.primary),
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
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      final FocusScopeNode currentFocus =
                          FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: Text('JOIN'.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
