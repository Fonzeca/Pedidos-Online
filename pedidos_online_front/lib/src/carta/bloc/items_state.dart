part of 'items_bloc.dart';

enum ItemsObtainedStatus {none, loading, success, failure}

class ItemsState extends Equatable {

  final ItemsObtainedStatus status;
  List<SectionCarta> sections;

  ItemsState(this.status, [this.sections]);

  ItemsState copyWith({ItemsObtainedStatus status, List<SectionCarta> sections}){
    return ItemsState(
      status ?? this.status,
      sections ?? this.sections
    );
  }

  @override
  List<Object> get props => [status,sections];

}
