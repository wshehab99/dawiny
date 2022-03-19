import 'package:find_doctor/screens/diagnoses.dart/diagnosesList.dart';
import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  GridPage({Key? key}) : super(key: key);

  final List<String> names = [
    'Reservation Clinics',
    'Services Request',
    'Video Call',
    'nearst Pharmacy',
    'Medical Diagnosis',
  ];

  // List<String> MyImages = [
  //   "assets/images/video.png",
  //   "assets/images/video.png",
  //   "assets/images/video.png",
  //   "assets/images/video.png",
  //   "assets/images/video.png",
  // ];

  final List imagesGrid = [
    "assets/images/y.jpg",
    "assets/images/video.png",
    "assets/images/y.jpg",
    "assets/images/video.png",
    "assets/images/video.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Teriaq',
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DaignoList()));
        },
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          children: List<Widget>.generate(5, (index) {
            return GridTile(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.blue[300],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imagesGrid[index],
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          names[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              overflow: TextOverflow.clip),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )),
            );
          }),
        ),
      ),
    );
  }
}
