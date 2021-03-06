import 'package:flutter/material.dart';

import '../../bloc/app_cubit.dart';
import '../../bloc/app_states.dart';
import '../../model/user.dart';
import '../../shared/app_CheckBox.dart';
import '../../shared/app_button.dart';
import '../../shared/textFieldApp.dart';
import '../profile_data.dart';
import '../signin/continue_with.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../signin/signin.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

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
                                        //create new user
                                        User.currentUser = User(
                                            email: _email.text,
                                            password: _password.text);

                                        User.users.add(User.currentUser!);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserProfile()));
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
}
