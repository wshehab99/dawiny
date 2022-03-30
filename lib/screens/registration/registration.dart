import 'package:find_doctor/screens/signin/signin.dart';
import 'package:find_doctor/screens/signup/signup.dart';

import 'package:flutter/material.dart';

import '../../shared/app_button.dart';

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
                SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/Dawiny logo - 2.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                // Image(
                //   image: AssetImage(

                //   ),
                //   width: 250,
                //   height: 100,
                //   fit: BoxFit.cover,
                // ),
                SizedBox(height: 80),
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
                      MaterialPageRoute(builder: (context) => const SignUp()),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
