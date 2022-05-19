// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:sats/cubit/logger.dart';
// import 'package:sats/model/result.dart';
// import 'package:sats/pkg/_locator.dart';
// import 'package:sats/pkg/interface/file.dart';
// import 'package:sats/pkg/interface/share.dart';
// import 'package:share/share.dart';
// import 'package:flutter/material.dart';

// import 'package:filesystem_picker/filesystem_picker.dart';
// import 'package:path_provider/path_provider.dart';

// class FileManager implements IFileManager {
//   @override
//   Future<R<bool>> saveTextToFile(
//     String path,
//     String text,
//   ) async {
//     try {
//       final File file = File(path + '/sample.psbt'); // 1
//       await file.writeAsString(text); // 2
//       return const R(result: true);
//     } catch (e) {
//       return R(
//         error: e.toString(),
//       );
//     }
//   }
// }
