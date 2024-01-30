import 'package:intl/intl.dart';

extension DoubleFormat on double {
  String toFormat3() {
    return NumberFormat("#,##0.###", "pt_BR").format(this);
  }

  String toFormat30() {
    return NumberFormat("#,##0.0##", "pt_BR").format(this);
  }

  String toFormat300() {
    return NumberFormat("#,##0.00#", "pt_BR").format(this);
  }

  String toFormat3000() {
    return NumberFormat("#,##0.000", "pt_BR").format(this);
  }

  String toFormat2() {
    return NumberFormat("#,##0.##", "pt_BR").format(this);
  }

  String toFormat20() {
    return NumberFormat("#,##0.0", "pt_BR").format(this);
  }

  String toFormat200() {
    return NumberFormat("#,##0.00", "pt_BR").format(this);
  }

  String toFormat1() {
    return NumberFormat("#,##0.#", "pt_BR").format(this);
  }

  String toFormat10() {
    return NumberFormat("#,##0.0", "pt_BR").format(this);
  }

  String toFormat0() {
    return NumberFormat("#,##0", "pt_BR").format(this);
  }
}
