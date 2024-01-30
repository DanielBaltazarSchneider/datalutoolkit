import 'package:intl/intl.dart';

extension IntFormat on int {
  String toFormat0x() {
    if (this < 10) {
      return "0$this";
    }
    return toString();
  }

  String toFormat00x() {
    if (this < 10) {
      return "00$this";
    }
    if (this < 100) {
      return "0$this";
    }
    return toString();
  }

  String toFormat000x() {
    return toFormatNumberSize(casas: 3);
  }

  String toFormat0000x() {
    return toFormatNumberSize(casas: 4);
  }

  String toFormatNumberSize({int? casas}) {
    String formattedNumber = toString().padLeft(casas ?? 4, '0');
    return formattedNumber;
  }
}
