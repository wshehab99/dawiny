//import 'package:find_doctor/screens/Forget_Password/verifiy_code.dart';
import 'package:email_auth/email_auth.dart';
import 'package:find_doctor/screens/reset_passwod/verifiy_code.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:find_doctor/shared/gradient_text.dart';
import 'package:find_doctor/shared/textFieldApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_auth/email_auth.dart';

import '../../shared/constant.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _email = TextEditingController();
  // final TextEditingController _OtpCode = TextEditingController();
  // EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");

  // void sendOtp() async {
  //   EmailAuth.sessionName = "Test session";
  //   emailAuth.sessionName = "test session";
  //   var res = await emailAuth.sendOtp(recipientMail: _email.text);
  //   if (res) {
  //     print("OTP Sent");
  //   } else {
  //     print("Error");
  //   }
  // }

  // void VerifiyOtp() {
  //   var res = emailAuth.validateOtp(
  //       recipientMail: _email.text, userOtp: _OtpCode.text);
  //   if (res) {
  //     print("OtP verified");
  //   } else {
  //     print("invalid verifiy");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/DawinyLogoK.png",
                width: 300,
                height: 300,
              ),
              AppGradientText(
                "Forget Password",
                style: TextStyle(
                    fontFamily: kNexaFont,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "please enter your email address , you will recive a link to create new password via email",
                  maxLines: 3,
                  style: TextStyle(
                      letterSpacing: 1,
                      wordSpacing: 2,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TeriaqTextField(
                  hint: " Enter your Email",
                  label: "Email",
                  controller: _email,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 20),
                child: AppButton(
                  onPressed: () {
                    //sendOtp();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VerifiyCode()));
                  },
                  text: 'Check Email',
                  bottenColor: Colors.green.withOpacity(.7),
                  textColor: Colors.white,
                  borderradius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
