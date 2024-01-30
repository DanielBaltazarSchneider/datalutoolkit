import 'package:datalutoolkit/extension/string/string_formart.dart';
import 'package:datalutoolkit/extension/widget/text.dart';
import 'package:flutter/material.dart';

import '../../utils/decimal_input_formatter.dart';
import '../../utils/integer_input_formatter.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({Key? key, required this.controller, required this.title, this.onChange, this.autofocus = false, this.keyboardType}) : super(key: key);
  final TextEditingController controller;
  final String title;
  final Function(double number)? onChange;
  final bool autofocus;
  final TextInputType? keyboardType;

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  double convertToDouble(String value) {
    String str = value.replaceAll(".", "");
    str = value.replaceAll(",", ".");
    return str.toDouble() ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    autofocus: widget.autofocus,
                    controller: widget.controller,
                    cursorColor: Colors.black,
                    onChanged: widget.onChange == null ? null : (value) => widget.onChange!(value.toDoubleReplace()),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    inputFormatters: widget.keyboardType == null ? [DecimalInputFormatter(leftSymbol: " ")] : [IntegerInputFormatter()],
                    keyboardType: widget.keyboardType ?? const TextInputType.numberWithOptions(decimal: true),
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
    );
  }
}
