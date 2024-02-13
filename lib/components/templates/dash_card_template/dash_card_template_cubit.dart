import 'package:bloc/bloc.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/services/dash_card_template_service.dart';
import 'package:vcnafacul/types/card_dash/base_entity_card.dart';

part 'dash_card_template_state.dart';

class DashCardTemplateCubit<T extends BaseEntityCard>
    extends Cubit<DashCardTemplateState> {
  DashCardTemplateCubit(
      {required this.service, this.initialStatus = StatusEnum.pending})
      : super(DashCardTemplateLoading()) {
    _initialCards(initialStatus);
  }

  final DashCardTemplateService service;
  StatusEnum? initialStatus;

  Future<void> _initialCards(StatusEnum? status) async {
    try {
      final response = await service.getCardsInfo(status: status);
      emit(DashCardTemplateSucess(cards: response!));
    } catch (e) {
      emit(DashCardTemplateError(
          'Não foi possível buscar informações solicitadas'));
    }
  }

  Future<void> getCards(StatusEnum? status) async {
    if (status != initialStatus) {
      emit(DashCardTemplateLoading());
      initialStatus = status;
      await _initialCards(status);
    }
  }

  Future<void> removeCard(T entity) async {
    try {
      final currentState = state as DashCardTemplateSucess<dynamic>;
      final newsCards =
          currentState.cards.where((card) => (card.id != entity.id)).toList();
      emit(DashCardTemplateSucess(cards: newsCards));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> filterCard(bool Function(T)? filterCard) async {
    try {
      final currentState = state as DashCardTemplateSucess<dynamic>;
      final cardsFiltered = filterCard != null
          ? currentState.cards.where((card) => filterCard(card)).toList()
          : null;
      emit(DashCardTemplateSucess(
          cards: currentState.cards, cardsFiltered: cardsFiltered));
    } catch (e) {
      rethrow;
    }
  }
}
