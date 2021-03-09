
import 'package:equatable/equatable.dart';

class ItemKart extends Equatable{
  final String name;
  final int price;
  final String category;
  final int quantity;

  const ItemKart(this.name,this.price, this.category, this.quantity);

  ItemKart copyWith({String name, int price, String category, int quantity}){
    return ItemKart(
      name ?? this.name,
      price ?? this.price,
      category ?? this.category,
      quantity ?? this.quantity);
  }

  ItemKart addingQuantity(int quantity){
    return ItemKart(
        this.name,
        this.price,
        this.category,
        this.quantity + quantity);
  }

  @override
  List<Object> get props => [name, price, category, quantity];

  @override
  String toString() {
    return "{name : $name , price: $price , category: $category , quantity: $quantity}";
  }
}