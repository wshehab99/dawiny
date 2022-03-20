import 'package:flutter/material.dart';

import '../../model/doctor.dart';
import '../../shared/constant.dart';
import '../../shared/doctorCard.dart';

class DoctorListWidget extends StatelessWidget {
  List<Doctror> shownList = [];

  String dignoseName;

  DoctorListWidget({Key? key, required this.dignoseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    shownList = Doctror.doctors
        .where((element) => element.specialist == dignoseName)
        .toList();
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return DoctorCard(
                  shownList[index].fullName,
                  "${shownList[index].specialist} - ${shownList[index].hospitalName}",
                  "assets/images/doctor1.png",
                  kBlueColor);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: shownList.length));
  }
}
