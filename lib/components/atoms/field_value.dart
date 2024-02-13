import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/style/colors.dart';
import 'package:vcnafacul/types/actions/action.dart';

class FieldValue extends StatelessWidget {
  final String field;
  final String value;
  final List<MyAction>? actions;
  final bool column;
  const FieldValue(
      {Key? key,
      required this.field,
      required this.value,
      this.column = false,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> component = [
      Row(
        children: [
          Text(
            "$field ${!column ? ':' : ''} ",
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (actions != null)
            ...actions!.map((MyAction action) {
              return GestureDetector(
                onTap: action.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    action.icon,
                    size: 15,
                    color: CustomColors.marine,
                  ),
                ),
              );
            }),
        ],
      ),
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            value,
            style:
                GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      )
    ];
    return SizedBox(
        width: double.infinity,
        child: !column
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: component))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: component,
              ));
  }
}
