// To parse this JSON data, do
//
//     final shippingAddressResponse = shippingAddressResponseFromJson(jsonString);

import 'dart:convert';

ShippingAddressResponse shippingAddressResponseFromJson(String str) => ShippingAddressResponse.fromJson(json.decode(str));

String shippingAddressResponseToJson(ShippingAddressResponse data) => json.encode(data.toJson());

class ShippingAddressResponse {
  ShippingAddressResponse({
    this.address,
    this.latitude,
    this.longitude,
  });

  String address;
  int latitude;
  int longitude;

  factory ShippingAddressResponse.fromJson(Map<String, dynamic> json) => ShippingAddressResponse(
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
  };
}
