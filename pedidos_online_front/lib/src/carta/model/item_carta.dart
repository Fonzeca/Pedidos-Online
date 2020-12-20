import 'package:equatable/equatable.dart';

class ItemCarta extends Equatable{
  final String name;
  final String description;
  final String price;
  final String image;

  ItemCarta(this.name,this.description,this.price,this.image);

  @override
  List<Object> get props => [name, description, price, image];
}