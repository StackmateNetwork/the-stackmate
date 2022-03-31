import 'package:sats/model/result.dart';

abstract class IShare {
  Future<R<bool>> share({required String text, required String subjectForEmail});
}
