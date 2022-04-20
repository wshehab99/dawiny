import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/registration/registration.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/intro_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      print(state);
    }, builder: (context, state) {
      AppCubit cubit = AppCubit.get(context);
      return Scaffold(
        body: Stack(
          children: [
            PageView(
              onPageChanged: ((value) {
                cubit.changePage(value);
              }),
              controller: cubit.controller,
              children: const [
                InroScreen(
                    desc:
                        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                    img: 'doctorw2.png',
                    title: 'Find Doctor'),
                InroScreen(
                    desc:
                        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                    img: 'doctorW.jpg',
                    title: 'Find Nurse'),
                InroScreen(
                    desc:
                        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                    img: 'videoCon.png',
                    title: 'video consulting'),
              ],
            ),
            SizedBox(
              width: ScreenUtil().screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()),
                      );
                    },
                    child: const Text(
                      'skip',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                    child: AppButton(
                      text: cubit.curentPage < 2 ? 'Next' : 'Done',
                      onPressed: () {
                        if (cubit.curentPage < 2) {
                          cubit.controller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen()),
                          );
                        }
                      },
                      bottenColor: Colors.blue,
                      textColor: Colors.white,
                      borderradius: BorderRadius.circular(60),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: SmoothPageIndicator(
                      controller: cubit.controller,
                      count: 3,
                      effect: const SlideEffect(
                        dotColor: Color.fromARGB(134, 158, 158, 158),
                        activeDotColor: Color.fromARGB(255, 88, 139, 206),
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
