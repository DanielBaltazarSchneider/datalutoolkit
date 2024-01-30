import 'package:flutter/material.dart';

class CalendarioVazioSanitarioWidget extends StatefulWidget {
  const CalendarioVazioSanitarioWidget({super.key, required this.initDate, required this.endDate});

  final DateTime initDate;
  final DateTime endDate;

  @override
  State<CalendarioVazioSanitarioWidget> createState() => _CalendarioVazioSanitarioWidgetState();
}

class _CalendarioVazioSanitarioWidgetState extends State<CalendarioVazioSanitarioWidget> {
  _CalendarioVazioSanitarioWidgetState();

  late DateTime initDate;
  late DateTime endDate;

  List<DateTime> listMonth = [];

  @override
  void initState() {
    super.initState();
    initDate = widget.initDate;
    endDate = widget.endDate;
    processDates();
    setState(() {});
  }

  int differenceInMonths(DateTime startDate, DateTime endDate) {
    return (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;
  }

  void processDates() {
    listMonth = [];
    DateTime dateRef = DateTime(initDate.year, initDate.month, 15);
    int mesInicio = initDate.month;
    int diferenca = differenceInMonths(initDate, endDate);
    for (int i = mesInicio; i < (diferenca + mesInicio) + 1; i++) {
      listMonth.add(dateRef);
      dateRef = dateRef.add(const Duration(days: 30));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 0; i < listMonth.length; i++) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _MesCalendario(
              date: listMonth[i],
              initDate: initDate,
              endDate: endDate,
            ),
          ),
        ]
      ],
    );
  }
}

class _MesCalendario extends StatefulWidget {
  const _MesCalendario({super.key, required this.date, required this.initDate, required this.endDate});

  final DateTime date;
  final DateTime initDate;
  final DateTime endDate;

  @override
  State<_MesCalendario> createState() => _MesCalendarioState();
}

class _MesCalendarioState extends State<_MesCalendario> {
  List<List<int?>> calendar = [];

  void processaDatas() {
    calendar = [];
    DateTime firstDayOfMonth = DateTime(widget.date.year, widget.date.month, 1);
    int startingWeekday = firstDayOfMonth.weekday;
    DateTime lastDayOfMonth = DateTime(widget.date.year, widget.date.month + 1, 0);
    List<int?> week = [];

    // Adicione dias vazios para chegar ao dia da semana em que o mês começa
    for (int i = 1; i < startingWeekday; i++) {
      week.add(null);
    }

    // Preencha a lista com os dias do mês
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      week.add(day);
      if (week.length == 7) {
        calendar.add(week);
        week = [];
      }
    }

    // Adicione a última semana incompleta, se necessário
    if (week.isNotEmpty) {
      calendar.add(week);
    }
  }

  bool isDateInRange(int day) {
    DateTime dateTime = DateTime(widget.date.year, widget.date.month, day);
    return (dateTime.isAfter(widget.initDate) && dateTime.isBefore(widget.endDate)) ||
        (dateTime.isAtSameMomentAs(widget.initDate) || dateTime.isAtSameMomentAs(widget.endDate));
  }

  bool isFirstInRange(int day) {
    DateTime dateTime = DateTime(widget.date.year, widget.date.month, day);
    return dateTime.isAtSameMomentAs(widget.initDate);
  }

  bool isLastInRange(int day) {
    DateTime dateTime = DateTime(widget.date.year, widget.date.month, day);
    return dateTime.isAtSameMomentAs(widget.endDate);
  }

  @override
  void initState() {
    super.initState();
    processaDatas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double size = 20;
    Color colorSelected = Colors.red.shade400;
    Color colorUnselected = Colors.grey.shade100;
    return SizedBox(
      width: size * 7,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _mesesDoAno[widget.date.month - 1],
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
          for (int index = 0; index < calendar.length; index++) ...[
            SizedBox(height: 2),
            Builder(builder: (context) {
              List<int?> row = calendar[index];
              return SizedBox(
                width: size * 7,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int index2 = 0; index2 < row.length; index2++) ...[
                      Builder(builder: (context) {
                        int? day = row[index2];
                        bool dateInRange = isDateInRange(day ?? -1);
                        bool first = isFirstInRange(day ?? -1);
                        bool last = isLastInRange(day ?? -1);
                        if (day != null) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: !dateInRange
                                  ? null
                                  : !first && !last
                                      ? null
                                      : first
                                          ? const BorderRadius.only(bottomLeft: Radius.circular(100), topLeft: Radius.circular(100))
                                          : const BorderRadius.only(bottomRight: Radius.circular(100), topRight: Radius.circular(100)),
                              color: dateInRange ? colorSelected : colorUnselected,
                            ),
                            // margin: EdgeInsets.all(2),
                            width: size,
                            height: size,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: !dateInRange
                                      ? null
                                      : first
                                          ? BorderRadius.only(bottomLeft: Radius.circular(100), topLeft: Radius.circular(100))
                                          : BorderRadius.only(bottomRight: Radius.circular(100), topRight: Radius.circular(100)),
                                  color: !dateInRange
                                      ? colorUnselected
                                      : first || last
                                          ? Colors.white
                                          : colorSelected,
                                ),
                                child: Center(
                                  child: Text(
                                    day.toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: dateInRange
                                          ? (first || last)
                                              ? Colors.black
                                              : Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            // margin: EdgeInsets.all(2),
                            width: size,
                            height: size,
                            child: Text(""),
                          );
                        }
                      })
                    ],
                  ],
                ),
              );
            })
          ]
        ],
      ),
    );
  }
}

List<String> _mesesDoAno = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
