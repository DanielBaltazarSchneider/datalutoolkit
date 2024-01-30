extension AppString on String {
  /// Formata para a primeira letra maiuscula e as demais minuscula
  String toFirstUpperCase() {
    return (this == "") ? "" : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String capitalizeFirstofEach() {
    try {
      return split(" ").map((str) => str.substring(0, 1).toUpperCase() + str.substring(1, str.length).toLowerCase()).join(" ");
    } catch (e) {
      return toFirstUpperCase();
    }
  }

  String clipString({int start = 0, required int end}) {
    if (length < end) {
      return this;
    }
    return substring(start, end);
  }

  String cutIfLonger(int maxLength) {
    if (this.length <= maxLength) {
      return this; // Retorna o texto original se não ultrapassar o limite
    } else {
      return this.substring(0, maxLength) + "..."; // Corta o texto e adiciona reticências
    }
  }

  String toInCaps() => '${this[0].toUpperCase()}${substring(1)}';

  String toAllInCaps() => toUpperCase();

  /// // Formata a String para o formato de nome "Fulano da Silva"
  String toNameFormat() {
    try {
      String text = replaceAll("  ", " ");
      return (text.split(" ").map((str) => str.substring(0, 1).toUpperCase() + str.substring(1, str.length).toLowerCase()).join(" "))
          .replaceAll(" Da ", " da ")
          .replaceAll(" Das ", " das ")
          .replaceAll(" De ", " de ")
          .replaceAll(" Di ", " di ")
          .replaceAll(" Do ", " do ")
          .replaceAll(" Dos ", " dos ")
          .replaceAll(" Du ", " du ");
    } catch (err) {
      return "";
    }
  }

  /// Retorna a abreviação do nome
  String toAbbreviated() {
    String str = trim();
    if (str == "") {
      return "";
    }
    List<String> list = split(' ');
    if (list.isEmpty) {
      return "";
    }
    if (list.length == 1) {
      return list[0][0].toUpperCase();
    } else {
      return list[0][0].toUpperCase() + list[1][0].toUpperCase();
    }
  }

  /// Converte a String em double
  double? toDouble() {
    try {
      return double.parse(this);
    } catch (e) {
      return null;
      // throw "A String informado não é um double";
    }
  }

  /// Converte uma String numerica com unidade de medida em double
  /// "1.230,5 ha".toFormatNumber("ha") => 1230.5
  double toDoubleReplace({String replace = ''}) {
    try {
      String strValue = replaceAll(".", "").replaceAll(",", ".").replaceAll(" ", "").replaceAll(replace, "");
      return double.parse(strValue);
    } catch (e) {
      return 0.0;
    }
  }

  String toRemoveAccents() {
    return replaceAll(RegExp('[ÀÁÂÃÄÅàáâãäå]'), 'a')
        .replaceAll(RegExp('[ÈÉÊËèéêë]'), 'e')
        .replaceAll(RegExp('[ÌÍÎÏìíîï]'), 'i')
        .replaceAll(RegExp('[ÒÓÔÕÖØòóôõöø]'), 'o')
        .replaceAll(RegExp('[ÙÚÛÜùúûü]'), 'u')
        .replaceAll(RegExp('[Çç]'), 'c');
  }

  String cleanQuimica() {
    return replaceAll("inf(", "").replaceAll(")", "").replaceAll("sup(", "");
  }
}
