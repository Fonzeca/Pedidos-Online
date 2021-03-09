
import 'package:equatable/equatable.dart';

class Section extends Equatable{
  final String name;
  final String image;
  int type;
  List<String> categories;


  Section (this.name, this.image);

  Section.fromJson(Map<String, dynamic> json):
      name = json['name'],
      image = json['image'],
      type = json['type'],
      categories = json['categories'] != null ? List<String>.from(json['categories']) : null;

  @override
  List<Object> get props => [name, image, type, categories];
}