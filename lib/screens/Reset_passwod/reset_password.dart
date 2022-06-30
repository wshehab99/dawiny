import 'package:find_doctor/shared/textFieldApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/app_button.dart';
import '../../shared/constant.dart';
import '../../shared/gradient_text.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/DawinyLogoK.png",
              height: 300,
            ),
            AppGradientText(
              "Reset Password",
              style: TextStyle(
                  fontFamily: kNexaFont,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TeriaqTextField(
              hint: " Enter your password",
              label: "password",
            ),
            SizedBox(
              height: 20,
            ),
            TeriaqTextField(
              hint: " confirm password",
              label: "confirm password",
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              onPressed: () {},
              text: 'Save',
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
