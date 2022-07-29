import 'dart:convert';

AddCategory addCategoryFromJson(String str) =>
    AddCategory.fromJson(json.decode(str));

String addCategoryToJson(AddCategory data) => json.encode(data.toJson());

class AddCategory {
  AddCategory({this.id, this.name});

  int id;
  String name;

  factory AddCategory.fromJson(Map<String, dynamic> json) => AddCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  static List<AddCategory> mapArray(List<dynamic> data) {
    return data.map<AddCategory>((json) => AddCategory.fromJson(json)).toList();
  }
}
