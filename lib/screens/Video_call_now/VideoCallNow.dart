import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCallNow extends StatelessWidget {
  const VideoCallNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 1,
            child: Image.asset(
              "assets/images/doctorw2.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      child: const Icon(CupertinoIcons.escape),
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      child: const Icon(CupertinoIcons.fullscreen),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      child: const Icon(CupertinoIcons.camera),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: size.height * 0.8,
          //   child: Container(
          //     height: 100,
          //     decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.center,
          //       colors: [Colors.yellow, Colors.red],
          //     )),
          //   ),
          // ),
        ],
      ),
    );
  }
}
