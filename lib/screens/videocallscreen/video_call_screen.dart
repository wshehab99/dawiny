import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gproject/diagnose_screen.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Container(
                  height: 120,
                  width: double.infinity,
                  child: Image.asset("assets/images/dawiny_logo.png")),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "مستقبل الرعاية الصحية",
              style: TextStyle(color: Color(0xff0170CC), fontSize: 25),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiagnoseScreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff0170CC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            Text(
                              "احجز مكالمة مع دكتور متخصص",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.phone_missed,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0170CC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Row(
                            children: [
                              Text(
                                "احجز مكالمة كرونا",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.coronavirus_sharp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffD71922),
                      ),
                      child: Center(
                        child: Text(
                          "مجانا",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
