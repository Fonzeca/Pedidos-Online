part of 'items_bloc.dart';

/**
 * none: no está pasando nada.
 * loading: se está ejecutando una acción o cargando los items
 * success: los items fueron traidos exitosamente
 * failure: falló la recoección de items.
 */
enum ItemsObtainedStatus { none, loading, success, failure }

class ItemsState extends Equatable {
  final ItemsObtainedStatus status;
  List<SectionCarta> sections;

  ItemsState(this.status, [this.sections]);

  ItemsState copyWith(
      {ItemsObtainedStatus status, List<SectionCarta> sections}) {
    return ItemsState(status ?? this.status, sections ?? this.sections);
  }

  @override
  List<Object> get props => [status, sections];
}
