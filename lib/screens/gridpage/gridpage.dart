import 'package:find_doctor/screens/diagnoses.dart/diagnosesList.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: const Text(
      //     'Dawiny',
      //     style: TextStyle(fontSize: 30, color: Colors.blue),
      //   ),
      // ),
      body: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          child: const Center(
            child: Text(
              'Dawiny',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Doctorlist()));
            },
            child: GridView.count(
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List<Widget>.generate(6, (index) {
                return Card(
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
                    ));
              }),
            ),
          ),
        )
      ]),
    );
  }
}
