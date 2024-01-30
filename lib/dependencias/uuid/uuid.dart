import 'package:uuid/uuid.dart';

class UuidGenerate {
  static const _uuid = Uuid();
  static String newUuidV1() => _uuid.v1();
  static String newUuidV4() => _uuid.v4();
}
