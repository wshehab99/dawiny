import 'dart:io';

import 'package:find_doctor/bloc/api_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePhotoCard extends StatefulWidget {
  const ProfilePhotoCard(
      {Key? key,
      required this.title,
      this.showIcon = true,
      required this.title2,
      this.placeholerImgPath})
      : super(key: key);
  final String title;
  final String title2;
  final bool showIcon;
  final String? placeholerImgPath;

  @override
  State<ProfilePhotoCard> createState() => _ProfilePhotoCardState();
}

class _ProfilePhotoCardState extends State<ProfilePhotoCard> {
  XFile? userImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => ApiCubit(InitialAppState())),
      child: BlocConsumer<ApiCubit, AppStates>(
          listener: ((context, state) {}),
          builder: (context, state) {
            ApiCubit cubit = ApiCubit.get(context);
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: (() async {
                      return showDialog(
                          context: context,
                          builder: (builder) {
                            return AlertDialog(
                              title: const Text("choose from",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  )),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                          Colors.green.withOpacity(0.1),
                                        )),
                                        onPressed: () async {
                                          var s = await _picker.pickImage(
                                              source: ImageSource.gallery);

                                          if (s != null) {
                                            userImage = s;
                                          }
                                          await cubit.uploadFile(s!.path);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("gallery")),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                          Colors.green.withOpacity(0.1),
                                        )),
                                        onPressed: () async {
                                          var s = await _picker.pickImage(
                                              source: ImageSource.camera);
                                          if (s != null) {
                                            userImage = s;
                                          }
                                          Navigator.pop(context);
                                          await cubit.uploadFile(s!.path);
                                        },
                                        child: const Text("camera")),
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
                                  height:
                                      MediaQuery.of(context).size.width * .3,
                                  width: MediaQuery.of(context).size.width * .3,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: userImage == null
                                      ? (widget.placeholerImgPath != null
                                          ? CircleAvatar(
                                              maxRadius: 68,
                                              backgroundImage: NetworkImage(
                                                widget.placeholerImgPath!,
                                              ),
                                            )
                                          : const Icon(
                                              Icons.cloud_upload_rounded))
                                      : Image.file(
                                          File(userImage!.path),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              if (widget.showIcon)
                                const SizedBox(
                                  height: 10,
                                ),
                              userImage == null
                                  ? Text(
                                      widget.title,
                                      style: TextStyle(
                                          color: Colors.blue[600],
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Text(
                                      widget.title2,
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
          }),
    );
  }
}
