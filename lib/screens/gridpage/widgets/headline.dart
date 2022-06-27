import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/gradient_text.dart';
import 'package:flutter/cupertino.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    Key? key,
  }) : super(key: key);
  final style = const TextStyle(
      fontSize: 30, // fontFamily: kNexaFont,
      color: kAppGreyColor,
      fontWeight: FontWeight.bold,
      height: 1.1);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Feel ', style: style),
            AppGradientText(
              'better ',
              style: style,
            ),
            Text(
              'about ',
              style: style,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'finding ',
              style: style,
            ),
            AppGradientText(
              'healthcare',
              style: style,
            ),
          ],
        ),
      ],
    );
  }
}
