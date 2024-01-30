import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String toFormatyyyyMMddhhmm() {
    try {
      return DateFormat('yyyy/MM/dd hh:mm').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatyyyyMMdd() {
    try {
      return DateFormat('yyyy/MM/dd').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatddMMyyyyHHmm() {
    try {
      return DateFormat('dd/MM/yyyy HH:mm').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatddMMyyyyhhmmss() {
    try {
      return DateFormat('dd/MM/yyyy hh:mm:ss').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatddMMyy() {
    try {
      return DateFormat('dd/MM/yy').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatddMMyyyy() {
    try {
      return DateFormat('dd/MM/yyyy').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatHHmm() {
    try {
      String newDate = DateFormat('HH:mm').format(this);
      return newDate;
    } catch (err) {
      return "";
    }
  }

  String toFormatddMM() {
    try {
      return DateFormat('dd/MM').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatdd() {
    try {
      return DateFormat('dd').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatMM() {
    try {
      return DateFormat('MM').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatyyyy() {
    try {
      return DateFormat('yyyy').format(this);
    } catch (err) {
      return "";
    }
  }

  String toFormatyy() {
    try {
      return DateFormat('yy').format(this);
    } catch (err) {
      return "";
    }
  }

  String abbreviatedMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return "JAN";
      case 2:
        return "FEV";
      case 3:
        return "MAR";
      case 4:
        return "ABR";
      case 5:
        return "MAI";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AGO";
      case 9:
        return "SET";
      case 10:
        return "OUT";
      case 11:
        return "NOV";
      case 12:
        return "DEZ";
      default:
        return "";
    }
  }

  String monthInFull() {
    switch (month) {
      case 1:
        return "Janeiro";
      case 2:
        return "Fevereiro";
      case 3:
        return "Março";
      case 4:
        return "Abril";
      case 5:
        return "Maio";
      case 6:
        return "Junho";
      case 7:
        return "Julho";
      case 8:
        return "Agosto";
      case 9:
        return "Setembro";
      case 10:
        return "Outubro";
      case 11:
        return "Novembro";
      case 12:
        return "Dezembro";
      default:
        return "";
    }
  }
}
