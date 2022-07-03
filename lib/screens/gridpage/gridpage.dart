import 'package:find_doctor/screens/gridpage/app_drawer.dart';
import 'package:find_doctor/screens/gridpage/widgets/headline.dart';
import 'package:find_doctor/screens/gridpage/widgets/page_card.dart';
import 'package:find_doctor/screens/nursing_task/nursing_tasks_screen.dart';
import 'package:find_doctor/screens/pharmacy_map/pharmacy_map.dart';
import 'package:find_doctor/screens/symptoms_screen/symptoms_screen.dart';

import 'package:find_doctor/screens/videocallscreen/video_call_screen.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:flutter/material.dart';
import '../../shared/diagnosesList.dart';
import '../doctor_home_visit/bookDoctorHomeVisit.dart';

class GridPage extends StatelessWidget {
  GridPage({Key? key}) : super(key: key);

  final List<Map<String, String>> gridNames = [
    {
      'text': "Clinics Booking",
      'image': "assets/images/appointment.png",
    },
    {'text': "Home Visit", 'image': 'assets/images/doctorVisit.png'},
    {'text': 'Video Call', 'image': 'assets/images/online_doctor.png'},
    {
      'text': 'Nursing Service',
      'image': "assets/images/nursing_home.png",
    },
    {
      'text': 'Medical Diagnosis',
      'image': "assets/images/chat_bot.png", //need image
    },
    {
      'text': 'Nearest Pharmacy',
      'image': "assets/images/pharmacy.png",
    },
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
          // color: kAppGreenColor.withOpacity(0.2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: kAppGreyColor,
                  size: 25,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Image(
                  image: AssetImage('assets/images/dawinyLogoG.png'),
                  width: 96,
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
        Expanded(
            child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const HeadLine(),
            const SizedBox(height: 24.0),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List<Widget>.generate(6, (index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DiagnosesList(),
                        ),
                      );

                      (context) => const DiagnosesList();
                    } else if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BookDoctorHomeVisit()));
                    } else if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VideoCallScreen()));
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NursingTasksScreen(),
                        ),
                      );
                    } else if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SymptomsScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PharmacyMap()));
                    }
                  },
                  child: PageCard(
                    imgPath: gridNames[index]['image']!,
                    text: gridNames[index]['text']!,
                  ),
                );
              }),
            )
          ],
        )),
      ]),
    );
  }
}
