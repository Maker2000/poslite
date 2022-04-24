// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());
String userToSendJson(User data) => json.encode(data.toSendJson());

class User {
  User({
    required this.userName,
    this.selfDescription,
    required this.id,
    this.name,
    this.email,
    required this.age,
    this.role,
    this.homeAddress,
  });

  String userName;
  String? selfDescription;
  String id;
  String? name;
  String? email;
  int age;
  String? role;
  HomeAddress? homeAddress;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
        selfDescription: json["selfDescription"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
        role: json["role"],
        homeAddress: json["homeAddress"] == null
            ? HomeAddress()
            : HomeAddress.fromJson(json["homeAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "selfDescription": selfDescription,
        "_id": id,
        "name": name,
        "email": email,
        "age": age,
        "role": role,
        "homeAddress": homeAddress?.toJson(),
      };
  Map<String, dynamic> toSendJson() => {
        "userName": userName,
        "selfDescription": selfDescription,
        "name": name,
        "email": email,
        "age": age,
        "role": role,
        "homeAddress": homeAddress?.toJson(),
      };
}

class HomeAddress {
  HomeAddress({
    this.addressLine2 = '',
    this.city = '',
    this.parish = '',
    this.addressLine1 = '',
  });

  String addressLine2;
  String city;
  String parish;
  String addressLine1;

  factory HomeAddress.fromJson(Map<String, dynamic> json) => HomeAddress(
        addressLine2: json["addressLine2"],
        city: json["city"],
        parish: json["parish"],
        addressLine1: json["addressLine1"],
      );

  Map<String, dynamic> toJson() => {
        "addressLine2": addressLine2,
        "city": city,
        "parish": parish,
        "addressLine1": addressLine1,
      };
  @override
  String toString() {
    super.toString();
    return "$addressLine1,\n${addressLine2.isNotEmpty ? '$addressLine2,\n' : ''}$city,\n$parish";
  }
}
