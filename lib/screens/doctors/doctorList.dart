import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constant.dart';
import '../../shared/doctorCard.dart';
import '../../shared/searchBar.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Find Your Desired\nDoctor',
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
                  hint: "Search for doctors",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                child: buildDoctorList(),
              ),
            ],
          )),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ListView(
        children: [
          DoctorCard(
            "6297b0aafcbbc7219c01c9e0",
            'Dr. Stella Kane',
            'Heart Surgeon - Flower Hospitals',
            // 'assets/images/doctor1.png',
            kBlueColor,
          ),
          const SizedBox(
            height: 20,
          ),
          DoctorCard(
            "6297b0aafcbbc7219c01c9e0",
            'Dr. Stella Kane',
            'Heart Surgeon - Flower Hospitals',
            // 'assets/images/doctor1.png',
            kBlueColor,
          ),
          const SizedBox(
            height: 20,
          ),
          DoctorCard(
            "6297b0aafcbbc7219c01c9e0",
            'Dr. Stella Kane',
            'Heart Surgeon - Flower Hospitals',
            // 'assets/images/doctor1.png',
            kBlueColor,
          ),
          const SizedBox(
            height: 20,
          ),
          DoctorCard(
            "6297b0aafcbbc7219c01c9e0",
            'Dr. Stella Kane',
            'Heart Surgeon - Flower Hospitals',
            // 'assets/images/doctor1.png',
            kBlueColor,
          ),
          const SizedBox(
            height: 20,
          ),
          DoctorCard(
            "6297b0aafcbbc7219c01c9e0",
            'Dr. Stella Kane',
            'Heart Surgeon - Flower Hospitals',
            // 'assets/images/doctor1.png',
            kBlueColor,
          ),
          const SizedBox(
            height: 20,
          ),
          DoctorCard(
            "6297b0aafcbbc7219c01c9e0",
            'Dr. Joseph Cart',
            'Dental Surgeon - Flower Hospitals',
            // 'assets/images/doctor2.png',
            kYellowColor,
          ),
          const SizedBox(
            height: 20,
          ),
          DoctorCard(
            "6297b0aafcbbc7219c01c9e0",
            'Dr. Stephanie',
            'Eye Specialist - Flower Hospitals',
            // 'assets/images/doctor3.png',
            kOrangeColor,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
