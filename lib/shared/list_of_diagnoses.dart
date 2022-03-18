import 'package:flutter/material.dart';

Widget buildDiagnosItem() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "eyes",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
