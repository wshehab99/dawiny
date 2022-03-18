import 'package:find_doctor/screens/splash/splash_screen.dart';
import 'package:find_doctor/screens/welcome/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/doctors/doctors.dart';

class Teriaq extends StatelessWidget {
  const Teriaq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Doctors(),
            routes: {"WelcomeScreen": (context) => WelcomeScreen()},
          );
        });
  }
}
