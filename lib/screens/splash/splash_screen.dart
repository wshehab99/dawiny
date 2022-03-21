import 'dart:async';
import 'package:find_doctor/screens/congrats_screen/congratesScreen.dart';
import 'package:find_doctor/screens/welcome/welcomescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 100.h,
          child: Image.asset(
            'assets/images/Dawiny logo - Copy.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
