import 'package:datalutoolkit/extension/widget/text.dart';
import 'package:flutter/material.dart';

class SelectDropdown extends StatefulWidget {
  const SelectDropdown({Key? key, required this.listOptions, required this.onSelect, this.selected}) : super(key: key);

  final List<String> listOptions;
  final Function(String option) onSelect;
  final String? selected;

  @override
  State<SelectDropdown> createState() => _SelectDropdownState();
}

class _SelectDropdownState extends State<SelectDropdown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    selected = selected ?? widget.selected ?? widget.listOptions.first;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownButton<String>(
          isExpanded: true,
          value: selected,
          items: widget.listOptions.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ).toFormulaQuimica(),
            );
          }).toList(),
          underline: Container(height: 1, color: Colors.transparent),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          onChanged: (String? newValue) {
            selected = newValue;
            widget.onSelect(newValue!);
            setState(() {});
          },
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
