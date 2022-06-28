import 'package:find_doctor/screens/videocalldetails/videocalldetails.dart';
import 'package:find_doctor/shared/diagnosesList.dart';
import 'package:find_doctor/shared/gradient_text.dart';
import 'package:flutter/material.dart';

import '../../shared/constant.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
              child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Image.asset("assets/images/dawinyLogoG.png")),
            ),
            AppGradientText(
              "Future of Healtcare",
              style: TextStyle(fontFamily: kNexaFont, fontSize: 30),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiagnosesList(
                        vidoecall: true,
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF0277BD).withOpacity(.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "book a Specialized Doctor",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF0277BD).withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.coronavirus_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Get Corona Consultation",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 209, 29, 38),
                      ),
                      child: const Center(
                        child: Text(
                          "Free",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
