import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContinueWith extends StatelessWidget {
  ContinueWith(
      {Key? key,
      required this.firstElementIcon,
      required this.firstElementText,
      required this.secondElementIcon,
      required this.secondElementText})
      : super(key: key);
  String firstElementText;
  Widget firstElementIcon;
  String secondElementText;
  Widget secondElementIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              firstElementIcon,
              const SizedBox(
                width: 10,
              ),
              Text(
                firstElementText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              secondElementIcon,
              const SizedBox(
                width: 10,
              ),
              Text(
                secondElementText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
