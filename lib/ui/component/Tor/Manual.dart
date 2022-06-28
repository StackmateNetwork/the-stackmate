import 'package:flutter/material.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/pkg/extensions.dart';

class ManualTor extends StatelessWidget {
  const ManualTor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tor = context.select((TorCubit sc) => sc.state);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            await context.read<TorCubit>().toggleEnforce();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            primary: context.colours.surface,
          ),
          child: Container(
            height: 90,
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DEFAULT',
                      style: context.fonts.button!.copyWith(
                        color: context.colours.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Privacy lost once, is lost forever.',
                      maxLines: 3,
                      style: context.fonts.caption!.copyWith(
                        color: context.colours.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tor.enforced ? 'ON' : 'OFF',
                      maxLines: 3,
                      style: context.fonts.bodyMedium!.copyWith(
                        color: context.colours.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/icon/bitcoin_icons/png/outline/proxy.png',
                  width: 52,
                  height: 52,
                  color: context.colours.onTertiary,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            context.read<TorCubit>().toggleInternal();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            primary: context.colours.surface,
          ),
          child: Container(
            height: 90,
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Use External Tor',
                      style: context.fonts.button!.copyWith(
                        color: context.colours.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Use an external tor instance by default.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: context.fonts.bodyMedium!.copyWith(
                        color: context.colours.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      !tor.internal ? 'ON' : 'OFF',
                      maxLines: 3,
                      style: context.fonts.bodyMedium!.copyWith(
                        color: context.colours.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/icon/bitcoin_icons/png/outline/link.png',
                  width: 52,
                  height: 52,
                  color: context.colours.onPrimary,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (!tor.internal) const ExternalTor(),
      ],
    );
  }
}

class ExternalTor extends StatefulWidget {
  const ExternalTor({Key? key}) : super(key: key);

  @override
  _ExternalTorState createState() => _ExternalTorState();
}

class _ExternalTorState extends State<ExternalTor> {
  late TextEditingController _socks5Port;

  @override
  void initState() {
    _socks5Port = TextEditingController();
    super.initState();
  }

  void _checkFields(TorState state) {
    if (_socks5Port.text != state.socks5Port.toString())
      _socks5Port.text = state.socks5Port.toString();
  }

  @override
  Widget build(BuildContext c) {
    final torState = c.select((TorCubit tor) => tor.state);
    _checkFields(torState);

    return Container(
      color: c.colours.surface,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'External SockS5 Proxy'.toUpperCase(),
            style: c.fonts.button!.copyWith(
              color: c.colours.onBackground,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Check your external Tor app.',
            maxLines: 3,
            style: c.fonts.caption!.copyWith(
              color: c.colours.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          TextField(
            controller: _socks5Port,
            autocorrect: false,
            style: TextStyle(color: context.colours.onBackground),
            decoration: InputDecoration(
              hintText: 'Enter SockS5Port'.toUpperCase(),
            ),
            onChanged: (t) {
              context.read<TorCubit>().setExternalSocks5(t);
            },
          ),
          TextButton(
            onPressed: () {
              c.read<TorCubit>().setExternalSocks5('9050');
              c.read<TorCubit>().updateConfig();
            },
            child: Text(
              'RESET TO DEFAULT',
              style: c.fonts.button!.copyWith(color: c.colours.error),
            ),
          ),
          TextButton(
            onPressed: () {
              c.read<TorCubit>().setExternalSocks5('9050');
              c.read<TorCubit>().updateConfig();
            },
            child: Text(
              'CHANGING BETWEEN INTERNAL AND EXTERNAL TOR REQUIRES RESTARTING THE APP.',
              style: c.fonts.caption!.copyWith(color: c.colours.onPrimary),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
