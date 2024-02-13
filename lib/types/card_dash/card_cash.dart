import 'package:flutter/material.dart';
import 'package:vcnafacul/enum/status_enum.dart';

String pending = 'assets/images/CardDash/statusPending.png';
String approved = 'assets/images/CardDash/Approved.png';
String rejected = 'assets/images/CardDash/statusRejected.png';
String svgUpload = 'assets/icons/upload-icon.svg';
double sizeSvg = 70;

class InfoCard {
  late String field;
  late String value;

  InfoCard({required this.field, required this.value});
}

class CardDashType {
  late dynamic id;
  late String title;
  late StatusEnum status;
  late List<InfoCard>? infos;

  CardDashType({required this.id, required this.title, required this.status, this.infos});

  Image getStatus() {
    switch (status) {
      case StatusEnum.pending:
        return Image.asset(
          pending,
          height: 30,
        );
      case StatusEnum.approved:
        return Image.asset(
          approved,
          height: 30,
        );
      case StatusEnum.rejected:
        return Image.asset(
          rejected,
          height: 30,
        );
      case StatusEnum.pendingUpload:
        return Image.asset(
          pending,
          height: 30,
        );
    }
  }
}
