import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/style/colors.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  const Input(
      {Key? key,
      required this.placeholder,
      required this.controller,
      this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String placeholder = '';
  late TextEditingController controller;
  @override
  void initState() {
    placeholder = widget.placeholder;
    controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.lightGray),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: CustomColors.white,
        ),
        child: Stack(children: [
          TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(top: 25, bottom: 5, left: 8, right: 8),
            ),
            controller: controller,
            validator: widget.validator,
            obscureText: widget.obscureText,
          ),
          Text(
            placeholder,
            style: GoogleFonts.raleway(fontSize: 12),
          )
        ]),
      ),
    );
  }
}
