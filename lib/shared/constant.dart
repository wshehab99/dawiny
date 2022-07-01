import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

//colors
var kBackgroundColor = const Color(0xffF9F9F9);
var kWhiteColor = const Color(0xffffffff);
var kOrangeColor = const Color(0xffEF716B);
var kBlueColor = const Color(0xff4B7FFB);
var kYellowColor = const Color(0xffFFB167);
var kTitleTextColor = const Color(0xff1E1C61);
var kSearchBackgroundColor = const Color(0xffF2F2F2);
var kSearchTextColor = const Color(0xffC0C0C0);
var kCategoryTextColor = const Color(0xff292685);

const kAppWhiteColor = Color(0xffF5F5F7);
const kAppBlueColor = Colors.blue;
const kAppGreenColor = Colors.green;
const kAppGreyColor = Colors.black45;

//Fonts
const kRobotoCondensedFont = 'Roboto_Condensed';
const kNexaFont = 'nexa';
Future<int> updatePProfile({required Map data}) async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? accessToken = prefs.getString("access");
  Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
  String role = payload['role'];
  if (role == "nurse") {
    if (checkValidAccess(payload['exp'])) {
      print(payload);
      print(accessToken);
      print(data);
      try {
        var response = dio.patch(
            'https://dawiny.herokuapp.com/api/' +
                role +
                's/' +
                payload['userId'],
            data: jsonEncode(data),
            options: Options(headers: {
              'authorization': accessToken,
            }));

        return -1;
      } on DioError {
        return 0;
      }
    } else {
      var result = await refreshAccessToken();
      if (result == -1) {
        //make user login again
        return 100;
      } else {
        await prefs.setString("access", result.toString());
        accessToken = result as String?;
        return updatePProfile(data: data);
      }
    }
  }
  return 0;
}

bool checkValidAccess(int timeStamp) {
  return DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000)
      .isAfter(DateTime.now());
}

Future refreshAccessToken() async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? refreshToken = prefs.getString("refresh");
  try {
    final rr = await dio.post("https://dawiny.herokuapp.com/api/auth/token",
        options: Options(
          headers: {},
        ),
        data: jsonEncode({
          "refresh": refreshToken,
        }));
    print(rr);
    return rr.data['access'];
  } on DioError {
    return -1;
  }
}
