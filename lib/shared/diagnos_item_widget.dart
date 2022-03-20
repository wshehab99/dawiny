import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagnosItem extends StatelessWidget {
  DiagnosItem({Key? key, this.text, this.icon, this.ontap}) : super(key: key);
  Widget? icon;
  String? text;
  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: icon,
      title: Text(
        text!,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  static Map<String, Widget> specialtiesList1 = {
    "Dentistry": Image.asset("assets/icons/dental_surgeon.png"),
  };
  static List<Map> specialtiesList = [
    {
      'text': "Dermatology",
      'icon': Image.asset(
        "assets/icons/dermatology.png",
        color: Colors.blue,
        height: 40,
      ),
    },
    {
      'text': "Ear",
      'icon': Image.asset(
        "assets/icons/ear.png",
        color: Colors.blue,
        height: 40,
      ),
    },
    {
      'text': "Ophthalmology",
      'icon': Image.asset(
        "assets/icons/eye.png",
        color: Colors.blue,
        height: 40,
        width: 40,
      ),
    },
    {
      'text': "Nephrology",
      'icon': Image.asset(
        "assets/icons/kidney.png",
        color: Colors.blue,
        height: 40,
        width: 40,
      ),
    },
    {
      'text': "Dentistry",
      'icon': Image.asset(
        "assets/icons/dental_surgeon.png",
        color: Colors.blue,
        height: 40,
      ),
    },
    {
      'text': "Brain",
      'icon': Image.asset(
        "assets/icons/brain.png",
        color: Colors.blue,
        height: 40,
      ),
    },
    {
      'text': "Cardiology",
      'icon': Image.asset(
        "assets/icons/heart_surgeon.png",
        color: Colors.blue,
        height: 40,
      ),
    },
    {
      'text': "Neurology",
      'icon': Image.asset(
        "assets/icons/neuron.png",
        color: Colors.blue,
        height: 40,
        width: 40,
      ),
    },
    {
      'text': "Orthopedics",
      'icon': Image.asset(
        "assets/icons/fracture.png",
        color: Colors.blue,
        height: 40,
        width: 40,
      ),
    },
    {
      'text': "Pediatrics",
      'icon': Image.asset(
        "assets/icons/child.png",
        color: Colors.blue,
        height: 40,
        width: 40,
      ),
    },
    {
      'text': "Endocrinology",
      'icon': Image.asset(
        "assets/icons/endocrine.png",
        color: Colors.blue,
        height: 40,
        width: 40,
      ),
    },
  ];
}
