import 'package:flutter/material.dart';
import 'package:vcnafacul/enum/status_enum.dart';

String pending = 'assets/images/CardDash/statusPending.png';
String approved = 'assets/images/CardDash/Approved.png';
String rejected = 'assets/images/CardDash/statusRejected.png';
String svgUpload = 'assets/icons/upload-icon.svg';
double sizeSvg = 70;

class Status {
  static Image getStatus(StatusEnum status) {
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
