import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  BorderRadius borderradius = BorderRadius.circular(60);
  void Function()? onPressed;
  final String text;
  Color bottenColor = Colors.blue;
  Color textColor = Colors.white;
  AppButton({
    required this.text,
    required this.bottenColor,
    required this.textColor,
    required this.borderradius,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: borderradius,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: bottenColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ),
    );
  }
}
