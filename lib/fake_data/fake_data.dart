import 'package:find_doctor/model/doctor.dart';
import 'package:flutter/material.dart';

// enum Specialization {
//   Dermatology,
//   Ear,
//   Ophthalmology,
//   Nephrology,
//   Dentistry,
//   Brain,
//   Cardiology,
//   Neurology,
//   Orthopedics,
//   Pediatrics,
//   Endocrinology,
// }

class SpecializationData {
  SpecializationData(this.name, this.imagePath);

  String name;
  String imagePath;
}

class FakeData {
  static List<Doctor> doctors = [
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Waleed Bin Shehab",
      specialist: 'Dermatology',
      hospitalName: 'Mansoura hospital',
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "Ahmed@gmail.com",
      password: 'password123',
      fullName: "Dr.Mohamed Mousa",
      specialist: 'Dermatology',
      hospitalName: 'Alnaser hospital',
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "Ahmed@gmail.com",
      password: 'password123',
      fullName: "Dr.Mohamed Ahmed",
      specialist: 'Dermatology',
      hospitalName: 'Alnaser hospital',
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "Ahmed@gmail.com",
      password: 'password123',
      fullName: "Dr.Mohamed Amr",
      specialist: 'Dermatology',
      hospitalName: 'Alnaser hospital',
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "Sultan@gmail.com",
      password: 'password123',
      fullName: "Dr.Sultan",
      specialist: 'Dermatology',
      hospitalName: 'Mansoura hospital',
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr. Hazem Saleh",
      specialist: 'Dermatology',
      hospitalName: 'Mansoura hospital',
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "Ahmed@gmail.com",
      password: 'password123',
      fullName: "Dr.Mohamed Ayman",
      specialist: 'Dermatology',
      hospitalName: 'Alnaser hospital',
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr.Morsy Ahmed",
      specialist: 'Pediatrics',
      hospitalName: "Mansoura hospital",
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr.Amr Mohamed",
      specialist: 'Endocrinology',
      hospitalName: "Mansoura hospital",
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr.Ahmed Mousa",
      specialist: 'Endocrinology',
      hospitalName: "Mansoura hospital",
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr.Ibrhim Abdellatif",
      specialist: 'Neurology',
      hospitalName: "Mansoura hospital",
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr.Morsy ramadan",
      specialist: 'Neurology',
      hospitalName: "Mansoura hospital",
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr.Sabry waleed",
      specialist: 'Ear',
      hospitalName: "Mansoura hospital",
      profilePhoto: 'assets/images/doctor2.png',
    ),
    Doctor(
      email: "waleed@gmail.com",
      password: 'password123',
      fullName: "Dr. Ahmed Amr",
      specialist: 'Ear',
      hospitalName: "Mansoura hospital",
      profilePhoto: 'assets/images/doctor2.png',
    ),
  ];

  static var specializations = <SpecializationData>[
    SpecializationData(
      'Dermatology',
      "assets/icons/dermatology.png",
    ),
    SpecializationData(
      'Ear',
      "assets/icons/ear.png",
    ),
    SpecializationData('Ophthalmology', "assets/icons/eye.png"),
    SpecializationData('Nephrology', "assets/icons/kidney.png"),
    SpecializationData('Dentistry', "assets/icons/dental_surgeon.png"),
    SpecializationData('Brain', "assets/icons/brain.png"),
    SpecializationData('Cardiology', "assets/icons/heart_surgeon.png"),
    SpecializationData('Neurology', "assets/icons/neuron.png"),
    SpecializationData('Orthopedics', "assets/icons/fracture.png"),
    SpecializationData('Pediatrics', "assets/icons/child.png"),
    SpecializationData(
      'Endocrinology',
      "assets/icons/endocrine.png",
    ),
  ];

  static where(Function(dynamic element) param0) {}
}
