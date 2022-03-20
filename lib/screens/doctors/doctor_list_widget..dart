import 'package:find_doctor/fake_data/fake_data.dart';
import 'package:flutter/material.dart';

import '../../shared/constant.dart';
import '../../shared/doctorCard.dart';

class DoctorListWidget extends StatelessWidget {
  // List<Doctor> shownList = [

  // ];

  String dignoseName;

  DoctorListWidget({Key? key, required this.dignoseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shownList = FakeData.doctors;
    // .where((element) =>
    //     element.specialist!.toLowerCase().contains(dignoseName))
    // .toList();
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return DoctorCard(
                  shownList[index].fullName,
                  "${shownList[index].specialist} - ${shownList[index].hospitalName}",
                  "${shownList[index].profilePhoto}",
                  kBlueColor);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: shownList.length));
  }
}
