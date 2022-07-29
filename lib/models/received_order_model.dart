// To parse this JSON data, do
//
//     final myReceivedOrder = myReceivedOrderFromJson(jsonString);

import 'dart:convert';

List<MyReceivedOrder> myReceivedOrderFromJson(String str) =>
    List<MyReceivedOrder>.from(
        json.decode(str).map((x) => MyReceivedOrder.fromJson(x)));

String myReceivedOrderToJson(List<MyReceivedOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyReceivedOrder {
  MyReceivedOrder({
    this.id,
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
    this.totalDeliveryCharge,
  });
  int id;
  List<Product> products;
  double total;
  int totalItems;
  int shipping;
  String orderId;
  String remark;
  bool isShipped;
  String status;
  bool isDelivered;
  DateTime deliveredDate;
  double totalDeliveryCharge;

  factory MyReceivedOrder.fromJson(Map<String, dynamic> json) =>
      MyReceivedOrder(
        id: json["id"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        totalItems: json["total_items"],
        shipping: json["shipping"],
        orderId: json["order_id"],
        remark: json["remark"],
        isShipped: json["is_shipped"],
        totalDeliveryCharge: json["total_delivery_charge"],
        status: json["status"],
        isDelivered: json["is_delivered"],
        deliveredDate: json["delivered_date"] != null
            ? DateTime.parse(json["delivered_date"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toJson())) ?? "",
        "total": total ?? "",
        "total_items": totalItems ?? "",
        "shipping": shipping ?? "",
        "order_id": orderId ?? "",
        "remark": remark ?? "",
        "is_shipped": isShipped ?? "",
        "status": status ?? "",
        "is_delivered": isDelivered ?? "",
        "delivered_date":
            deliveredDate != null ? deliveredDate.toIso8601String() : null,
      };

  static List<MyReceivedOrder> mapArray(List<dynamic> data) {
    return data
        .map<MyReceivedOrder>((json) => MyReceivedOrder.fromJson(json))
        .toList();
  }
}

class Product {
  Product({
    this.product,
    this.price,
    this.quantity,
    this.total,
    this.deliveryCharge,
  });

  String product;
  double price;
  int quantity;
  double total;
  double deliveryCharge;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      product: json["product"],
      price: json["price"],
      quantity: json["quantity"],
      total: json["total"],
      deliveryCharge: json["delivery_charge"]);

  Map<String, dynamic> toJson() => {
        "product": product,
        "price": price,
        "quantity": quantity,
        "total": total,
      };
}
