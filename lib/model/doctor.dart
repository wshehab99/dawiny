import 'package:find_doctor/model/user.dart';
import 'package:flutter/material.dart';

class Doctror extends User {
  Doctror(
      {required String email,
      required String password,
      required String fullName,
      Widget? profilePhoto,
      this.specialist})
      : super(
            email: email,
            password: password,
            fullName: fullName,
            profilePhoto: profilePhoto);
  String? specialist;
  static List<Doctror> doctors = [
    Doctror(
        email: "waleed@gmail.com",
        password: 'password123',
        fullName: "Waleed Bin Shehab",
        specialist: 'Brain'),
    Doctror(
        email: "Ahmed@gmail.com",
        password: 'password123',
        fullName: "Ahmed Mohamed",
        specialist: 'heart'),
    Doctror(
        email: "Sultan@gmail.com",
        password: 'password123',
        fullName: "Sultan",
        specialist: 'Brain'),
    Doctror(
        email: "waleed@gmail.com",
        password: 'password123',
        fullName: "Waleed Bin Shehab",
        specialist: 'Brain'),
    Doctror(
        email: "waleed@gmail.com",
        password: 'password123',
        fullName: "Waleed Bin Shehab",
        specialist: 'Brain'),
    Doctror(
        email: "waleed@gmail.com",
        password: 'password123',
        fullName: "Waleed Bin Shehab",
        specialist: 'Brain'),
  ];
}
