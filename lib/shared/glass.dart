import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism({
    Key? key,
    this.child,
    this.borderRadius,
    this.borderOpacity = 0.0,
    this.opacity = 0.6,
  }) : super(key: key);
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final double borderOpacity;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 10),
        child: Container(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.withOpacity(opacity),
                  Colors.blue.withOpacity(opacity - 0.1),
                  Colors.green.withOpacity(opacity + 0.1),
                ]),
            borderRadius: borderRadius,
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor.withOpacity(borderOpacity),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
