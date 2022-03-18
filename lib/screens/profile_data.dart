
import 'package:find_doctor/screens/profile_photo_card.dart';
import 'package:find_doctor/screens/teriaq_drop_down_menu.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shared/textFieldApp.dart';

// ignore: must_be_immutable
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final AppDropDownMenu appDropDownMenu = AppDropDownMenu(
    choices: const ['Male', 'Femle'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                TeriaqTextField(
                    label: 'Full Name',
                    hint: "Full Name",
                    controller: _fullName),
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
                appDropDownMenu,
                //TeriaqTextField(label: 'Gender', hint: "Gender", controller: _gender),

                const SizedBox(
                  height: 15,
                ),
                TeriaqTextField(
                  label: 'Date of birth',
                  hint: "Date of birth",
                  icon: const Icon(Icons.calendar_month),
                  controller: _dateController,
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
              ],
            ),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      User.currentUser!.address = _address.text;
                      User.currentUser!.birthday = _dateController.text;
                      User.currentUser!.fullName = _fullName.text;
                    }
                  }))

        ]),
      ),
    ));
  }

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != DateTime.now()) {
      _dateController.text = DateFormat.yMMMd().format(selected);
    }
  }
}
