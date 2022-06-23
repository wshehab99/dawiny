import 'package:flutter/material.dart';

class CustomRowAppointment extends StatelessWidget {
  CustomRowAppointment({Key? key, this.day, this.dayNumber}) : super(key: key);
  String? day;
  int? dayNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "$day",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$dayNumber",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ],
    );
  }
}
