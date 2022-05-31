import 'package:find_doctor/shared/CustomRow.dart';
import 'package:find_doctor/shared/app_CheckBox.dart';
import 'package:find_doctor/shared/textFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DoctorTime extends StatefulWidget {
  DoctorTime({
    Key? key,
    this.isCheked,
    this.onPress,
  }) : super(key: key);
  bool? isCheked;
  void Function(bool? value)? onPress;

  @override
  State<DoctorTime> createState() => _DoctorTimeState();
}

class _DoctorTimeState extends State<DoctorTime> {
  //TextEditingController _txtTimeController = TextEditingController();
  // final MaskTextInputFormatter _timeMaskFormatter =
  //     MaskTextInputFormatter(mask: '##:##:##', filter: {"#": RegExp(r'[0-9]')});

  final TextEditingController _Time = TextEditingController();
  String? dayName;

  List days = [
    "Satrday",
    "Sunday",
    "Monday",
    "Tuseday",
    "wensday",
    "Tharsday",
    "Friday",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TeriaqTextField(
                hint: "Time by minutes",
                controller: _Time,
                type: TextInputType.numberWithOptions(decimal: false),
                onTap: () {
                  // Future<TimeOfDay?> selectedTime = showTimePicker(
                  //   initialTime: TimeOfDay.now(),
                  //   context: context,
                  // ).then((value) {
                  //   _Time.text = value!.format(context);
                  // });
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: CupertinoTimerPicker(
                            initialTimerDuration: Duration(minutes: 30),
                            onTimerDurationChanged: (value) {},
                          ),
                        );
                      });
                },
                label: "Time",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: days.length,
                  itemBuilder: (BuildContext, index) {
                    return CustomRow(
                      day: days[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
