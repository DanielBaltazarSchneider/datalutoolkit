extension DurationFormat on Duration {
  String toFormatHHMM() {
    try {
      String horas = inHours < 10 ? "0$inHours" : "$inHours";
      String minutos = (inHours % 60) < 10 ? "0${inHours % 60}" : "${inHours % 60}";
      return "${horas}h${minutos}min";
    } catch (err) {
      return "";
    }
  }

  String toFormatDDHHMM() {
    try {
      String dias = "$inDays";
      String horas = (inHours % 24) < 10 ? "0${inHours % 24}" : "${inHours % 24}";
      String minutos = (inHours % 60) < 10 ? "0${inHours % 60}" : "${inHours % 60}";

      return "${dias}d${horas}h${minutos}min";
    } catch (err) {
      return "";
    }
  }
}
