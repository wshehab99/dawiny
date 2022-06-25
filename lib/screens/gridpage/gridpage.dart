import 'package:find_doctor/screens/symptoms_screen/symptoms_screen.dart';

import 'package:find_doctor/screens/videocallscreen/video_call_screen.dart';
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
      drawer: Drawer(
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Morsy HashisH",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              accountEmail: Text("morsyhashish123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/photo.jpg")),
              otherAccountsPictures: [
                CircleAvatar(
                    backgroundImage: AssetImage("assets/images/photo.jpg")),
              ],
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
            ListTile(
              title: Text("Setting"),
              leading: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 25,
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Image(
                        image: AssetImage('assets/images/Dawiny logo - 2.png'),
                        width: 170,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15, offset: Offset(0, 5), color: Colors.black54)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            children: List<Widget>.generate(6, (index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(

                            builder: (context) => const ClinicBooking()));


                    builder:
                    (context) => const DiagnosesList();
                  } else if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookDoctorHomeVisit()));
                  } else if (index == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(

                            builder: (context) => VideoCallNow()));

                  } else if (index == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetLocation(
                                  title: ' ',
                                )));
                  } else if (index == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SymptomsScreen()));
                  } else {
                    print('لسا');
                  }
                },
                child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.blue[200],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            gridNames[index]['image']!,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            gridNames[index]['text']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )),
              );
            }),
          ),
        )
      ]),
    );
  }
}
