import 'package:find_doctor/screens/profile_photo_card.dart';
import 'package:find_doctor/screens/teriaq_drop_down_menu.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:flutter/material.dart';

import '../shared/textFieldApp.dart';

// ignore: must_be_immutable
class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _address = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/teriaq.PNG',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Profile",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ProfilePhotoCard(),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          TeriaqTextField(
              label: 'Full Name', hint: "Full Name", controller: _fullName),
          const SizedBox(
            height: 15,
          ),
          TeriaqTextField(
              label: 'Email',
              hint: "Email",
              icon: const Icon(Icons.mail_outline)),
          const SizedBox(
            height: 15,
          ),
          AppDropDownMenu(),
          //TeriaqTextField(label: 'Gender', hint: "Gender", controller: _gender),

          const SizedBox(
            height: 15,
          ),
          TeriaqTextField(
            label: 'Date of birth',
            hint: "Date of birth",
            icon: const Icon(Icons.calendar_month),
            onTap: () {
              _selectDate(context);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TeriaqTextField(
            label: 'Address',
            hint: "Address",
            controller: _address,
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
              child: AppButton(
            text: 'Confirm',
            borderradius: BorderRadius.circular(60),
            textColor: Colors.white,
            bottenColor: Colors.blue,
            onPressed: () {},
          ))
        ]),
      ),
    ));
  }

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) selectedDate = selected;
  }
}
