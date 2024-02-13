import 'package:flutter/material.dart';
import 'package:vcnafacul/core/routes.dart';

void showDialogError(
    {required String message,
    required BuildContext context,
    String? routerBack}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text('Erro: '),
          content: Text(message),
          shape: const ContinuousRectangleBorder(),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.popUntil(context,
                    ModalRoute.withName(routerBack ?? Routers.home.name));
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      });
}
