import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/bloc/auth_cubit.dart';
import 'package:find_doctor/screens/signin/signin.dart';
import 'package:find_doctor/screens/teriaq_drop_down_menu.dart';
import 'package:find_doctor/shared/glass.dart';
import 'package:flutter/material.dart';

import '../../shared/app_CheckBox.dart';
import '../../shared/app_button.dart';
import '../../shared/textFieldApp.dart';
import '../profile_data.dart';
import '../profiledoctor.dart';
import '../signin/continue_with.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  final TextEditingController _firstName = TextEditingController();

  final TextEditingController _lastName = TextEditingController();
  final AppDropDownMenu _role = AppDropDownMenu(
    choices: const ['Doctor', 'Nurse', 'Patient'],
    hint: "Role",
    label: "Role",
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => AuthCubit(
              InitialAppState(),
            )),
        child: BlocConsumer<AuthCubit, AppStates>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            AuthCubit cubit = AuthCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
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
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            child: Column(children: [
                              SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.29,
                                child: GlassMorphism(
                                  // decoration: const BoxDecoration(
                                  //     color: Colors.blueAccent,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(200)),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       offset: Offset(0, 5),
                                  //       blurRadius: 10,
                                  //       color: Colors.black54)
                                  // ]),
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Image(
                                        image: AssetImage(
                                            'assets/images/dawinyLogoG.png'),
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
                              ),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TeriaqTextField(
                                          label: 'First Name',
                                          hint: "First Name",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter your full name';
                                            }
                                            return null;
                                          },
                                          controller: _firstName),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TeriaqTextField(
                                          label: 'Last Name',
                                          hint: "Last Name",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter your full name';
                                            }
                                            return null;
                                          },
                                          controller: _lastName),
                                      const SizedBox(
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
                                            if (value!.isEmpty ||
                                                value.length < 8) {
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
                                            if (value!.isEmpty ||
                                                value.length < 8) {
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
                                      _role,
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
                                        bottenColor:
                                            Colors.green.withOpacity(0.7),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await cubit
                                                .signUp(
                                              _email.text,
                                              _password.text,
                                              _firstName.text,
                                              _lastName.text,
                                              _role.dropdownValue!
                                                  .toLowerCase(),
                                            )
                                                .then((value) {
                                              if (value == 1) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserData()));
                                              } else if (value == -1) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DoctorProfile()));
                                              }
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Or continue with',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black54),
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
                                    image:
                                        AssetImage('assets/images/google.jpg'),
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
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SignIn();
                                        }));
                                      },
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
}
