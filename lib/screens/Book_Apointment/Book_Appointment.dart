import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_appointment.dart';

class BookAppointmentscreen extends StatelessWidget {
  BookAppointmentscreen({Key? key}) : super(key: key);

  // List days = [
  //   "Sat",
  //   "Sun",
  //   "Mon",
  //   "Tuse",
  //   "wens",
  //   "Thar",
  //   "Fri",
  // ];

  // List time = [
  //   12,
  //   13,
  //   14,
  //   15,
  //   16,
  //   17,
  //   18,
  // ];

  List Times = [
    "2 : 2.30",
    "2.30 : 3",
    "3.30 : 4",
    "4.30 : 5",
    "5.30 : 6",
    "6.30 : 7",
    "7.30 : 8",
    "8.30 : 9",
    "9.30 : 10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Appointments",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                            "doctor",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("4.9  [3821 reviews]"),
                            ],
                          ),
                          const Text(
                            "Cardio Specialist - hospital",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Doctor"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A doctor is someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health. A doctor is tasked with interacting with patients,",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Working Time",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Mon-Fri 9:00 - 20:00"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    child: Text(
                      "See Reviews",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Make Appointment",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: days.length,
                  //       itemBuilder: (context, index) => Row(
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   CustomRowAppointment(
                  //                     day: days[index],
                  //                     dayNumber: time[index],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //  )),
                  // ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SizedBox(
                                width: 500,
                                height: 400,
                                child: ListView.builder(
                                  itemCount: Times.length,
                                  itemBuilder: (context, index) => ListTile(
                                    title: Text(' ${Times[index]}'),
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  child: Text("Ok"),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  child: Text("cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          CustomRowAppointment(
                            day: "Mon",
                            dayNumber: 12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomRowAppointment(
                            day: "Tue",
                            dayNumber: 13,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomRowAppointment(
                            day: "Wen",
                            dayNumber: 14,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomRowAppointment(
                            day: "Thr",
                            dayNumber: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomRowAppointment(
                            day: "Fri",
                            dayNumber: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Book Appintment",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
