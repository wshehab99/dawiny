import 'package:find_doctor/model/user.dart';
import 'package:find_doctor/screens/profile_photo_card.dart';
import 'package:flutter/material.dart';

class Doctor extends User {
  Doctor(
      {required String email,
      required String password,
      required String fullName,
      required String this.hospitalName,
      required String profilePhoto,
      this.videocall,
      this.specialist})
      : super(
          email: email,
          password: password,
          fullName: fullName,
          profilePhoto: profilePhoto,
        );
  String? specialist;
  String? hospitalName;
  bool? videocall;
}
