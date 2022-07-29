import 'dart:convert';

List<MyProductionCut> myProductionCutFromJson(String str) =>
    List<MyProductionCut>.from(
        json.decode(str).map((x) => MyProductionCut.fromJson(x)));

String myProductionCutToJson(List<MyProductionCut> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyProductionCut {
  MyProductionCut({this.id, this.name});

  int id;
  String name;

  factory MyProductionCut.fromJson(Map<String, dynamic> json) =>
      MyProductionCut(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
      
  static List<MyProductionCut> mapArray(List<dynamic> data) {
    return data
        .map<MyProductionCut>((json) => MyProductionCut.fromJson(json))
        .toList();
  }
}
