import 'package:equatable/equatable.dart';

import 'item_carta.dart';

class SectionCarta extends Equatable{
  final String name;
  final String image;
  List<ItemCarta> items = List<ItemCarta>();
  int type;
  List<String> categories;


  SectionCarta(this.name, this.image, this.type, this.categories ,[this.items]);

  @override
  List<Object> get props => [name, image, items];
}