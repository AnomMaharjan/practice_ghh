// To parse this JSON data, do
//
//     final wishlistProduct = wishlistProductFromJson(jsonString);

class WishlistProduct {
  WishlistProduct({
    this.id,
    this.product,
  });

  int id;
  Product product;

  factory WishlistProduct.fromJson(Map<String, dynamic> json) =>
      WishlistProduct(
        id: json["id"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
      };
  static List<WishlistProduct> mapArray(List<dynamic> data) {
    return data
        .map<WishlistProduct>((json) => WishlistProduct.fromJson(json))
        .toList();
  }
}
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

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
  bool isAdded = false;
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
        isAdded: json["is_added"],
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
        "is_added": isAdded ?? false,
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
