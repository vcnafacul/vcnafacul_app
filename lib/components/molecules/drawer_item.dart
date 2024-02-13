import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vcnafacul/components/atoms/my_text.dart';
import 'package:vcnafacul/style/colors.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final String? svgString;
  final IconData? icons;
  final bool disable;
  final Function(BuildContext context) handleNavigator;
  const DrawerItem(
      {Key? key,
      required this.text,
      required this.handleNavigator,
      this.svgString,
      this.icons,
      this.disable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !disable
        ? TextButton(
            onPressed: () => handleNavigator(context),
            style: ButtonStyle(
              enableFeedback: false,
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                children: [
                  icons != null
                      ? Icon(icons!)
                      : svgString != null
                          ? SvgPicture.asset(
                              svgString!,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                  CustomColors.darkGrey, BlendMode.srcIn),
                            )
                          : Container(),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  MyText(
                    text: text,
                    fontSize: 18,
                    color: CustomColors.darkGrey,
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
