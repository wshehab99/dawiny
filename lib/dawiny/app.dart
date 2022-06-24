import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/Book_Apointment/Book_Appointment.dart';
import 'package:find_doctor/screens/Video_call_now/VideoCallNow.dart';
import 'package:find_doctor/screens/doctors/doctor_list_screen.dart';
import 'package:find_doctor/screens/welcome/welcomescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/app_cubit.dart';
import '../bloc/app_states.dart';
import '../screens/gridpage/gridpage.dart';
import '../screens/videocallscreen/video_call_screen.dart';

class Dawiny extends StatelessWidget {
  const Dawiny({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (value) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BlocProvider(
              create: (context) => AppCubit(InitialAppState()),
              child: VideoCallNow(),
            ),
            routes: {"WelcomeScreen": (context) => const WelcomeScreen()},
          );
        });
  }
}
