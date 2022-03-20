import 'package:flutter/cupertino.dart';

class User {
  String? fullName;
  String email;
  String password;
  String? profilePhoto;
  String address;
  String birthday;
  String gender;
  User({
    required this.email,
    required this.password,
    this.fullName,
    this.profilePhoto,
    this.address = "",
    this.gender = '',
    this.birthday = "",
  });

  static List<User> users = [
    User(
        email: 'waleed@gmail.com',
        password: 'password123',
        fullName: "fullName"),
    User(email: "Morsy@gmail.com", password: "123456789"),
    User(
        email: 'm7mdmwsy@gmail.com',
        password: 'password123',
        fullName: "Moahmed Mousa"),
  ];
  static User? currentUser;
}
