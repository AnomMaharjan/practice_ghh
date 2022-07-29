// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

List<Search> searchFromJson(String str) =>
    List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
  Search({
    this.id,
    this.distance,
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
    this.wishlistStatus,
  });

  int id;
  int distance;
  String name;
  String description;
  bool inStock;
  String saveAmount;
  String image;
  int sellingPrice;
  int offerPrice;
  int quantity;
  String unit;
  Category category;
  Category species;
  bool willDeliver;
  int deliveryCharge;
  dynamic wishlistStatus;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        distance: json["distance"],
        name: json["name"],
        description: json["description"],
        inStock: json["in_stock"],
        saveAmount: json["save_amount"],
        image: json["image"],
        sellingPrice: json["selling_price"],
        offerPrice: json["offer_price"],
        quantity: json["quantity"],
        unit: json["unit"],
        category: Category.fromJson(json["category"]),
        species: Category.fromJson(json["species"]),
        willDeliver: json["will_deliver"],
        deliveryCharge: json["delivery_charge"],
        wishlistStatus: json["wishlist_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "distance": distance,
        "name": name,
        "description": description,
        "in_stock": inStock,
        "save_amount": saveAmount,
        "image": image,
        "selling_price": sellingPrice,
        "offer_price": offerPrice,
        "quantity": quantity,
        "unit": unit,
        "category": category.toJson(),
        "species": species.toJson(),
        "will_deliver": willDeliver,
        "delivery_charge": deliveryCharge,
        "wishlist_status": wishlistStatus,
      };
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
