import 'dart:math';

import 'package:find_doctor/fake_data/fake_data.dart';
import 'package:find_doctor/shared/diagnos_item_widget.dart';
import 'package:flutter/material.dart';

import '../doctors/doctor_list_screen.dart';
import '../search/search_widget.dart';

class Doctorlist extends StatefulWidget {
  const Doctorlist({Key? key}) : super(key: key);

  @override
  State<Doctorlist> createState() => _DoctorlistState();
}

class _DoctorlistState extends State<Doctorlist> {
  var shownList = FakeData.specializations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Text(
          "Diagnosis",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            SearchTextFeild(
              hint: 'search',
              onSearch: (value) {
                setState(() {
                  shownList = FakeData.specializations.where((element) {
                    return element.name.toLowerCase().contains(value!);
                  }).toList();
                  //  shownList = specializations.values
                  //     .where((element) =>
                  //         specializationName[element.specialization]!
                  //             .toLowerCase()
                  //             .contains(value!))
                  //     .toList();
                });
              },
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 10),
            //   child: Text(
            //     "Most popular specialties",
            //     style: TextStyle(
            //       fontSize: 22,
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Expanded(
                child: ListView.separated(
              itemBuilder: ((context, index) {
                var value = shownList[index];
                return DiagnosItem(
                  specialization: value,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            DoctorListScreen(dignoseName: value.name)),
                      ),
                    );
                  },
                );
              }),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: shownList.length,
            )),
          ]),
    );
  }
}
