import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/style/colors.dart';
import 'package:vcnafacul/utils/status.dart';

class DashCardFilterLine extends StatelessWidget {
  final String text;
  final StatusEnum status;
  const DashCardFilterLine({Key? key, required this.text, required this.status})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      child: Row(
        children: [
          Status.getStatus(status),
          Text(
            text,
            style:
                GoogleFonts.raleway(fontSize: 20, color: CustomColors.marine),
          ),
        ],
      ),
    );
  }
}
