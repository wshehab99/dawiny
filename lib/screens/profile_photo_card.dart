import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoCard extends StatefulWidget {
  ProfilePhotoCard(
      {Key? key,
      required this.title,
      this.showIcon = true,
      required this.title2})
      : super(key: key);
  final String title;
  final String title2;
  final bool showIcon;
  @override
  State<ProfilePhotoCard> createState() => _ProfilePhotoCardState();
}

class _ProfilePhotoCardState extends State<ProfilePhotoCard> {
  XFile? userImage;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: Colors.grey.shade200,
                offset: const Offset(0, 15),
                spreadRadius: 10)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: (() async {
              return showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      title: Text("choose from"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  var s = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (s != null) {
                                    userImage = s;
                                  }
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text("gallery")),
                            ElevatedButton(
                                onPressed: () async {
                                  var s = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  if (s != null) {
                                    userImage = s;
                                  }
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text("camera")),
                          ],
                        ),
                      ],
                    );
                  });
            }),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Column(
                    children: [
                      if (widget.showIcon)
                        Container(
                          height: MediaQuery.of(context).size.width * .3,
                          width: MediaQuery.of(context).size.width * .3,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: userImage == null
                              ? const Icon(Icons.cloud_upload_rounded)
                              : Image.file(
                                  File(userImage!.path),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      if (widget.showIcon)
                        SizedBox(
                          height: 10,
                        ),
                      userImage == null
                          ? Text(
                              "Upload Photo Profile",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.w600),
                            )
                          : Text(
                              "Change Photo",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.w600),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
