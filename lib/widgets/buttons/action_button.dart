import 'package:datalutoolkit/extension/context/context.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, this.onTap, required this.title, this.fontSize}) : super(key: key);
  final VoidCallback? onTap;
  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenWidth * 0.75,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(onTap != null ? Colors.black : Colors.grey), // Cor de fundo
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Cor do texto
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? context.fontSize(16),
            ),
          ),
        ),
      ),
    );
  }
}
