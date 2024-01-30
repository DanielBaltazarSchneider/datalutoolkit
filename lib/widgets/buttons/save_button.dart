import 'package:datalutoolkit/extension/context/context.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;
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
            'Salvar',
            style: TextStyle(fontSize: context.fontSize(16)),
          ),
        ),
      ),
    );
  }
}
