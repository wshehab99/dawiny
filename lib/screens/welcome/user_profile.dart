import 'package:find_doctor/screens/profile_photo_card.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final userNameController = TextEditingController(text: 'Morsy Hesham');
  final emailController = TextEditingController(text: 'morshy@gmail.com');
  final passController = TextEditingController(text: '****************');
  final addressControllerr = TextEditingController(text: 'Mansoura');
  final ageControllerr = TextEditingController(text: '25');
  final genderControllerr = TextEditingController(text: '25');

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        titleText: 'Profile',
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: kAppGreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32.0,
            ),
            ProfilePhotoCard(
              title: 'upload photo',
              title2: 'change photo',
              placeholerImgPath: "assets/images/photo.jpg",
            ),
            SizedBox(
              height: 8.0,
            ),
            ProfileInput(
              controller: userNameController,
              title: 'Name',
            ),
            ProfileInput(
              title: 'Email',
              controller: emailController,
            ),
            ProfileInput(title: 'Change Password ', controller: passController),
            ProfileInput(title: 'Address ', controller: addressControllerr),
            ProfileInput(title: 'Age ', controller: ageControllerr),
          ],
        ),
      ),
    );
  }
}

class ProfileInput extends StatefulWidget {
  const ProfileInput({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;

  @override
  State<ProfileInput> createState() => _ProfileInputState();
}

class _ProfileInputState extends State<ProfileInput> {
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: kAppGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: widget.controller,
            style: TextStyle(color: kAppGreyColor),
            decoration: InputDecoration(
                filled: true,
                fillColor: kAppGreenColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
        ],
      ),
    );
  }
}
