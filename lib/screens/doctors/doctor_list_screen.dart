import 'package:find_doctor/screens/doctors/doctor_list_widget..dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constant.dart';

import '../../shared/searchBar.dart';

class DoctorListScreen extends StatelessWidget {
  DoctorListScreen({Key? key, this.dignoseName}) : super(key: key);

  String? dignoseName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Find Your Desired\n$dignoseName Doctor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: DoctorListWidget(dignoseName: dignoseName!),
              ),
            ],
          )),
    );
  }

  buildDoctorList() {
    //   child: ListView(
    //     children: [
    //       DoctorCard(
    //         'Dr. Stella Kane',
    //         '$dignoseName - Flower Hospitals',
    //         'assets/images/doctor1.png',
    //         kBlueColor,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       DoctorCard(
    //         'Dr. Stella Kane',
    //         '$dignoseName - Flower Hospitals',
    //         'assets/images/doctor1.png',
    //         kBlueColor,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       DoctorCard(
    //         'Dr. Stella Kane',
    //         '$dignoseName - Flower Hospitals',
    //         'assets/images/doctor1.png',
    //         kBlueColor,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       DoctorCard(
    //         'Dr. Stella Kane',
    //         '$dignoseName - Flower Hospitals',
    //         'assets/images/doctor1.png',
    //         kBlueColor,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       DoctorCard(
    //         'Dr. Stella Kane',
    //         '$dignoseName - Flower Hospitals',
    //         'assets/images/doctor1.png',
    //         kBlueColor,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       DoctorCard(
    //         'Dr. Joseph Cart',
    //         '$dignoseName - Flower Hospitals',
    //         'assets/images/doctor2.png',
    //         kYellowColor,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       DoctorCard(
    //         'Dr. Stephanie',
    //         '$dignoseName - Flower Hospitals',
    //         'assets/images/doctor3.png',
    //         kOrangeColor,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //     ],
    //   ),
    // );
  }
}
