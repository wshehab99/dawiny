import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constant.dart';

import '../../shared/searchBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_list_widget..dart';

// ignore: must_be_immutable
class DoctorListScreen extends StatelessWidget {
  DoctorListScreen({Key? key, this.dignoseName, this.videocall})
      : super(key: key);
  bool? videocall;
  String? dignoseName;
  List shownList = [];
  String value1 = " ";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          cubit.getDoctor();
          shownList = cubit.searchAboutDoctor(dignoseName!, value1, videocall);
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/icons/menu.svg'),
                          SvgPicture.asset('assets/icons/profile.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Find Your Desired\n$dignoseName Doctor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: kTitleTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SearchBar(
                        onSearch: (value) {
                          value1 = value!;
                          shownList = cubit.searchAboutDoctor(
                              dignoseName!, value, videocall);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    (state is LoadingState)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: DoctorListWidget(
                                dignoseName: dignoseName!,
                                shownList: shownList),
                          ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
