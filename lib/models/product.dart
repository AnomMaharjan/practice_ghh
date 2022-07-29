// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
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
    this.isAdded,
    this.contactNumber,
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
  Category species;
  bool willDeliver;
  double deliveryCharge;
  bool isAdded;
  String contactNumber;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
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
        isAdded: json["wishlist_status"],
        contactNumber: json["contact_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "is_added": isAdded,
        "contact_number": contactNumber,
      };

  static List<Product> mapArray(List<dynamic> data) {
    return data.map<Product>((json) => Product.fromJson(json)).toList();
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

class Species {
  Species({
    this.id,
    this.name,
  });
  int id;
  String name;
  factory Species.fromJson(Map<String, dynamic> json) => Species(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
//
// enum Unit { PACKET, UNIT }
//
// final unitValues = EnumValues({
//   "packet": Unit.PACKET,
//   "unit": Unit.UNIT
// });

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
