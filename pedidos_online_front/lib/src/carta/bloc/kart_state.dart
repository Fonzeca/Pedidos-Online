part of 'kart_bloc.dart';

class KartState extends Equatable {

  final List<ItemKart> items;
  final int kartItemCount;


  const KartState({this.items, this.kartItemCount});

  KartState copyWith({List<ItemKart> items}) {
    return KartState(items: new List.from(items) ?? this.items, kartItemCount: items?.length ?? this.kartItemCount);
  }

  @override
  List<Object> get props => [items, kartItemCount];
}
