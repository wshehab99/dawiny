import 'package:find_doctor/model/user.dart';
import 'package:find_doctor/screens/profile_data.dart';
import 'package:find_doctor/screens/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/app_CheckBox.dart';
import '../../shared/app_button.dart';
import '../../shared/textFieldApp.dart';
import '../signin/continue_with.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final CheckBoxRow _checkBoxRow = CheckBoxRow();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/teriaq.PNG'),
            ),
            // Container(
            //   clipBehavior: Clip.antiAlias,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(200),
            //     color: Colors.white,
            //   ),
            //   child: Image(
            //     image: AssetImage('assets/images/teriaq.PNG'),
            //     height: 100.h,
            //   ),
            // ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Sign up for free",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7)),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
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
                      height: 20,
                    ),
                    _checkBoxRow,
                    AppButton(
                      text: 'Sign up',
                      borderradius: BorderRadius.circular(60),
                      textColor: Colors.white,
                      bottenColor: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //create new user
                          User.currentUser = User(
                              email: _email.text, password: _password.text);

                          User.users.add(User.currentUser!);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile()));
                        }
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Or continue with',
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black54),
            ),
            const SizedBox(
              height: 20,
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
                  'Already have an account?',
                  style: TextStyle(color: Colors.black54),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
