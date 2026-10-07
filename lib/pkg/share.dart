import 'package:sats/cubit/logger.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:share_plus/share_plus.dart';

class Sharer implements IShare {
  @override
  Future<R<bool>> share({
    required String text,
    required String subjectForEmail,
  }) async {
    try {
      await SharePlus.instance.share(
        ShareParams(text: text, subject: subjectForEmail),
      );
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }
}
