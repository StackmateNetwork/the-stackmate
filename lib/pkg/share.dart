import 'package:share/share.dart';

abstract class IShare {
  Future share({required String text, required String subjectForEmail});
}

class Sharer implements IShare {
  @override
  Future share({required String text, required String subjectForEmail}) async {
    await Share.share(text, subject: subjectForEmail);
  }
}
