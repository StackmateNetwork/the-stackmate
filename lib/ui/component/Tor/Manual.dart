import 'dart:io';

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
          onPressed: () {
            context.read<TorCubit>().toggleEnforce();
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
                      'Enforce Tor',
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
                      'Default External',
                      style: context.fonts.button!.copyWith(
                        color: context.colours.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Use an external tor instance by default.',
                      maxLines: 3,
                      style: context.fonts.caption!.copyWith(
                        color: context.colours.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tor.internal ? 'OFF' : 'ON',
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
                  color: context.colours.onTertiary,
                ),
              ],
            ),
          ),
        ),
        if (!tor.isConnected) ...[
          SizedBox(
            height: 52,
            width: context.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: context.colours.onPrimary),
                primary: context.colours.primary,
                onSurface: context.colours.background,
              ),
              onPressed: () {
                context.read<TorCubit>().start();
              },
              child: Text('RESTART TOR'.toUpperCase()),
            ),
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 36),
          Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: context.colours.surface,
            child: SizedBox(
              width: context.width / 1.2,
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  Text(
                    'External Tor'.toUpperCase(),
                    style: context.fonts.headline6!.copyWith(
                      color: context.colours.tertiaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: (Platform.isAndroid)
                        ? Text(
                            'If you have an open tor instance, either:\n\nUse its socks5 port here to override Stackmate native tor\nOR\nShut it down and restart tor here.',
                            style: context.fonts.bodySmall!.copyWith(
                              color: context.colours.onPrimary,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : (Platform.isIOS)
                            ? Text(
                                'If you are on IOS, run Orbot and use the Socks5 Port here.\n\nYou can optionally skip using Tor at the risk of leaking your data to third parties.',
                                style: context.fonts.bodySmall!.copyWith(
                                  color: context.colours.onPrimary,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Container(),
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      enableIMEPersonalizedLearning: false,
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        context.read<TorCubit>().setExternalSocks5(text);
                      },
                      style: TextStyle(color: context.colours.onPrimary),
                      decoration: InputDecoration(
                        labelText: 'Socks5 Port',
                        labelStyle: TextStyle(
                          color: context.colours.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    height: 52,
                    width: context.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: context.colours.primary,
                        onPrimary: context.colours.background,
                      ),
                      onPressed: () {
                        context.read<TorCubit>().testExternalSocks5();
                      },
                      child: Text('Connect'.toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ],
    );
  }
}
