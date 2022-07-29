import 'dart:convert';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({this.id, this.name});

  int id;
  String name;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      Categories(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
  static List<Categories> mapArray(List<dynamic> data) {
    return data.map<Categories>((json) => Categories.fromJson(json)).toList();
  }
}
