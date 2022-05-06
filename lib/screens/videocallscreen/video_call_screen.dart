import 'package:find_doctor/screens/diagnoses.dart/diagnosesList.dart';
import 'package:flutter/material.dart';

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
              child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Image.asset("assets/images/dawiny_logo.png")),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "مستقبل الرعاية الصحية",
              style: TextStyle(color: Color(0xff0170CC), fontSize: 25),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DiagnosesList(vidoecall: true),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xff0170CC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Row(
                        children: const [
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
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xff0170CC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Row(
                          children: const [
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
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xffD71922),
                      ),
                      child: const Center(
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
