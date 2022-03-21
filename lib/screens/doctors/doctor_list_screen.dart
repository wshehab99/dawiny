import 'package:find_doctor/screens/doctors/doctor_list_widget..dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../fake_data/fake_data.dart';
import '../../shared/constant.dart';

import '../../shared/searchBar.dart';

class DoctorListScreen extends StatefulWidget {
  DoctorListScreen({Key? key, this.dignoseName}) : super(key: key);
  String? dignoseName;

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  List shownList = [];
  @override
  void initState() {
    shownList = FakeData.doctors
        .where(
          (element) => element.specialist == widget.dignoseName,
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  'Find Your Desired\n${widget.dignoseName} Doctor',
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
                    setState(() {
                      shownList = FakeData.doctors
                          .where(
                            (element) =>
                                (element.specialist == widget.dignoseName &&
                                    element.fullName!
                                        .toLowerCase()
                                        .contains(value!)),
                          )
                          .toList();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: DoctorListWidget(
                    dignoseName: widget.dignoseName!, shownList: shownList),
              ),
            ],
          )),
    );
  }
}
