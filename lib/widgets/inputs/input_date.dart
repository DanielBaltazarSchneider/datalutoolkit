import 'package:datalutoolkit/extension/date_time/date_time_format.dart';
import 'package:datalutoolkit/extension/widget/text.dart';
import 'package:flutter/material.dart';

class InputDate extends StatefulWidget {
  const InputDate({Key? key, this.value, required this.title, this.onChange, this.onTapClean}) : super(key: key);
  final DateTime? value;
  final String title;
  final Function(DateTime date)? onChange;
  final VoidCallback? onTapClean;

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  TextEditingController inputController = TextEditingController();
  Future<void> setDate() async {
    FocusManager.instance.primaryFocus?.unfocus();
    DateTime? dataSelecionada = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 200,
                  child: CalendarDatePicker(
                    initialDate: widget.value ?? DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 365)),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    onDateChanged: (DateTime date) {
                      Navigator.of(context).pop(date);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancelar"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    if (dataSelecionada != null && widget.onChange != null) {
      widget.onChange!(dataSelecionada);
    }
  }

  @override
  Widget build(BuildContext context) {
    inputController.text = widget.value?.toFormatddMMyyyy() ?? "";
    return InkWell(
      onTap: () => setDate(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextField(
                              controller: inputController,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text(
                                  widget.title,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ).toFormulaQuimica(),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        if (widget.onTapClean != null && inputController.text != "")
                          InkWell(
                            onTap: widget.onTapClean,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
