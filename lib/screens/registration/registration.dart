import 'package:flutter/material.dart';

import '../../shared/app_button.dart';
import '../signin/signin.dart';
import '../signup/signup.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 100,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/Dawiny logo - 2.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  "Welcome To Dawiny!",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                AppButton(
                  text: "Sign Up",
                  bottenColor: Colors.blue,
                  textColor: Colors.white,
                  borderradius: BorderRadius.circular(60),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                    text: "Sign in",
                    bottenColor: const Color.fromARGB(255, 245, 244, 244),
                    textColor: Colors.blue,
                    borderradius: BorderRadius.circular(60),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
