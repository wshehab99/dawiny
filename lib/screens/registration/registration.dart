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
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/teriaq.PNG'),
                ),
                // Container(
                //   clipBehavior: Clip.antiAlias,
                //   child: Image(
                //     image: AssetImage('assets/images/teriaq.PNG'),
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(80),
                //     color: Colors.white,
                //   ),
                //   height: 150,
                // ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  "Welacome To Teriag!",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
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
