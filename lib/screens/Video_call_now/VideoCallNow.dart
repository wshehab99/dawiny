import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

/// Define App ID and Token
const APP_ID = 'ba637d2e6da746b589561478efc3c78b';
const Token =
    '00676eefd968d5f4657986b88757c366e84IACHlT8Xi6tYmouZFIyz9351SK7lET/Bo3mDDPnQ2B48Rgx+f9gAAAAAEABGROOepAK4YgEAAQCjArhi';

class VideoCallNow extends StatefulWidget {
  const VideoCallNow({Key? key}) : super(key: key);

  @override
  State<VideoCallNow> createState() => _VideoCallNowState();
}

class _VideoCallNowState extends State<VideoCallNow> {
  bool _joined = false;
  int _remoteUid = 0;
  bool _switch = false;
  RtcEngineContext? cntxt;
  RtcEngine? engine;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    close();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> initPlatformState() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        await [Permission.microphone, Permission.camera].request();
      }
      cntxt = RtcEngineContext(APP_ID);
      engine = await RtcEngine.createWithContext(cntxt!);
      engine!.setEventHandler(RtcEngineEventHandler(
          joinChannelSuccess: (String channel, int uid, int elapsed) {
        print('joinChannelSuccess $channel $uid');
        setState(() {
          _joined = true;
        });
      }, userJoined: (int uid, int elapsed) {
        print('userJoined $uid');
        setState(() {
          _remoteUid = uid;
        });
      }, userOffline: (int uid, UserOfflineReason reason) {
        print('userOffline $uid');
        setState(() {
          _remoteUid = 0;
        });
      }));
      await engine!.enableVideo();

      await engine!.joinChannel(Token, 'test', null, 0);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> close() async {
    // await engine!.destroy();
    await engine!.leaveChannel();
  }

  Future<void> enableAudio() async {
    // await engine!.destroy();
    await engine!.enableAudio();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: _switch ? _renderLocalPreview() : _renderRemoteVideo(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 150,
            height: 150,
            color: Colors.blue,
            child: InkWell(
              onTap: () {
                setState(() {
                  _switch = !_switch;
                  log('$_switch');
                });
              },
              child: _switch ? _renderRemoteVideo() : _renderLocalPreview(),
            ),
          ),
        ),
        Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 500),
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Colors.transparent, Color.fromARGB(255, 181, 172, 89)],
              )),
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
                          )))),
                  const SizedBox(
                    width: 20,
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
                    width: 20,
                  ),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      child: SvgPicture.asset(
                        "assets/images/audio.svg",
                        height: 28,
                        color: Colors.white,
                      ),
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
        ]),
      ]),
    );
  }

  Widget _renderLocalPreview() {
    if (_joined && defaultTargetPlatform == TargetPlatform.android ||
        _joined && defaultTargetPlatform == TargetPlatform.iOS) {
      return const RtcLocalView.SurfaceView();
    }

    if (_joined && defaultTargetPlatform == TargetPlatform.windows ||
        _joined && defaultTargetPlatform == TargetPlatform.macOS) {
      return const RtcLocalView.TextureView();
    } else {
      return const Text(
        'Please join channel first',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != 0 && defaultTargetPlatform == TargetPlatform.android ||
        _remoteUid != 0 && defaultTargetPlatform == TargetPlatform.iOS) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid,
        channelId: "test",
      );
    }

    if (_remoteUid != 0 && defaultTargetPlatform == TargetPlatform.windows ||
        _remoteUid != 0 && defaultTargetPlatform == TargetPlatform.macOS) {
      return RtcRemoteView.TextureView(
        uid: _remoteUid,
        channelId: "test",
      );
    } else {
      return Image.asset(
        "assets/images/doctorw2.png",
        fit: BoxFit.cover,
      );
    }
  }
}
