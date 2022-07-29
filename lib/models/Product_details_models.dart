import 'dart:convert';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
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
  dynamic image;
  double sellingPrice;
  double offerPrice;
  int quantity;
  String unit;
  Category category;
  int species;
  bool willDeliver;
  double deliveryCharge;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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
        species: json["species"],
        willDeliver: json["will_deliver"],
        deliveryCharge: json["delivery_charge"],
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
        "species": species,
        "will_deliver": willDeliver,
        "delivery_charge": deliveryCharge,
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
