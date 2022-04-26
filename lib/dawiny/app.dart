import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/app_cubit.dart';
import '../bloc/app_states.dart';
import '../screens/welcome/welcomescreen.dart';

class Dawiny extends StatelessWidget {
  const Dawiny({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BlocProvider(
              create: (context) => AppCubit(InitialAppState()),
              child: const WelcomeScreen(),
            ),
            routes: {"WelcomeScreen": (context) => const WelcomeScreen()},
          );
        });
  }
}
