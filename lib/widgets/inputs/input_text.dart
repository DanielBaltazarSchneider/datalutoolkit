import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText({Key? key, required this.controller, required this.title, this.onChange, this.tip, this.autofocus}) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String? tip;
  final Function(String text)? onChange;
  final bool? autofocus;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: widget.controller,
                    cursorColor: Colors.black,
                    onChanged: widget.onChange,
                    autofocus: widget.autofocus ?? false,
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
                      ),
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
        if (widget.tip != null)
          Text(
            widget.tip ?? "",
            style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
          ),
        const SizedBox(height: 12),
      ],
    );
  }
}
