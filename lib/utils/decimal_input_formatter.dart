import 'package:datalutoolkit/extension/double/double_format.dart';
import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  DecimalInputFormatter({this.leftSymbol, this.rightSymbol});

  String? leftSymbol;
  String? rightSymbol;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    int offSet = 0;
    double number = 0.0;
    bool finalDecimal = false;
    String newText = "";
    String cleanText = newValue.text.replaceAll(rightSymbol ?? "", "").replaceAll(leftSymbol ?? "", "");
    cleanText = _subtituiUltimoPontoPorVirgula(cleanText);
    if (cleanText.isNotEmpty) {
      if (_ultimoCaraterEhPontoOuVirgula(cleanText)) {
        finalDecimal = true;
      }
      String strNumber = "";
      if (!finalDecimal) {
        strNumber = _removePontosVirgulasDuplos(cleanText).replaceAll(".", "").replaceAll(",", ".");
      } else {
        strNumber = _removePontosVirgulasDuplos(cleanText);
      }
      String concat = "";
      if (strNumber[strNumber.length - 1] == "0") {
        if (strNumber.length >= 2 && strNumber[strNumber.length - 2] == "0") {
          concat += "0";
        }
      }

      if (!finalDecimal) {
        try {
          number = double.parse(strNumber);
        } catch (error) {
          number = 0;
        }
        if (strNumber.contains(".")) {
          strNumber = number.toString() + concat;
        } else {
          strNumber = number.toInt().toString();
        }

        List<String> split = strNumber.split(".");
        int nFlutu = split.length < 2 ? 0 : split[1].length;

        if (nFlutu >= 3) {
          strNumber = number.toFormat3000();
        } else if (nFlutu == 2) {
          strNumber = number.toFormat300();
        } else if (nFlutu == 1) {
          strNumber = number.toFormat30();
        } else if (nFlutu == 0) {
          strNumber = number.toFormat3();
        }

        if (newValue.selection.baseOffset == 0) {
          return newValue;
        }
      }

      if (strNumber.isNotEmpty) {
        if (rightSymbol != null) {
          newText = strNumber + rightSymbol!;
        } else if (leftSymbol != null) {
          newText = leftSymbol! + strNumber;
        }
      } else {
        newText = "";
      }
      offSet = rightSymbol != null ? (newText.length - rightSymbol!.length) : newText.length;
    } else {
      offSet = 0;
    }

    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: offSet));
  }
}

String _removePontosVirgulasDuplos(String text) {
  int firstCommaIndex = text.indexOf(',');
  if (firstCommaIndex != -1) {
    int secondCommaIndex = text.indexOf(',', firstCommaIndex + 1);
    if (secondCommaIndex != -1) {
      return text.substring(0, secondCommaIndex);
    }
  }
  return text;
}

bool _ultimoCaraterEhPontoOuVirgula(String text) {
  return text[text.length - 1] == "," || text[text.length - 1] == ".";
}

String _subtituiUltimoPontoPorVirgula(String text) {
  if (text.isNotEmpty) {
    if (_ultimoCaraterEhPontoOuVirgula(text)) {
      return "${text.substring(0, text.length - 1)},";
    }
  }
  return text;
}
