import 'package:find_doctor/shared/diagnos_item_widget.dart';
import 'package:flutter/material.dart';

import '../search/search_widget.dart';

class DaignoList extends StatelessWidget {
  const DaignoList({Key? key}) : super(key: key);

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
                        icon: DiagnosItem.specialtiesList[index]['icon'],
                        text: DiagnosItem.specialtiesList[index]['text'],
                      )),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: DiagnosItem.specialtiesList.length),
            ),
          ]),
    );
  }
}
