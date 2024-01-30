import 'package:datalutoolkit/extension/double/double_format.dart';
import 'package:datalutoolkit/widgets/inputs/input_number.dart';
import 'package:flutter/material.dart';

Future<double?> modalInputNumber(
  BuildContext context, {
  String title = "Informe o valor",
  String? subTitle,
  required String inputTitle,
  TextInputType? keyboardType,
  List<double> listValues = const [],
}) async {
  TextEditingController controller = TextEditingController();
  double? value = await showDialog<double>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Colors.orange,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (subTitle != null) ...[
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
            ],
            SizedBox(
              width: 100,
              child: InputNumber(
                keyboardType: keyboardType,
                autofocus: true,
                controller: controller,
                title: inputTitle,
              ),
            ),
            if (listValues.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text("Valores adicionados", style: TextStyle(fontSize: 14)),
              Wrap(
                children: [
                  for (double defNumber in listValues) ...[
                    Text(
                      " ${defNumber.toFormat2()}  ",
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ]
                ],
              )
            ]
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancelar/Sair',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Salvar',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              double? value = double.tryParse(controller.text);
              Navigator.of(context).pop(value);
            },
          ),
        ],
      );
    },
  );
  if (context.mounted) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
  return value;
}
