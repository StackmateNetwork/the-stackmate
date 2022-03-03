import 'package:sats/pkg/interface/share.dart';
import 'package:share/share.dart';

class Sharer implements IShare {
  @override
  Future share({required String text, required String subjectForEmail}) async {
    await Share.share(text, subject: subjectForEmail);
  }
}
