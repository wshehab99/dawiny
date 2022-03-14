import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:find_doctor/screens/welcome/welcomescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Timer(
        const Duration(seconds: 3),
        (() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
          // Navigator.of(context).pushNamed("WelcomeScreen");
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/heartbeat.gif',
          height: 150.h,
        ),
      ),
    );
  }
}
