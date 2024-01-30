import 'package:flutter/services.dart';

class IntegerInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Verifica se o novo valor está vazio
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Verifica se o novo valor contém apenas dígitos numéricos
    if (int.tryParse(newValue.text) == null) {
      return oldValue;
    }

    // Retorna o novo valor
    return newValue;
  }
}
