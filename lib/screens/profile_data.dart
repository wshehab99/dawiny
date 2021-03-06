import 'package:dawiny/screens/profile_photo_card.dart';
import 'package:dawiny/screens/teriaq_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/user.dart';
import '../shared/app_button.dart';
import '../shared/textFieldApp.dart';
import 'congrats_screen/congrates2.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

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
                child: Image(
                  image: AssetImage(
                    'assets/images/Dawiny logo - 2.png',
                  ),
                  width: 40,
                  height: 40,
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
                    validator: (value) {
                      if (value!.isEmpty) return 'please enter your full name';
                      return null;
                    },
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
                  validator: (value) {
                    if (value!.isEmpty) return 'please enter your birthday';
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) return 'please enter your address';
                    return null;
                  },
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnboardingScreen()));
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
