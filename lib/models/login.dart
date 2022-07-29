import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.token,
    this.username,
    this.fullName,
    this.email,
    this.phone,
    this.user,
  });

  String token;
  String username;
  String fullName;
  String email;
  String phone;
  User user;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        username: json["username"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "username": username,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.username,
    this.phone,
    this.email,
    this.latitude,
    this.longitude,
  });

  String firstName;
  String lastName;
  String username;
  String phone;
  String email;
  double latitude;
  double longitude;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "phone": phone,
        "email": email,
        "latitude": latitude,
        "longitude": longitude,
      };
}
