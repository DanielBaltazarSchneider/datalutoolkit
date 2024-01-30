import 'package:flutter/material.dart';

extension AppWidget on Text {
  Widget toFormulaQuimica() {
    if (data!.contains("inf(") || data!.contains("sup(")) {
      List<_Caractere> listStr = [];
      List<String> listCaract = data!.split("");
      for (int i = 0; i < listCaract.length; i++) {
        if (i < listCaract.length - 5) {
          if (listCaract[i] == "i" && listCaract[i + 1] == "n" && listCaract[i + 2] == "f" && listCaract[i + 3] == "(" && listCaract[i + 5] == ")") {
            listStr.add(_Caractere(_PosCaracter.botton, listCaract[i + 4]));
            i = i + 5;
          } else if (listCaract[i] == "s" && listCaract[i + 1] == "u" && listCaract[i + 2] == "p" && listCaract[i + 3] == "(" && listCaract[i + 5] == ")") {
            listStr.add(_Caractere(_PosCaracter.top, listCaract[i + 4]));
            i = i + 5;
          } else {
            listStr.add(_Caractere(_PosCaracter.center, listCaract[i]));
          }
        } else {
          listStr.add(_Caractere(_PosCaracter.center, listCaract[i]));
        }
      }
      List<Widget> result = [];
      for (_Caractere caract in listStr) {
        result.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (caract.position == _PosCaracter.botton)
                Text('', style: style?.copyWith(fontSize: (style!.fontSize ?? 14) * 0.4) ?? const TextStyle(fontSize: 8)),
              Text(
                caract.str,
                style: caract.position == _PosCaracter.center
                    ? style
                    : style?.copyWith(fontSize: (style!.fontSize ?? 14) * (isNumber(caract.str) ? 0.5 : 0.7)) ??
                        TextStyle(fontSize: isNumber(caract.str) ? 7 : 10),
              ),
              if (caract.position == _PosCaracter.top)
                Text('', style: style?.copyWith(fontSize: (style!.fontSize ?? 14) * 0.5) ?? const TextStyle(fontSize: 8)),
            ],
          ),
        );
      }

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: result,
      );
    }
    return this;
  }
}

bool isNumber(String text) {
  try {
    int.parse(text);
    return true;
  } catch (e) {
    return false;
  }
}

class _Caractere {
  _Caractere(this.position, this.str);

  _PosCaracter position;
  String str;
}

enum _PosCaracter { top, center, botton }
