import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vcnafacul/style/colors.dart';

class LoginBackground extends StatelessWidget {
  final Widget component;
  const LoginBackground({Key? key, required this.component}) : super(key: key);

  final String yellowTriangle = 'assets/icons/triangle-yellow2.svg';
  final String greenTriangle = 'assets/icons/triangle-green2.svg';

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        color: CustomColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                greenTriangle,
                height: 200,
                width: 200,
                alignment: Alignment.centerLeft,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                yellowTriangle,
                height: 200,
                alignment: Alignment.bottomRight,
              ),
            ),
          ],
        ),
      ),
      component
    ]);
  }
}
