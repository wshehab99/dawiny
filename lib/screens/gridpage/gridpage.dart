import 'package:find_doctor/screens/gridpage/app_drawer.dart';
import 'package:find_doctor/screens/gridpage/widgets/headline.dart';
import 'package:find_doctor/screens/gridpage/widgets/page_card.dart';
import 'package:find_doctor/screens/nursing_task/nursing_tasks_screen.dart';
import 'package:find_doctor/screens/symptoms_screen/symptoms_screen.dart';

import 'package:find_doctor/screens/videocallscreen/video_call_screen.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:find_doctor/screens/Video_call_now/VideoCallNow.dart';
import '../../shared/diagnosesList.dart';
import '../../shared/getLocation.dart';
import '../appointments/listOfAppointment.dart';
import '../clinick_booking/clinic_booking.dart';
import '../doctor_home_visit/bookDoctorHomeVisit.dart';
import '../doctor_time/doctor_time_screen.dart';
import '../videocalldetails/videoCall.dart';

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
                  image: AssetImage('assets/images/dawiny_logo.png'),
                  width: 96,
                ),
              ),
              const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/photo.jpg")),
            ],
          ),
        ),
        Expanded(
            child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const HeadLine(),
            SizedBox(height: 24.0),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              // mainAxisSpacing: 15,
              // crossAxisSpacing: 10,
              // padding: const EdgeInsets.all(10),
              // crossAxisCount: 2,
              children: List<Widget>.generate(6, (index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClinicBooking(),
                        ),
                      );

                      // builder:
                      // (context) => const DiagnosesList();
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookDoctorHomeVisit(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoCallNow(),
                        ),
                      );
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
                      print('لسا');
                    }
                  },
                  child: PageCard(
                    textDirection: (index % 2 == 0)
                        ? TextDirection.ltr
                        : TextDirection.rtl,
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
