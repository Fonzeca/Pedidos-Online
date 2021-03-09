import 'package:equatable/equatable.dart';

class ItemCarta extends Equatable{
  final String name;
  final String description;
  String price;
  final String image;
  List<String> prices;

  ItemCarta(this.name,this.description,this.price,this.image, this.prices);

  @override
  List<Object> get props => [name, description, price, image, prices];
}