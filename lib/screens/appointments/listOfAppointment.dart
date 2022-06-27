import 'package:find_doctor/screens/appointments/appointment_card.dart';
import 'package:flutter/material.dart';

import '../../shared/custom_appbar.dart';

class ListOfAppointments extends StatefulWidget {
  const ListOfAppointments({Key? key}) : super(key: key);

  @override
  State<ListOfAppointments> createState() => _ListOfAppointmentsState();
}

class _ListOfAppointmentsState extends State<ListOfAppointments> {
  List<Map> appointments = [
    {
      'doctorName': 'Mohamed Mousa',
      'patientName': 'Ail ',
      'dateTime': '12/7/2022 ',
      'startAppointment': '10 AM',
      'endAppointment': '10:30 AM'
    },
    {
      'doctorName': 'Morsy Hashish',
      'patientName': 'Ail ',
      'dateTime': '13/7/2022 ',
      'startAppointment': '10 AM',
      'endAppointment': '10:30 AM'
    },
    {
      'doctorName': 'Waleed Bin Shehab',
      'patientName': 'Ail ',
      'dateTime': '15/7/2022 ',
      'startAppointment': '10 AM',
      'endAppointment': '10:30 AM'
    },
    {
      'doctorName': 'Hazem Essam',
      'patientName': 'Ail ',
      'dateTime': '12/7/2022 ',
      'startAppointment': '10 AM',
      'endAppointment': '10:30 AM'
    },
    {
      'doctorName': 'Hazem Mousa',
      'patientName': 'Ail ',
      'dateTime': '12/7/2022 ',
      'startAppointment': '10 AM',
      'endAppointment': '10:30 AM'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, titleText: "My Appointments"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: appointments.length,
              itemBuilder: (BuildContext context, int index) {
                var appointment = appointments[index];
                return AppointmentCard(
                  doctorName: appointment['doctorName'],
                  patientName: appointment['patientName'],
                  dateTime: appointment['dateTime'],
                  startAppointment: appointment['startAppointment'],
                  endAppointment: appointment['endAppointment'],
                  onPressed: () {
                    setState(() {
                      appointments.removeAt(index);
                      print(appointments.length);
                    });
                  },
                );
              },
              // separatorBuilder: (BuildContext context, int index) =>
              //     const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
