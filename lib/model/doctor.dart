import 'package:find_doctor/model/user.dart';
import 'package:flutter/material.dart';

class Doctror extends User {
  Doctror(
      {required String email,
      required String password,
      required String fullName,
      required String this.hospitalName,
      Widget? profilePhoto,
      this.specialist})
      : super(
          email: email,
          password: password,
          fullName: fullName,
          profilePhoto: profilePhoto,
        );
  String? specialist;
  String? hospitalName;
  static List<Doctror> doctors = [
    Doctror(
        email: "waleed@gmail.com",
        password: 'password123',
        fullName: "Waleed Bin Shehab",
        specialist: 'Brain',
        hospitalName: 'Mansoura hospital'),
    Doctror(
        email: "Ahmed@gmail.com",
        password: 'password123',
        fullName: "Ahmed Mohamed",
        specialist: 'Cardiology',
        hospitalName: 'Alnaser hospital'),
    Doctror(
        email: "Sultan@gmail.com",
        password: 'password123',
        fullName: "Sultan",
        specialist: 'Neurology',
        hospitalName: 'MM hospital'),
    Doctror(
        email: "waleed@gmail.com",
        password: 'password123',
        fullName: "Dr. Stella Kane",
        specialist: 'Orthopedics',
        hospitalName: 'Alrajaa hospital'),
    Doctror(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr. Joseph Cart",
      specialist: 'Pediatrics',
      hospitalName: "Cure hospital",
    ),
    Doctror(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr. Stephani",
      specialist: 'Endocrinology',
      hospitalName: "Cure hospital",
    ),
  ];
}
