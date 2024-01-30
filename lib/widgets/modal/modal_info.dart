import 'package:flutter/material.dart';

Future<void> modalInfo(BuildContext context, {required String title, required String message, Color? titleColor, Color? messageColor}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: titleColor ?? Colors.red,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  message,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, color: messageColor),
                ),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'),
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      );
    },
  );
}
