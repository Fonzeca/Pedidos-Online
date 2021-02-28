part of 'kart_bloc.dart';

abstract class KartEvent extends Equatable {
  const KartEvent();
}

class KartAdding extends KartEvent{

  KartAdding({
    @required this.name,
    @required this.price,
    @required this.quantity,
    this.categorie
  });

  final String name;
  final int quantity;
  final String price;
  final String categorie;

  @override
  List<Object> get props => [name, quantity, categorie, price];
}

class KartRemoving extends KartEvent{

  KartRemoving({this.name, this.isAll = false});

  final String name;
  final bool isAll;

  @override
  List<Object> get props => [name, isAll];
}

class KartBuying extends KartEvent{


  @override
  List<Object> get props => [];

}
