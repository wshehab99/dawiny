import 'package:find_doctor/screens/Reset_passwod/reset_password.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:find_doctor/shared/gradient_text.dart';
import 'package:find_doctor/shared/textFieldApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../shared/constant.dart';

class VerifiyCode extends StatelessWidget {
  const VerifiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          children: [
            Image.asset(
              "assets/images/DawinyLogoK.png",
              width: 300,
              height: 300,
            ),
            AppGradientText(
              "verification code",
              style: TextStyle(
                  fontFamily: kNexaFont,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(15),
              numberOfFields: 6,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              onPressed: () {
                //VerifiyCode();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResetPassword()));
              },
              text: 'Verifiy',
              bottenColor: Colors.green.withOpacity(.7),
              textColor: Colors.white,
              borderradius: BorderRadius.circular(5),
            ),
          ],
        ),
      ),
    );
  }
}
