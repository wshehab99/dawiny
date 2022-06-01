import 'package:flutter/material.dart';
import 'textFieldApp.dart';

class CustomRow extends StatefulWidget {
  CustomRow({Key? key, this.day}) : super(key: key);
  String? day;
  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  final TextEditingController _Time = TextEditingController();
  bool isChecked = false;

  //  final Map<String, dynamic> DAYS = {
  //   "satrdaty": [
  //     {
  //       "from" : "2:00",
  //       "to": "3:00",
  //       "available" : true
  //     },
  //     {
  //       "from" : "3:30",
  //       "to": "4:30",
  //       "available" : true
  //     },
  //   ],
  //    "sunday": [
  //     {
  //       "from" : "2:00",
  //       "to": "3:00",
  //       "available" : true
  //     },
  //     {
  //       "from" : "3:30",
  //       "to": "4:30",
  //       "available" : true
  //     },
  //   ],
  //    "monday": [
  //     {
  //       "from" : "2:00",
  //       "to": "3:00",
  //       "available" : true
  //     },
  //     {
  //       "from" : "3:30",
  //       "to": "4:30",
  //       "available" : true
  //     },
  //   ],
  //    "tuseday": [
  //     {
  //       "from" : "2:00",
  //       "to": "3:00",
  //       "available" : true
  //     },
  //     {
  //       "from" : "3:30",
  //       "to": "4:30",
  //       "available" : true
  //     },
  //   ],
  //    "wensday": [
  //     {
  //       "from" : "2:00",
  //       "to": "3:00",
  //       "available" : true
  //     },
  //     {
  //       "from" : "3:30",
  //       "to": "4:30",
  //       "available" : true
  //     },
  //   ],
  //    "thursday": [
  //     {
  //       "from" : "2:00",
  //       "to": "3:00",
  //       "available" : true
  //     },
  //     {
  //       "from" : "3:30",
  //       "to": "4:30",
  //       "available" : true
  //     },
  //   ],
  //    "friday": [
  //     {
  //       "from" : "2:00",
  //       "to": "3:00",
  //       "available" : true
  //     },
  //     {
  //       "from" : "3:30",
  //       "to": "4:30",
  //       "available" : true
  //     },
  //   ],
  // };
  final Map<String, dynamic> Times = {
    "Satrday": [
      {"start": "5:00pm", "end": "9:00pm"}
    ],
    "sunday": [
      {"start": "6:00pm", "end": "9:00pm"}
    ],
    "monday": [
      {"start": "1:00pm", "end": "9:00pm"}
    ],
    "tuesday": [
      {"start": "2:00pm", "end": "9:00pm"}
    ],
    "wensday": [
      {"start": "3:00pm", "end": "9:00pm"}
    ],
    "thuseday": [
      {"start": "4:00pm", "end": "9:00pm"}
    ],
    "friday": [
      {"start": "5:00pm", "end": "9:00pm"}
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "${widget.day}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.blue,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 195,
              height: 100,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    TeriaqTextField(
                      hint: "Time",
                      label: "From",
                      controller: _Time,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 195,
              height: 100,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    TeriaqTextField(
                      hint: "Time",
                      label: "To",
                      controller: _Time,
                      onTap: () {
                        // Future<TimeOfDay?> selectedTime = showTimePicker(
                        //   initialTime: TimeOfDay.now(),
                        //   context: context,
                        // ).then((value) {
                        //   _Time.text = value!.format(context);
                        // });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
