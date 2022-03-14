import 'dart:ffi';

import 'package:find_doctor/screens/registration/registration.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/intro_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();
  int curentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: ((value) {
              setState(() {
                curentPage = value;
              });
            }),
            controller: _controller,
            children: [
              InroScreen(
                  desc:
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                  img: 'doctor.jpg',
                  title: 'Find Doctor'),
              InroScreen(
                  desc:
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                  img: 'nuers1.jpg',
                  title: 'Find Nuers'),
              InroScreen(
                  desc:
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                  img: 'video.jpg',
                  title: 'video consulting'),
            ],
          ),
          Container(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()),
                    );
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                  child: Container(
                    child: AppButton(
                      text: curentPage < 2 ? 'Next' : 'Done',
                      onPressed: () {
                        if (curentPage < 2) {
                          _controller.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()),
                          );
                        }
                      },
                      bottenColor: Colors.blue,
                      textColor: Colors.white,
                      borderradius: BorderRadius.circular(60),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Container(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: SlideEffect(
                        dotColor: Color.fromARGB(134, 158, 158, 158),
                        activeDotColor: Color.fromARGB(255, 88, 139, 206),
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
