import 'package:flutter/cupertino.dart';

class User {
  String? fullName;
  String email;
  String password;
  Widget? profilePhoto;
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
        fullName: "fullName")
  ];
  static User? currentUser;
}
