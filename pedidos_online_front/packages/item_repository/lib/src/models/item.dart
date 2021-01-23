//TODO: modelar tanto items como secciones.
import 'package:equatable/equatable.dart';

class Item extends Equatable{
  final String name;
  final String description;
  String price;
  final String image;
  final String section;
  List<String> prices;

  Item(this.name,this.description,this.image,this.section);

  Item.fromJson(Map<String, dynamic> json):
    name = json['name'],
    description = json['description'],
    price = json['price'],
    image = json['image'],
    section = json['section'],
    prices = json['prices'] != null ? List<String>.from(json['prices']) : null;

  @override
  List<Object> get props => [name, description, price, image, section, prices];
}