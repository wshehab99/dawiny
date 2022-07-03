import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class PharmacyDetails extends StatelessWidget {
  PharmacyDetails({Key? key, this.name}) : super(key: key);
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Pharmacy",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Center(
                child: ParmacyCard(
                  image: "assets/images/pharmacy.webp",
                  name: "$name",
                  time: "9 Am : 10 Pm",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ParmacyCard extends StatelessWidget {
  ParmacyCard({Key? key, this.image, this.name, this.time}) : super(key: key);
  String? image;
  final Number = "01032456974";
  String? time;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Row(children: [
          ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "$image",
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$name",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () async {
                      await FlutterPhoneDirectCaller.callNumber(Number);
                    },
                    child: Text(
                      "$Number",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Text(
                "$time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
