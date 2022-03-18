import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  GridPage({Key? key}) : super(key: key);

  List<String> Names = [
    'Reservation of Clinics',
    'Services Request',
    'Video Call',
    'nearst Pharmacy',
    'Medical Diagnosis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(5, (index) {
          return GridTile(
            child: Card(
              color: Colors.green,
              child: Center(child: Text(Names[index])),
            ),
          );
        }),
      ),
    );
  }
}
