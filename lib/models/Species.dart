import 'dart:convert';

List<Species> speciesFromJson(String str) =>
    List<Species>.from(json.decode(str).map((x) => Species.fromJson(x)));

String speciesToJson(List<Species> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Species {
  Species({this.id, this.name});

  int id;
  String name;


  factory Species.fromJson(Map<String, dynamic> json) =>
      Species(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
  static List<Species> mapArray(List<dynamic> data) {
    return data.map<Species>((json) => Species.fromJson(json)).toList();
  }
}
