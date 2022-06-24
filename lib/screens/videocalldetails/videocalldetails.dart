import 'package:find_doctor/screens/Video_call_now/VideoCallNow.dart';
import 'package:flutter/material.dart';

class VideoCallDetails extends StatelessWidget {
  VideoCallDetails({
    Key? key,
  }) : super(key: key);

  //String? doctorName;
  //String? imageDoctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Appointments",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/doctorW.jpg",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mousa",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(
                          "VideoCall",
                          style: TextStyle(fontSize: 15),
                        ),
                        const Text(
                          "10:30 - 11:00 Pm",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        size: 40,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.people_alt,
                        color: Colors.blue,
                      ),
                      Text(
                        "5000+",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "patients",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      Text(
                        "15+",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "years experience",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.reviews,
                        color: Colors.blue,
                      ),
                      Text(
                        "3800+",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "reviews",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoCallNow(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Video Call Now",
                  style: TextStyle(fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
