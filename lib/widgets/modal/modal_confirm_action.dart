import 'package:flutter/material.dart';

class ModalConfirmAction {
  Future<bool?> delete(BuildContext context,
      {String? title, String? subTitle}) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title ?? 'Confirmar exclusão',
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          content: Text(
            subTitle ?? 'Tem certeza de que deseja excluir?',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'Cancelar',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                // Ação de confirmar exclusão
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Excluir',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> warning(BuildContext context,
      {String? title, String? subTitle}) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title ?? 'Atenção',
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          content: Text(
            subTitle ?? '',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'Cancelar',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                // Ação de confirmar exclusão
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Confirmar',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }
}
