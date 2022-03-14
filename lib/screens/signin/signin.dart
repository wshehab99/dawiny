import 'package:find_doctor/screens/home/homescreen.dart';
import 'package:find_doctor/screens/signin/continue_with.dart';
import 'package:find_doctor/screens/signup/signup.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../../shared/app_CheckBox.dart';
import '../../shared/app_button.dart';
import '../../shared/textFieldApp.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  SignIn({Key? key}) : super(key: key);
  CheckBoxRow checkBoxRow = CheckBoxRow();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/teriaq.PNG'),
          ),
          // Container(
          //   clipBehavior: Clip.antiAlias,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(80),
          //     color: Colors.white,
          //   ),
          //   child: Image(
          //     image: AssetImage('assets/images/teriaq.PNG'),
          //     height: 160,
          //   ),
          // ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Sign in to your account",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7)),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TeriaqTextField(
                    label: 'Email',
                    hint: 'Email',
                    controller: _email,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TeriaqTextField(
                      controller: _password,
                      label: 'Password',
                      hint: 'Password',
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'please enter a password more than 8 character';
                        }
                      },
                      hide: true),
                  const SizedBox(
                    height: 10,
                  ),
                  checkBoxRow,
                  AppButton(
                      text: 'Sign in',
                      bottenColor: Colors.blue,
                      textColor: Colors.white,
                      borderradius: BorderRadius.circular(20),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _checkuser(context);
                        }
                      }),
                ],
              )),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Forget the password?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          const Text(
            'Or continue with',
            style:
                TextStyle(fontWeight: FontWeight.w800, color: Colors.black54),
          ),
          ContinueWith(
              firstElementIcon: Icon(
                Icons.facebook,
                size: 30,
                color: Colors.blue[800],
              ),
              firstElementText: "Facebook",
              secondElementIcon: const Image(
                image: AssetImage('assets/images/google.jpg'),
                width: 30,
                height: 30,
              ),
              secondElementText: "Google"),
          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Dont have an account?',
                style: TextStyle(color: Colors.black54),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ]),
      )),
    );
  }

  _checkuser(context) {
    User user = User(
        email: _email.text, password: _password.text, fullName: 'fullName');

    User.currentUser = user;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
