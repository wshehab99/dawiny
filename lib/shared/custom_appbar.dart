import 'package:find_doctor/shared/constant.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  CustomAppbar(
    this.context, {
    Key? key,
    required this.titleText,
    this.actions,
  }) : super(
          key: key,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            titleText,
            style: const TextStyle(
              color: kAppGreyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: kAppGreenColor.withOpacity(0.1),
          actions: actions,
          leading: IconButton(
            icon: Builder(builder: (context) {
              return const Icon(
                Icons.arrow_back_ios,
                color: kAppGreyColor,
              );
            }),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );

  final String titleText;
  final BuildContext context;
  final List<Widget>? actions;
}
