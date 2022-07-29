// To parse this JSON data, do
//
//     final productCreateResponse = productCreateResponseFromJson(jsonString);

import 'dart:convert';

List<ProductCreateResponse> productCreateResponseFromJson(String str) => List<ProductCreateResponse>.from(json.decode(str).map((x) => ProductCreateResponse.fromJson(x)));

String productCreateResponseToJson(List<ProductCreateResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCreateResponse {
  ProductCreateResponse({
    this.products,
    this.total,
    this.totalItems,
    this.shipping,
    this.orderId,
    this.remark,
    this.isShipped,
    this.status,
    this.isDelivered,
    this.deliveredDate,
  });

  List<Product> products;
  int total;
  int totalItems;
  int shipping;
  String orderId;
  String remark;
  bool isShipped;
  String status;
  bool isDelivered;
  DateTime deliveredDate;

  factory ProductCreateResponse.fromJson(Map<String, dynamic> json) => ProductCreateResponse(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    totalItems: json["total_items"],
    shipping: json["shipping"],
    orderId: json["order_id"],
    remark: json["remark"],
    isShipped: json["is_shipped"],
    status: json["status"],
    isDelivered: json["is_delivered"],
    deliveredDate: DateTime.parse(json["delivered_date"]),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "total_items": totalItems,
    "shipping": shipping,
    "order_id": orderId,
    "remark": remark,
    "is_shipped": isShipped,
    "status": status,
    "is_delivered": isDelivered,
    "delivered_date": deliveredDate.toIso8601String(),
  };

  // static List<ProductCreateResponse> mapArray(List<dynamic> data) {
  //   return data
  //       .map<ProductCreateResponse>((json) => ProductCreateResponse.fromJson(json))
  //       .toList();
  // }
}

class Product {
  Product({
    this.product,
    this.price,
    this.quantity,
    this.total,
  });

  String product;
  int price;
  int quantity;
  int total;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    product: json["product"],
    price: json["price"],
    quantity: json["quantity"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "price": price,
    "quantity": quantity,
    "total": total,
  };
}
