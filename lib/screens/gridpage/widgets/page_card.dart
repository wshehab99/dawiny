import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/glass.dart';
import 'package:flutter/material.dart';

class PageCard extends StatelessWidget {
  const PageCard({
    Key? key,
    required this.imgPath,
    required this.text,
  }) : super(key: key);
  final String imgPath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      clipBehavior: Clip.antiAlias,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16.0), boxShadow: [
        BoxShadow(
          blurRadius: 4.0,
          color: kAppGreenColor.withOpacity(0.1),
          spreadRadius: 4.0,
        ),
      ]),
      child: GlassMorphism(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                imgPath,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    color: kAppWhiteColor,
                    fontSize: 16,
                    fontFamily: kNexaFont,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
