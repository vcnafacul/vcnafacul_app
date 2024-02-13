import 'package:flutter/material.dart';
import 'package:vcnafacul/style/colors.dart';

class Button extends StatelessWidget {
  final String label;
  final Color? color;
  final void Function()? onPressed;
  const Button(
      {Key? key, required this.label, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: color ?? CustomColors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: Text(
              label,
              style: const TextStyle(color: CustomColors.white),
            )),
      ),
    );
  }
}
