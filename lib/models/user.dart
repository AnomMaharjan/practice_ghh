import 'package:flutter/foundation.dart';

class User {
  String username, fullname, token, email, phone;

  User({
    @required this.username,
    @required this.fullname,
    this.email,
    this.phone,
    @required this.token,
  });

  String toString() {
    return this.username;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      fullname: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': this.username,
      'full_name': this.fullname,
      'email': this.email,
      'phone': this.phone,
      'token': this.token,
    };
  }

  static List<User> mapArray(List<dynamic> data) {
    return data.map<User>((json) => User.fromJson(json)).toList();
  }
}
