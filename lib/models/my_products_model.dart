// To parse this JSON data, do
//
//     final myProducts = myProductsFromJson(jsonString);

import 'dart:convert';

List<MyProducts> myProductsFromJson(String str) =>
    List<MyProducts>.from(json.decode(str).map((x) => MyProducts.fromJson(x)));

String myProductsToJson(List<MyProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyProducts {
  MyProducts({
    this.id,
    this.name,
    this.description,
    this.inStock,
    this.saveAmount,
    this.image,
    this.sellingPrice,
    this.offerPrice,
    this.quantity,
    this.unit,
    this.category,
    this.species,
    this.willDeliver,
    this.deliveryCharge,
  });

  int id;
  String name;
  String description;
  bool inStock;
  String saveAmount;
  String image;
  double sellingPrice;
  double offerPrice;
  int quantity;
  String unit;
  Category category;
  MyProductSpecies species;
  bool willDeliver;
  double deliveryCharge;

  factory MyProducts.fromJson(Map<String, dynamic> json) => MyProducts(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        inStock: json["in_stock"],
        saveAmount: json["save_amount"],
        image: json["image"] == null ? null : json["image"],
        sellingPrice: json["selling_price"],
        offerPrice: json["offer_price"],
        quantity: json["quantity"],
        unit: json["unit"],
        category: Category.fromJson(json["category"]),
        species: MyProductSpecies.fromJson(json["species"]),
        willDeliver: json["will_deliver"],
        deliveryCharge: json["delivery_charge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "in_stock": inStock,
        "save_amount": saveAmount,
        "image": image == null ? null : image,
        "selling_price": sellingPrice,
        "offer_price": offerPrice,
        "quantity": quantity,
        "unit": unit,
        "category": category.toJson(),
        "species": species.toJson(),
        "will_deliver": willDeliver,
        "delivery_charge": deliveryCharge,
      };

  static List<MyProducts> mapArray(List<dynamic> data) {
    return data.map<MyProducts>((json) => MyProducts.fromJson(json)).toList();
  }
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class MyProductSpecies {
  MyProductSpecies({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory MyProductSpecies.fromJson(Map<String, dynamic> json) =>
      MyProductSpecies(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
