import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/style/colors.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const MyText(
      {Key? key,
      required this.text,
      this.fontSize = 14,
      this.color = CustomColors.marine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          text,
          style: GoogleFonts.raleway(
              color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
