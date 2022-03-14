import 'package:flutter/material.dart';

class ProfilePhotoCard extends StatelessWidget {
  const ProfilePhotoCard({Key? key, this.userImage}) : super(key: key);
  final userImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.grey.shade200,
              offset: const Offset(0, 15),
              spreadRadius: 10)
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Colors.blue.shade100.withOpacity(0.15),
            )),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.blue[50],
              child: userImage == null
                  ? const Icon(Icons.cloud_upload_rounded)
                  : Image(
                      image: AssetImage(userImage),
                      width: 40,
                    ),
            ),
            Text(
              "Upload Photo Profile",
              style: TextStyle(
                  color: Colors.blue[600], fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
