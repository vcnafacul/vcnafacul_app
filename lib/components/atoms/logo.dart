import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/style/colors.dart';

class Logo extends StatelessWidget {
  final double size;
  final bool darktheme;
  const Logo({this.size = 5, this.darktheme = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 36,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          'assets/images/home/logo.svg',
          height: size * 8,
        ),
        const Padding(padding: EdgeInsets.only(right: 4)),
        Text('você na ',
            style: GoogleFonts.raleway(
                fontSize: 4 * size,
                fontWeight: FontWeight.w300,
                color: darktheme ? CustomColors.white : CustomColors.marine,
                decoration: TextDecoration.none)),
        Text('facul',
            style: GoogleFonts.raleway(
                fontSize: 4 * size,
                fontWeight: FontWeight.bold,
                color: darktheme ? CustomColors.white : CustomColors.marine,
                decoration: TextDecoration.none)),
      ]),
    );
  }
}
