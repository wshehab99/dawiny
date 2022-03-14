import 'package:flutter/material.dart';

class InroScreen extends StatelessWidget {
  final String title;
  final String desc;
  final String img;
  InroScreen({required this.title, required this.desc, required this.img});

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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$title",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF518DFF),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(x),
                  child: Text(
                    '$desc',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color.fromARGB(249, 255, 255, 255),
            ),
          ),
        ),
      ]),
    );
  }
}
