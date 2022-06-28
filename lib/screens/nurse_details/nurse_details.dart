// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class NurseDetals extends StatelessWidget {
//   NurseDetals({Key? key, required this.name}) : super(key: key);
//   String? name;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: NurseCardDatails()),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class NurseDetails extends StatelessWidget {
  NurseDetails({Key? key, this.name}) : super(key: key);
  String? name;
  final number = "01144287526";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SafeArea(
          child: Container(
            height: 600,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/doctorW.jpg",
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Dr : Eman Ali",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 4.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        size: 10,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "4.8 (by 1500 Reviews)",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: SvgPicture.asset(
                        "assets/icons/call.svg",
                        height: 20,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(number);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "$number",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Drscription Of Nurse:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Nurses plan and provide medical and nursing care to patients in hospitals, at home, or in other settings who are suffering from chronic or acute physical or mental ill-health.",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
