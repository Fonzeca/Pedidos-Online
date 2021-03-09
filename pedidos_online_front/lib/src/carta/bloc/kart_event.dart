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

  KartRemoving({this.name, this.category, this.isAll = false});

  final String name;
  final String category;
  final bool isAll;

  @override
  List<Object> get props => [name, isAll, category];
}

class KartBuying extends KartEvent{

  final List<ItemKart> list;
  final int total;
  final String address;

  KartBuying({@required this.list, @required this.total, this.address});

  @override
  List<Object> get props => [list, total, address];

}
