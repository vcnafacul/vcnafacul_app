// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void _showDialog(BuildContext context, String url) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text('Error ao tentar baixar $url'),
          shape: const ContinuousRectangleBorder(),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      });
}

Future<void> launchURL(String url, BuildContext context) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    _showDialog(context, url);
  }
}
