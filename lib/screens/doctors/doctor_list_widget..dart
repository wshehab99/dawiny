import 'package:flutter/material.dart';

import '../../shared/constant.dart';
import '../../shared/doctorCard.dart';

class DoctorListWidget extends StatelessWidget {
  List? shownList;
  String dignoseName;

  DoctorListWidget({Key? key, required this.dignoseName, this.shownList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return DoctorCard(
                  "${shownList![index]['_id']}",
                  "${shownList![index]['firstName']} ${shownList![index]['lastName']}",
                  "${shownList![index]['specification']} - ${shownList![index]['clinicAddress']}",
                  kBlueColor);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: shownList!.length));
  }
}
