import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/glass.dart';
import 'package:flutter/material.dart';

class DiagnosCard extends StatelessWidget {
  const DiagnosCard(
      {Key? key,
      required this.resKey,
      required this.resValue,
      required this.onPressed})
      : super(key: key);
  final String resKey;
  final String resValue;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(32.0),
        height: 600,
        alignment: Alignment.center,
        child: GlassMorphism(
          borderRadius: BorderRadius.circular(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Diagnos',
                  style: TextStyle(
                      color: kAppWhiteColor,
                      fontFamily: kNexaFont,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/chat_bot.png',
                      width: 150,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "You may have a/an $resKey!",
                      style: TextStyle(
                        color: kAppWhiteColor,
                        // fontFamily: kNexaFont,
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Note: this is not alternative of doctor visit plese try to visit a $resValue doctor.",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(200, 40)),
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(kAppGreenColor.shade300)),
                    onPressed: onPressed,
                    child: const Text(
                      "back",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    // AlertDialog(
    //   backgroundColor: Colors.red,
    //   clipBehavior: Clip.hardEdge,
    //   title: const Text('Diagnos'),
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text(
    //         "You may have a/an $resKey!",
    //         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Text(
    //           "this is not alternative of doctor visit plese try to visit a $resValue doctor")
    //     ],
    //   ),
    //   actions: [
    //     ElevatedButton(onPressed: onPressed, child: const Text("back"))
    //   ],
    // );
  }
}
