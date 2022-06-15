import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/model/user.dart';
import 'package:find_doctor/screens/gridpage/gridpage.dart';
import 'package:find_doctor/screens/profile_data.dart';
import 'package:find_doctor/screens/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../bloc/app_cubit.dart';
import '../../shared/app_CheckBox.dart';
import '../../shared/app_button.dart';
import '../../shared/textFieldApp.dart';
import '../signin/continue_with.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _address = TextEditingController();

  final TextEditingController _datetime = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => AppCubit(
              InitialAppState(),
            )),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.29,
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 10,
                                color: Colors.black54)
                          ]),
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 40,
                          ),
                          // CircleAvatar(
                          //   backgroundColor: Colors.white,
                          //   radius: 50,
                          //   child: Image(
                          //     image: AssetImage('assets/Dawiny-logos_white.png'),
                          //     height: double.infinity,
                          //     fit: BoxFit.fitHeight,
                          //   ),
                          // ),
                          Image(
                            image:
                                AssetImage('assets/images/Dawiny logo - 2.png'),
                            width: 220,
                            height: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Sign up for free",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TeriaqTextField(
                                label: 'Full Name',
                                hint: "Full Name",
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'please enter your full name';
                                },
                                controller: _fullName),
                            const SizedBox(
                              height: 20,
                            ),
                            TeriaqTextField(
                              label: 'Date of birth',
                              hint: "Date of birth",
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'please enter your birthday';
                                return null;
                              },
                              icon: const Icon(Icons.calendar_month),
                              controller: _dateController,
                              onTap: () {
                                _selectDate(context);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TeriaqTextField(
                              label: 'Address',
                              hint: "Address",
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'please enter your address';
                              },
                              controller: _address,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TeriaqTextField(
                              label: 'Email',
                              hint: 'Email',
                              controller: _email,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                        .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TeriaqTextField(
                                controller: _password,
                                label: 'Password',
                                hint: 'Password',
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 8) {
                                    return 'please enter a password more than 8 character';
                                  }
                                  return null;
                                },
                                hide: true),
                            const SizedBox(
                              height: 20,
                            ),
                            TeriaqTextField(
                                controller: _confirmPassword,
                                label: 'Confirm Password',
                                hint: 'Password',
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 8) {
                                    return 'please enter a password more than 8 character';
                                  }
                                  if (value != _password.text) {
                                    return "Password does not match!";
                                  }
                                  return null;
                                },
                                hide: true),
                            const SizedBox(
                              height: 20,
                            ),
                            CheckBoxRow(
                              isCheked: cubit.remeberMeValue,
                              onPress: (value) {
                                cubit.remeberMe(value!);
                              },
                            ),
                            AppButton(
                              text: 'Sign up',
                              borderradius: BorderRadius.circular(60),
                              textColor: Colors.white,
                              bottenColor: Colors.blue,
                              onPressed: cubit.remeberMeValue
                                  ? () {
                                      if (_formKey.currentState!.validate()) {
                                        // create new user
                                        cubit.signup(
                                            _email.text,
                                            _password.text,
                                            _fullName.text,
                                            "doctor",
                                            _address.text,
                                            _datetime.text);
                                        if (state is DoneState) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GridPage()));
                                        } else if (state is ErrorState) {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    content:
                                                        Text(cubit.errorMsg!),
                                                  ));
                                        } else if (state is LoadingState) {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const AlertDialog(
                                                      insetPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 120),
                                                      content: SizedBox(
                                                        height: 120,
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                      )));
                                        }
                                      }
                                    }
                                  : null,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Or continue with',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContinueWith(
                        firstElementIcon: Icon(
                          Icons.facebook,
                          size: 30,
                          color: Colors.blue[800],
                        ),
                        firstElementText: "Facebook",
                        secondElementIcon: const Image(
                          image: AssetImage('assets/images/google.jpg'),
                          width: 30,
                          height: 30,
                        ),
                        secondElementText: "Google"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.black54),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignIn();
                              }));
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ]),
                ),
              ),
            );
          }),
        ));
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
