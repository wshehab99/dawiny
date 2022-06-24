import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/doctor_time/doctor_time_screen.dart';
import 'package:find_doctor/screens/profile_photo_card.dart';
import 'package:find_doctor/screens/teriaq_drop_down_menu.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shared/textFieldApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final AppDropDownMenu appDropDownMenu = AppDropDownMenu(
    choices: const ['Male', 'Femle'],
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              body: SafeArea(
            child: (state is LoadingState)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (state is ErrorState)
                    ? AlertDialog(
                        title: const Text('Error !'),
                        content: Text(cubit.errorMsg ??
                            "Something went wrong, please try again later"),
                        actions: [
                          ElevatedButton(
                              onPressed: cubit.backToNormalState,
                              child: const Text("back")),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/Dawiny logo - 2.png',
                                      ),
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ProfilePhotoCard(),
                              const SizedBox(
                                height: 15,
                              ),
                              const Divider(),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    appDropDownMenu,
                                    //TeriaqTextField(label: 'Gender', hint: "Gender", controller: _gender),

                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TeriaqTextField(
                                      label: 'Date of birth',
                                      hint: "Date of birth",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your birthday';
                                        }
                                        return null;
                                      },
                                      icon: const Icon(Icons.calendar_month),
                                      controller: _dateController,
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TeriaqTextField(
                                      label: 'Address',
                                      hint: "Address",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your address';
                                        }
                                        return null;
                                      },
                                      controller: _address,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                  child: AppButton(
                                      text: 'Confirm',
                                      borderradius: BorderRadius.circular(60),
                                      textColor: Colors.white,
                                      bottenColor: Colors.blue,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate() &&
                                            appDropDownMenu.dropdownValue !=
                                                null) {
                                          cubit.updatePProfile(data: {
                                            'gender': appDropDownMenu
                                                .dropdownValue!
                                                .toLowerCase(),
                                            "clinicAddress": _address.text,
                                            "dateOfBirth": _dateController.text,
                                          }).then((value) {
                                            if (value == 1) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DoctorTime()));
                                            }
                                          });
                                        }
                                      }))
                            ]),
                      ),
          ));
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != DateTime.now()) {
      _dateController.text = DateFormat.yMMMd().format(selected);
    }
  }
}
