import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/gridpage/gridpage.dart';
import 'package:find_doctor/screens/welcome/welcomescreen.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/app_cubit.dart';
import '../bloc/app_states.dart';

class Dawiny extends StatelessWidget {
  Dawiny({Key? key}) : super(key: key);
  int? navigationvalue;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primaryColor: kBlueColor, fontFamily: kRobotoCondensedFont),
            home: BlocProvider(
              create: (context) => AppCubit(InitialAppState()),
              child: BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    AppCubit cubit = AppCubit.get(context);
                    print(cubit.accessToken);
                    cubit.stayLogin().then((value) {
                      navigationvalue = value;
                      if (navigationvalue == 0 || navigationvalue == -1) {
                        print(cubit.accessToken);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const WelcomeScreen())));
                      } else {
                        print(cubit.accessToken);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => GridPage())));
                      }
                      print(value);
                    });
                    return const Scaffold(
                      body: SafeArea(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
