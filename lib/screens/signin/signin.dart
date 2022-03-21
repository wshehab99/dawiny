import 'package:find_doctor/screens/gridpage/gridpage.dart';

import 'package:find_doctor/screens/signin/continue_with.dart';
import 'package:find_doctor/screens/signup/signup.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../../shared/app_CheckBox.dart';
import '../../shared/app_button.dart';
import '../../shared/textFieldApp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool isCheck = false;
  CheckBoxRow checkBoxRow = CheckBoxRow();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.41,
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(180)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      color: Colors.black54)
                ]),
            child: Column(
              children: const [
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: Image(
                    image: AssetImage('assets/Dawiny-logos_white.png'),
                    height: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sign in to your account",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
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
                  CheckBoxRow(
                    isCheked: isCheck,
                    onPress: (value) {
                      setState(() {
                        isCheck = value!;
                      });
                    },
                  ),
                  AppButton(
                      text: 'Sign in',
                      bottenColor: Colors.blue,
                      textColor: Colors.white,
                      borderradius: BorderRadius.circular(20),
                      onPressed: isCheck
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                _checkuser(context);
                              }
                            }
                          : null),
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
                      return const SignUp();
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

//check if the email and password are in the list
  _checkuser(context) {
    User user = User(
      email: _email.text,
      password: _password.text,
    );
    for (int i = 0; i < User.users.length; i++) {
      if (user.email == User.users[i].email &&
          user.password == User.users[i].password) {
        User.currentUser = User.users[i];
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GridPage()));
        return;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Sothing wrong')));
  }
}
