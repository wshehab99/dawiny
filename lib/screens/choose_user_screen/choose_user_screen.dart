import 'package:find_doctor/screens/teriaq_drop_down_menu.dart';
import 'package:flutter/material.dart';

class ChooseUserScreen extends StatelessWidget {
  ChooseUserScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppDropDownMenu(
            choices: const ['Doctor', 'Nurse', 'Patint'],
            validator: "Please Choose User Type!",
            hint: "User",
            label: "User Type",
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  /*
                  from here we want to save the valu that in dropDawnValue in SharedPrefrence and then complete signIn/signUp
                  if ther is a value here we will not go to this screen we will go to the grid page directly after splash screen
                  that we will have the value of the user and email annd password so we make the user sign in implicity
                  the only thing the user will see is cireular progress indecator
                  */
                }
              },
              child: const Text("Continue"))
        ],
      ),
    ));
  }
}
