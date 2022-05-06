import 'package:find_doctor/fake_data/fake_data.dart';
import 'package:find_doctor/screens/doctors/doctor_list_screen.dart';
import 'package:find_doctor/shared/diagnosesList.dart';
import 'package:flutter/material.dart';

class ClinicBooking extends StatefulWidget {
  ClinicBooking({Key? key}) : super(key: key);

  @override
  State<ClinicBooking> createState() => _ClinicBookingState();
}

class _ClinicBookingState extends State<ClinicBooking> {
  SpecializationData? sp;

  Future<void> getSp() async {
    sp = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DiagnosesList()),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => DoctorListScreen(dignoseName: sp!.name)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => getSp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
