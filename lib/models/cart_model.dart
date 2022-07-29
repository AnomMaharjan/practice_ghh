import 'dart:convert';

List<CartList> cartListFromJson(String str) =>
    List<CartList>.from(json.decode(str).map((x) => CartList.fromJson(x)));

String cartListToJson(List<CartList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartList {
  CartList({
    this.id,
    this.products,
    this.seller,
  });

  int id;
  List<ProductElement> products;
  int seller;

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
        id: json["id"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        seller: json["seller"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "seller": seller,
      };
  static List<CartList> mapArray(List<dynamic> data) {
    return data.map<CartList>((json) => CartList.fromJson(json)).toList();
  }
}

class ProductElement {
  ProductElement({
    this.product,
    this.quantity,
    this.total,
  });

  ProductProduct product;
  int quantity;
  double total;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        quantity: json["quantity"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
        "total": total,
      };
}

class ProductProduct {
  ProductProduct({
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
  bool isAdded = false;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
        isAdded: json["is_added"],
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
        "is_added": isAdded ?? false,
      };

  static List<ProductProduct> mapArray(List<dynamic> data) {
    return data
        .map<ProductProduct>((json) => ProductProduct.fromJson(json))
        .toList();
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
