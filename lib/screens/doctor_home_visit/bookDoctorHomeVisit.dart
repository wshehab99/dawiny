import 'package:find_doctor/shared/custom_appbar.dart';
import 'package:find_doctor/shared/getLocation.dart';
import 'package:flutter/material.dart';

import '../../fake_data/fake_data.dart';
import '../doctorMap/doctorMap.dart';
import 'diagnosesListDoctorHome.dart';

class BookDoctorHomeVisit extends StatefulWidget {
  const BookDoctorHomeVisit({Key? key}) : super(key: key);

  @override
  State<BookDoctorHomeVisit> createState() => _BookDoctorHomeVisitState();
}

class _BookDoctorHomeVisitState extends State<BookDoctorHomeVisit> {
  SpecializationData? sp;

  String? locationAddress = ' ';
  @override
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: CustomAppbar(context, titleText: "Book a Home Visit Doctor"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              child: Column(children: [
                const SizedBox(
                  height: 15,
                ),
                Image(
                  image: const AssetImage("assets/images/dawinyLogoW.png"),
                  height: height * .1,
                  width: width * .50,
                ),
                const SizedBox(
                  height: 5,
                ),
                Image(
                  image: const AssetImage("assets/images/doctorhomevisit.png"),
                  height: height * .15,
                  width: width * .5,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Book a home visit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height * .033,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Now with Dawiny, you can book a home visit with a specialized doctor",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height * .023,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.arrow_circle_down_outlined,
                  size: height * .04,
                  color: Colors.blueGrey,
                ),
              ]),
              height: height * .5,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.6),
                    Colors.green.withOpacity(.6),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(60),
                ),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 15, offset: Offset(0, 5), color: Colors.white)
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * .015,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: height * .35,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.withOpacity(.3),
                    Colors.grey.withOpacity(.3),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                ),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 15, offset: Offset(0, 5), color: Colors.white)
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.withOpacity(.5)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        onPressed: () async {
                          sp = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DiagnosesListDoctorHome()),
                          );

                          setState(() {});
                        },
                        child: const Text("Chooes Diagnos")),
                  ),
                  sp == null
                      ? const Text('')
                      : SizedBox(
                          width: 300,
                          height: 50,
                          child: Row(
                            children: [
                              Image(image: AssetImage('${sp?.imagePath}')),
                              Text("${sp?.name}")
                            ],
                          )),
                  // SizedBox(
                  //   height: 55,
                  // ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.green.withOpacity(.5)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () async {
                        locationAddress = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetLocation(
                                    title: "My Location",
                                  )),
                        );
                        setState(() {});
                      },
                      child: const Text('Chooes Location')),

                  Text(locationAddress!),

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.green.withOpacity(.5)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DoctorMap()));

                        setState(() {});
                      },
                      child: const Text('Find Doctor')),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
