//TODO: modelar tanto items como secciones.
class Item{
  final String name;
  final String description;
  final String price;
  final String image;
  final String section;

  Item(this.name,this.description,this.price,this.image,this.section);

  Item.fromJson(Map<String, dynamic> json):
    name = json['name'],
    description = json['description'],
    price = json['price'],
    image = json['image'],
    section = json['section'];
}