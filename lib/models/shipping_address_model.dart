// To parse this JSON data, do
//
//     final shippingAddress = shippingAddressFromJson(jsonString);

import 'dart:convert';

ShippingAddress shippingAddressFromJson(String str) =>
    ShippingAddress.fromJson(json.decode(str));

String shippingAddressToJson(ShippingAddress data) =>
    json.encode(data.toJson());

class ShippingAddress {
  ShippingAddress({
    this.id,
    this.address,
    this.latitude,
    this.longitude,
  });

  int id;
  String address;
  double latitude;
  double longitude;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        id: json["id"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      };

  static List<ShippingAddress> mapArray(List<dynamic> data) {
    return data
        .map<ShippingAddress>((json) => ShippingAddress.fromJson(json))
        .toList();
  }
}
