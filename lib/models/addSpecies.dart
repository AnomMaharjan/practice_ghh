import 'dart:convert';

AddSpecies addCategoryFromJson(String str) =>
    AddSpecies.fromJson(json.decode(str));

String addSpeciesToJson(AddSpecies data) => json.encode(data.toJson());

class AddSpecies {
  AddSpecies({this.id, this.name});

  int id;
  String name;

  factory AddSpecies.fromJson(Map<String, dynamic> json) => AddSpecies(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  static List<AddSpecies> mapArray(List<dynamic> data) {
    return data.map<AddSpecies>((json) => AddSpecies.fromJson(json)).toList();
  }
}
