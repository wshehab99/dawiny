import 'package:flutter/material.dart';

class CenterList extends StatelessWidget {
  CenterList({Key? key, required this.centerName, required this.centerAddress})
      : super(key: key);
  String? centerName;
  String? centerAddress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(centerName!),
        Text(centerAddress!),
      ]),
    );
  }
}
