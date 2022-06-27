import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                  color: Colors.blue,
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
                  phoneNumber: "01032456974",
                  time: "9 Am : 10 Pm",
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   child: ParmacyCard(
            //     image: "assets/images/p.png",
            //     name: "صيدلية علي",
            //     phoneNumber: "01065978421",
            //     time: "11 Am : 12 Pm",
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   child: ParmacyCard(
            //     image: "assets/images/p2.png",
            //     name: "صيدلية الشعب",
            //     phoneNumber: "0121547884",
            //     time: "8 Am : 8 Pm",
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   child: ParmacyCard(
            //     image: "assets/images/p5.jpg",
            //     name: "صيدلية الهدي",
            //     phoneNumber: "0123547884",
            //     time: "8 Am : 12 Pm",
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   child: ParmacyCard(
            //     image: "assets/images/p2.png",
            //     name: "صيدلية التقي",
            //     phoneNumber: "0125547884",
            //     time: "10 Am : 10 Pm",
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   child: ParmacyCard(
            //     image: "assets/images/download.png",
            //     name: "صيدلية الحسين",
            //     phoneNumber: "0121597884",
            //     time: "12 pm : 12 Am",
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}

class ParmacyCard extends StatelessWidget {
  ParmacyCard({Key? key, this.image, this.name, this.phoneNumber, this.time})
      : super(key: key);
  String? image;
  String? phoneNumber;
  String? time;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue),
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
                    color: Colors.blue),
              ),
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "$phoneNumber",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
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
