
class Section {
  final String name;
  final String image;


  Section (this.name, this.image);

  Section.fromJson(Map<String, dynamic> json):
      name = json['name'],
      image = json['image'];
}