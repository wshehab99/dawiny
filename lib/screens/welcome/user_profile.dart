import 'package:find_doctor/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: kAppGreyColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kAppGreenColor.withOpacity(0.1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kAppGreyColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32.0,
            ),
            const CircleAvatar(
              maxRadius: 68,
              backgroundImage: AssetImage(
                "assets/images/photo.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
