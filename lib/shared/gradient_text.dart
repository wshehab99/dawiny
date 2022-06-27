import 'package:flutter/material.dart';

class AppGradientText extends StatelessWidget {
  const AppGradientText(
    this.text, {
    Key? key,
    this.colors,
    this.maxLines,
    this.textAlign,
    this.style,
  }) : super(key: key);

  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final List<Color>? colors;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
              colors: colors ??
                  [
                    Colors.blue,
                    Colors.green,
                  ])
          .createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
