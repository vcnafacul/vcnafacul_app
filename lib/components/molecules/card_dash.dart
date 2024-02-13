import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/components/atoms/field_value.dart';
import 'package:vcnafacul/style/colors.dart';
import 'package:vcnafacul/types/card_dash/card_cash.dart';

class CardDash extends StatelessWidget {
  final CardDashType card;
  final void Function() onTap;
  const CardDash({Key? key, required this.card, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: CustomColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(children: [
              Center(
                child: Text(
                  card.title,
                  style: GoogleFonts.raleway(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ...(card.infos
                      ?.map((info) =>
                          FieldValue(field: info.field, value: info.value))
                      .toList() ??
                  []),
              Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: card.getStatus())
            ]),
          ),
        ),
      ),
    );
  }
}
