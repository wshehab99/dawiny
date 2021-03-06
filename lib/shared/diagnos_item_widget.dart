import 'package:flutter/material.dart';

import '../fake_data/fake_data.dart';

class DiagnosItem extends StatelessWidget {
  DiagnosItem({Key? key, this.specialization, this.ontap}) : super(key: key);
  Widget? icon;
  SpecializationData? specialization;
  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Image.asset(
        specialization!.imagePath,
        color: Colors.blue,
        height: 40,
      ),
      title: Text(
        specialization!.name,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  // static List<DiagnosItem> specialtiesList = [
  //   DiagnosItem(
  //     specialization: Specialization.Dermatology,

  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Ear,

  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Ophthalmology,

  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Nephrology,

  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Dentistry,

  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Brain,

  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Cardiology,
  //     icon: Image.asset(
  //      ,
  //       color: Colors.blue,
  //       height: 40,
  //     ),
  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Neurology,
  //     icon: Image.asset(
  //     ,
  //       color: Colors.blue,
  //       height: 40,
  //     ),
  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Orthopedics,
  //     icon: Image.asset(
  //      ,
  //       color: Colors.blue,
  //       height: 40,
  //     ),
  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Pediatrics,
  //     icon: Image.asset(
  //       "assets/icons/child.png",
  //       color: Colors.blue,
  //       height: 40,
  //     ),
  //   ),
  //   DiagnosItem(
  //     specialization: Specialization.Endocrinology,
  //     icon: Image.asset(
  //       "assets/icons/endocrine.png",
  //       color: Colors.blue,
  //       height: 40,
  //     ),
  //   ),
  // ];
}
