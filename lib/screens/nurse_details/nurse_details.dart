import 'package:flutter/material.dart';

class NurseDetals extends StatelessWidget {
  NurseDetals({Key? key, required this.name}) : super(key: key);
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(name!),
          const ListTile(
            title: Text("01144287526"),
            trailing: Icon(Icons.call),
          )
        ],
      )),
    );
  }
}
