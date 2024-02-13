import 'package:flutter/material.dart';
import 'package:vcnafacul/components/molecules/dash_card_filter_status.dart';
import 'package:vcnafacul/style/colors.dart';

class DashCardFilter extends StatelessWidget {
  final DashCardFilterStatus? filterStatus;
  final TextEditingController? controllerFilter;
  const DashCardFilter({Key? key, this.filterStatus, this.controllerFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: CustomColors.backgroundGrey,
      ),
      child: Column(
        children: [
          if (filterStatus != null)
            Container(
              child: filterStatus,
            ),
          if (controllerFilter != null)
            SizedBox(
              child: TextField(
                controller: controllerFilter,
                decoration: const InputDecoration(
                    hintText: 'qual cursinho busca?',
                    icon: Icon(Icons.filter_alt)),
              ),
            )
        ],
      ),
    );
  }
}
