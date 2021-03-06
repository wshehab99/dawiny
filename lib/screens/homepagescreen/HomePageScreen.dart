import 'package:flutter/material.dart';

import '../../shared/titledoctor.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_rounded,
                color: Colors.blue,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.blue,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                color: Colors.blue,
              ),
              label: ''),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.archive,
          color: Colors.blue,
        ),
        title: const Text(
          'TeriaQ',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.blue,
          ),
          SizedBox(
            width: 8,
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF5F6F9),
                hintText: 'Search',
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          TitleDoctor(name: 'Specialist Doctor'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BodyDoctor(
                  name: 'Cardio Specialist',
                  numberName: '252 Doctor',
                  color: (0xffFF5B79),
                ),
                BodyDoctor(
                  name: 'Dental Specialist',
                  numberName: '186 Doctor',
                  color: 0xff4B89FF,
                ),
                BodyDoctor(
                  name: 'Eyeee Specialist',
                  numberName: '201 Doctor',
                  color: 0xffFFCE4D,
                ),
              ],
            ),
          ),
          TitleDoctor(name: 'Top Doctor'),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       BodyImage(),
          //       BodyImage(),
          //       BodyImage(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
