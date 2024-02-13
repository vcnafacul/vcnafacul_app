import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcnafacul/components/atoms/show_dialog_error.dart';
import 'package:vcnafacul/components/molecules/card_dash.dart';
import 'package:vcnafacul/components/organism/dash_card_filter.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template_cubit.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/style/colors.dart';
import 'package:vcnafacul/types/card_dash/base_entity_card.dart';
import 'package:vcnafacul/types/card_dash/card_cash.dart';

// ignore: must_be_immutable
class DashCardTemplate<T extends BaseEntityCard> extends StatelessWidget {
  final String title;
  final CardDashType Function(T object) convert;
  final DashCardFilter? dashCardFilter;
  final StatusEnum? selectedStatus;
  final void Function(T)? openCardHandle;
  DashCardTemplate(
      {Key? key,
      required this.title,
      required this.convert,
      this.openCardHandle,
      this.selectedStatus,
      this.dashCardFilter})
      : super(key: key);

  late DashCardTemplateCubit dashCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: CustomColors.marine,
        ),
        backgroundColor: CustomColors.backgroundGrey,
        body: Column(
          children: [
            if (dashCardFilter != null) Container(child: dashCardFilter),
            Expanded(
              child: SingleChildScrollView(
                child: BlocConsumer<DashCardTemplateCubit<T>,
                        DashCardTemplateState>(
                    listenWhen: (context, state) =>
                        state is DashCardTemplateError,
                    listener: (context, state) {
                      showDialogError(
                          message: (state as DashCardTemplateError).error,
                          context: context);
                    },
                    bloc: context.read<DashCardTemplateCubit<T>>(),
                    builder: (context, state) {
                      context
                          .read<DashCardTemplateCubit<T>>()
                          .getCards(selectedStatus);
                      if (state is DashCardTemplateLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is DashCardTemplateSucess) {
                        return Column(
                            children: state.cardsFiltered!
                                .map((card) => CardDash(
                                    card: convert(card),
                                    onTap: () {
                                      if (openCardHandle != null) {
                                        openCardHandle!(card);
                                      }
                                    }))
                                .toList());
                      } else {
                        return Container(color: CustomColors.white);
                      }
                    }),
              ),
            ),
          ],
        ));
  }
}
