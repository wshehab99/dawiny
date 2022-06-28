import 'package:flutter/material.dart';

import '../../../shared/constant.dart';
import '../../../shared/gradient_text.dart';

class InroScreen extends StatelessWidget {
  final String title;
  final String desc;
  final String img;
  const InroScreen(
      {Key? key, required this.title, required this.desc, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.height * 0.04;
    return Container(
      color: Colors.white,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$img"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -15,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 0),
                  child: AppGradientText(
                    "${title}",
                    style: TextStyle(
                        fontFamily: kNexaFont,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  //AppGradientTex (
                  //   title,
                  //   style: const TextStyle(
                  //       fontSize: 30,
                  //       color: Color(0xFF518DFF),
                  //       fontWeight: FontWeight.w900),
                  // ),
                ),
                Padding(
                  padding: EdgeInsets.all(x),
                  child: Text(desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color.fromARGB(249, 255, 255, 255),
            ),
          ),
        ),
      ]),
    );
  }
}
