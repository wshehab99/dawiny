import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final List<Map<String, dynamic>> _notifications = [
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.alarm,
      "date": "11/3/2022",
      "color": Colors.red
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.done,
      "date": "11/3/2022",
      "color": Colors.blue
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.done,
      "date": "11/3/2022",
      "color": Colors.blue
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.alarm,
      "date": "11/3/2022",
      "color": Colors.red
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.done,
      "date": "11/3/2022",
      "color": Colors.blue
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.notifications_outlined,
      "date": "11/3/2022",
      "color": Colors.amber
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.notifications_outlined,
      "date": "11/3/2022",
      "color": Colors.amber
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.done,
      "date": "11/3/2022",
      "color": Colors.blue
    },
    {
      "title": "Appointment Alarm",
      "desc":
          """Your appointment will be starts after 15 minutes stay with app take care""",
      'icon': Icons.alarm,
      "date": "11/3/2022",
      "color": Colors.red
    },
  ];

  Notifications({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: _notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Text(_notifications[index]["title"]),
                    leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: _notifications[index]["color"],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            _notifications[index]["icon"],
                            color: Colors.white,
                          ),
                        )),
                    subtitle: Text(_notifications[index]["desc"]),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 37),
                      child: Text(
                        _notifications[index]["date"],
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    isThreeLine: true,
                    // style: ListTileStyle(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
