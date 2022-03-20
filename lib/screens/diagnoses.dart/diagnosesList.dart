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
  List shownList = DiagnosItem.specialtiesList;
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
                  shownList = DiagnosItem.specialtiesList
                      .where((element) =>
                          element.text!.toLowerCase().contains(value!))
                      .toList();
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
              itemBuilder: ((context, index) => DiagnosItem(
                    icon: shownList[index].icon,
                    text: shownList[index].text,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => DoctorListScreen(
                                  dignoseName: shownList[index].text,
                                )),
                          ));
                    },
                  )),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: shownList.length,
            )),
          ]),
    );
  }
}
