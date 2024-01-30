extension DocumentFormater on String {
  String toFormatCnpj() {
    try {
      if (length == 14) {
        List<String> value = split('');
        value.insert(2, '.');
        value.insert(6, '.');
        value.insert(10, '/');
        value.insert(15, '-');
        return value.join();
      } else {
        return this;
      }
    } catch (e) {
      return this;
    }
  }

  String toFormatCpf() {
    try {
      if (length == 11) {
        List<String> value = split('');
        value.insert(3, '.');
        value.insert(7, '.');
        value.insert(11, '-');
        return value.join();
      } else {
        return this;
      }
    } catch (e) {
      return this;
    }
  }

  String toFormatNumeroTelefone() {
    try {
      if (length == 10) return _toFormatTelefoneFixo();
      if (length == 11) return _toFormatTelefoneCelular();
      return this;
    } catch (e) {
      return this;
    }
  }

  String _toFormatTelefoneFixo() {
    try {
      List<String> value = split('');
      value.insert(0, '(');
      value.insert(3, ')');
      return value.join();
    } catch (e) {
      return this;
    }
  }

  String _toFormatTelefoneCelular() {
    try {
      List<String> value = split('');
      value.insert(0, '(');
      value.insert(3, ') ');
      value.insert(5, ' ');
      return value.join();
    } catch (e) {
      return this;
    }
  }
}
