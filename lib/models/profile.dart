class Profile {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;
  final double latitude;
  final double longitude;

  Profile({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.phone,
    this.latitude,
    this.longitude,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['first_name'],
      lastName: json['last_name'],
      userName: json['username'],
      phone: json['phone'],
      email: json['email'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  static List<Profile> mapArray(List<dynamic> data) {
    return data.map((json) => Profile.fromJson(json)).toList();
  }
}
