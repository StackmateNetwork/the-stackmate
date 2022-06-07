import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';

class _XpubColdcard extends StatelessWidget {
  void _pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final PlatformFile file = result.files.first;

      print(file.name);
      print(file.path);
    } else {
      log('No file selected');
    }
  }

  @override
  Widget build(BuildContext c) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          _pickFile();
        },
        color: c.colours.primary,
        child: Text(
          'Import json file',
          style: TextStyle(color: c.colours.background),
        ),
      ),
    );
  }
}

class XPubColdcardScreen extends StatelessWidget {
  const XPubColdcardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkSelect = context.select((ChainSelectCubit c) => c);
    final nodeSelect = context.select((NodeAddressCubit c) => c);
    final tor = context.select((TorCubit c) => c);

    final logger = context.select((Logger c) => c);
    final wallets = context.select((WalletsCubit c) => c);

    final xpubCub = XpubImportCubit(
      logger,
      locator<IClipBoard>(),
    );
    final xpubCubit = XpubImportWalletCubit(
      locator<IStackMateBitcoin>(),
      logger,
      locator<IStorage>(),
      wallets,
      networkSelect,
      nodeSelect,
      tor,
      xpubCub,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: xpubCub),
        BlocProvider.value(value: xpubCubit),
      ],
      child: _XpubColdcard(),
    );
  }
}
