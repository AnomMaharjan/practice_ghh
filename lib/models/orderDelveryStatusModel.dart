import 'dart:convert';

List<OrderDeliveryStatus> orderDeliverStatusFromJson(String str) =>
    List<OrderDeliveryStatus>.from(
        json.decode(str).map((x) => OrderDeliveryStatus.fromJson(x)));

String orderDeliveryStatusToJson(List<OrderDeliveryStatus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDeliveryStatus {
  bool isdelivered;
  String deliveredDate;

  OrderDeliveryStatus({
    this.isdelivered,
    this.deliveredDate,
  });

  factory OrderDeliveryStatus.fromJson(Map<String, dynamic> json) =>
      OrderDeliveryStatus(
        isdelivered: json["is_delivered"],
        deliveredDate: json["delivered_date"],
      );

  Map<String, dynamic> toJson() => {
        "is_delivered": isdelivered,
        "delivered_date": deliveredDate,
      };

  static List<OrderDeliveryStatus> mapArray(List<dynamic> data) {
    return data
        .map<OrderDeliveryStatus>((json) => OrderDeliveryStatus.fromJson(json))
        .toList();
  }
}
