// To parse this JSON data, do
//
//     final nurse = nurseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Nurse> nurseFromJson(String str) =>
    List<Nurse>.from(json.decode(str).map((x) => Nurse.fromJson(x)));

String nurseToJson(List<Nurse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nurse {
  Nurse({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.price,
    required this.rate,
    required this.v,
    required this.status,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.location,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final int price;
  final int rate;
  final int v;
  final String status;
  final String dateOfBirth;
  final String gender;
  final String address;
  final NurseLocation location;

  factory Nurse.fromJson(Map<String, dynamic> json) => Nurse(
        id: json["_id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        price: json["price"],
        rate: json["rate"],
        v: json["__v"],
        status: json["status"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        address: json["address"],
        location: NurseLocation.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "price": price,
        "rate": rate,
        "__v": v,
        "status": status,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "address": address,
        "location": location.toJson(),
      };
}

class NurseLocation {
  NurseLocation({
    required this.lat,
    required this.lng,
    required this.id,
  });

  final double lat;
  final double lng;
  final String id;

  factory NurseLocation.fromJson(Map<String, dynamic> json) => NurseLocation(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
        "_id": id,
      };
}
