import 'package:flutter/material.dart';
import 'textFieldApp.dart';

class CustomRow extends StatefulWidget {
  CustomRow({Key? key, this.day, required this.from, required this.to})
      : super(key: key);
  String? day;
  final TextEditingController from;
  final TextEditingController to;
  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  bool isChecked = false;

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TeriaqTextField(
                    hint: "Time",
                    label: "From",
                    controller: widget.from,
                    onTap: () {
                      Future<TimeOfDay?> selectedTime = showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      ).then((value) {
                        widget.from.text = value!.format(context);
                        return null;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TeriaqTextField(
                    hint: "Time",
                    label: "To",
                    controller: widget.to,
                    onTap: () {
                      Future<TimeOfDay?> selectedTime = showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      ).then((value) {
                        widget.to.text = value!.format(context);
                        return null;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
