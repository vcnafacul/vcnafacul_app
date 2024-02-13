import 'package:flutter/material.dart';
import 'package:vcnafacul/components/atoms/dash_card_filter_line.dart';
import 'package:vcnafacul/enum/status_enum.dart';

class DashCardFilterStatus extends StatelessWidget {
  final void Function(StatusEnum?)? onChanged;
  final StatusEnum selectedValue;
  const DashCardFilterStatus(
      {Key? key, required this.onChanged, required this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      items: const [
        DropdownMenuItem(
          value: StatusEnum.pending,
          child: DashCardFilterLine(
            text: 'Pendente',
            status: StatusEnum.pending,
          ),
        ),
        DropdownMenuItem(
          value: StatusEnum.approved,
          child: DashCardFilterLine(
            text: 'Aprovado',
            status: StatusEnum.approved,
          ),
        ),
        DropdownMenuItem(
          value: StatusEnum.rejected,
          child: DashCardFilterLine(
            text: 'Reprovado',
            status: StatusEnum.rejected,
          ),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
