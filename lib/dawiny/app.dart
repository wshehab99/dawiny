import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/gridpage/gridpage.dart';
import 'package:find_doctor/screens/signin/signin.dart';
import 'package:find_doctor/screens/welcome/welcomescreen.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/app_cubit.dart';
import '../bloc/app_states.dart';
import '../screens/nurse_location/nurse_location.dart';

class Dawiny extends StatefulWidget {
  const Dawiny({Key? key}) : super(key: key);

  @override
  State<Dawiny> createState() => _DawinyState();
}

class _DawinyState extends State<Dawiny> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      updatePProfile(data: {"status": "offline"}).then((value) {
        print(value);
      });
    } else if (state == AppLifecycleState.resumed) {
      updatePProfile(data: {"status": "online"}).then((value) {
        print(value);
      });
    }
  }

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
            title: 'Dawiny',
            theme: ThemeData(
                primaryColor: kBlueColor, fontFamily: kRobotoCondensedFont),
            home: BlocProvider(
              create: (context) => AppCubit(InitialAppState()),
              child: BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    AppCubit cubit = AppCubit.get(context);

                    cubit.stayLogin().then((value) {
                      navigationvalue = value;
                      print("value = $value");
                      if (navigationvalue == -1) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const WelcomeScreen())));
                      } else if (navigationvalue == 0) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignIn())));
                      } else if (navigationvalue == 2) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => GridPage())));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => NurseLocation())));
                      }
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
