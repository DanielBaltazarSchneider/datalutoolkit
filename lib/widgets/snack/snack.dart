import 'package:flutter/material.dart';

class SnackBarApp {
  static void show(BuildContext context, {required String message, Status status = Status.success, int seconds = 5}) {
    final snackbar = SnackBar(
      duration: Duration(seconds: seconds),
      content: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(status.iconData, color: status.textColor),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: status.textColor, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      action: SnackBarAction(
        label: "X",
        textColor: status.textColor,
        onPressed: () {
          if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      backgroundColor: status.backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void pix(BuildContext context, {required String message, int seconds = 5}) {
    final snackbar = SnackBar(
      duration: Duration(seconds: seconds),
      content: Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Image.asset(
              "assets/images/pix.png",
              width: 30,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

enum Status {
  success(Colors.green, Colors.white, Icons.check),
  error(Colors.red, Colors.white, Icons.error),
  warning(Colors.orange, Colors.white, Icons.warning),
  info(Colors.blue, Colors.white, Icons.info);

  const Status(this.backgroundColor, this.textColor, this.iconData);

  final Color backgroundColor;
  final Color textColor;
  final IconData iconData;
}
