import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/profile_photo_card.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController(text: '****************');
  final addressControllerr = TextEditingController();
  final dateOfBirth = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          cubit.getCurrentUser().then((value) {
            firstNameController.text = value['firstName'] ?? " ";
            lastNameController.text = value['lastName'] ?? " ";
            emailController.text = value['email'] ?? " ";
            dateOfBirth.text = value['dateOfBirth'] ?? " ";
            addressControllerr.text =
                value['address'] ?? value['clincAddress'] ?? " ";
          });

          if (state is LoadingState) {
            return Scaffold(
                appBar: CustomAppbar(
                  context,
                  titleText: 'Profile',
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ));
          }
          return Scaffold(
            appBar: CustomAppbar(
              context,
              titleText: 'Profile',
              actions: [
                InkWell(
                  onTap: () {
                    Map data = {};
                    data.addAll({
                      "clinicAddress": addressControllerr.text,
                    });
                    if (firstNameController.text !=
                        cubit.currentUser!['firstName']) {
                      data.addAll({"firstName": firstNameController.text});
                    }
                    if (lastNameController.text !=
                        cubit.currentUser!['lastName']) {
                      data.addAll({"lastName": lastNameController.text});
                    }
                    if (emailController.text != cubit.currentUser!['email']) {
                      data.addAll({
                        "email": lastNameController.text,
                      });
                    }

                    cubit.updatePProfile(data: data).then((value) {
                      Navigator.pop(context);
                    });
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32.0,
                    ),
                    ProfilePhotoCard(
                      title: 'upload photo',
                      title2: 'change photo',
                      placeholerImgPath: "assets/images/photo.jpg",
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ProfileInput(
                      controller: firstNameController,
                      title: 'Firest Name',
                    ),
                    ProfileInput(
                      controller: lastNameController,
                      title: 'Last Name',
                    ),
                    ProfileInput(
                      title: 'Email',
                      controller: emailController,
                    ),
                    ProfileInput(
                        title: 'Change Password ', controller: passController),
                    ProfileInput(
                        title: 'Address ', controller: addressControllerr),
                    ProfileInput(title: 'Birthday ', controller: dateOfBirth),
                  ],
                ),
              ),
            ),
          );
        },
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
            style: const TextStyle(
              color: kAppGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: widget.controller,
            style: const TextStyle(color: kAppGreyColor),
            decoration: InputDecoration(
                filled: true,
                fillColor: kAppGreenColor.withOpacity(0.1),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
        ],
      ),
    );
  }
}
