import 'package:equatable/equatable.dart';

import 'item_carta.dart';

class SectionCarta extends Equatable{
  final String name;
  final String image;
  List<ItemCarta> items = List<ItemCarta>();


  SectionCarta(this.name, this.image, [this.items]);

  @override
  List<Object> get props => [name, image, items];
}