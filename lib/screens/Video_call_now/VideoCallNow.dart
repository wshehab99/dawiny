import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class VideoCallNow extends StatelessWidget {
  const VideoCallNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                  Container(
                    height: 55,
                    child: ElevatedButton(
                      child: Icon(CupertinoIcons.escape),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 55,
                    child: ElevatedButton(
                      child: Icon(CupertinoIcons.fullscreen),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 55,
                    child: ElevatedButton(
                      child: Icon(CupertinoIcons.camera),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
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
