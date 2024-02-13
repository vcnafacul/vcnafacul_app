part of 'dash_card_template_cubit.dart';

abstract class DashCardTemplateState<T> {}

class DashCardTemplateLoading extends DashCardTemplateState {}

class DashCardTemplateSucess<T> extends DashCardTemplateState<T> {
  DashCardTemplateSucess({required this.cards, this.cardsFiltered}) {
    if (this.cardsFiltered == null) this.cardsFiltered = this.cards;
  }
  final List<T> cards;
  late List<T>? cardsFiltered;
}

class DashCardTemplateError extends DashCardTemplateState {
  DashCardTemplateError(this.error);
  final String error;
}
