import 'package:flutter/material.dart';

import '../screens/doctors/doctorDetailScreen.dart';
import 'constant.dart';

class DoctorCard extends StatelessWidget {
  String? id;
  final String? _name;
  final String? _description;
  String? imageUrl;
  final _bgColor;
  bool? videoCall;
  DoctorCard(this.id, this._name, this._description, this._bgColor,
      {Key? key, this.videoCall, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(id, _name, _description, videoCall),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : const NetworkImage(
                      "https://cdn3.iconfinder.com/data/icons/black-easy/512/538642-user_512x512.png"),
            ),
            title: Text(
              _name!,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _description!,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
