import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/Controllers/player_controller.dart';

import 'appbar_Scareen.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  player_controller playercontrolller = Get.put(player_controller());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playercontrolller.player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double navigationbar = MediaQuery.of(context).padding.bottom;
    double appbar = kToolbarHeight;
    double bodyheight = hight - statusbar - appbar;
    return GetBuilder(
        init: player_controller(),
        builder: (player_controller controller) {
          return Scaffold(
              backgroundColor: Color(0xff253334),
              appBar: MyAppBar(controller.appbartitle!),
              body: Padding(
                padding: EdgeInsets.only(top: bodyheight * .04, left: width * .04, right: width * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: CircleAvatar(
                      radius: bodyheight * .2,
                      backgroundImage: AssetImage(controller.soundsimage!),
                    )),
                    Padding(
                      padding: EdgeInsets.only(top: bodyheight * .05),
                      child: Text(
                        controller.soundsname!,
                        style: GoogleFonts.alegreyaSans(color: Colors.white, fontWeight: FontWeight.w600, fontSize: width * .08),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.013),
                    ProgressBar(
                      thumbGlowColor: Colors.white38,
                      progress: controller.player.position,
                      total: controller.player.duration ?? Duration(seconds: 0),
                      baseBarColor: Colors.white24,
                      progressBarColor: Colors.white,
                      thumbColor: Colors.white,
                      onDragUpdate: (details) {
                        controller.player.seek(details.timeStamp);
                        controller.update();
                      },
                      onSeek: (value) {
                        print(value);
                        controller.player.seek(value);
                        controller.update();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          child: ImageIcon(AssetImage('assets/ic_replay10sec.png'), size: Get.textScaleFactor * 30, color: Colors.white),
                          onPressed: () {
                            controller.player.seek(Duration(seconds: controller.player.position.inSeconds - 10));
                          },
                        ),
                        CupertinoButton(
                          child: controller.isplaying
                              ? Icon(CupertinoIcons.pause_circle_fill, color: Colors.white, size: bodyheight * .1)
                              : Icon(
                                  CupertinoIcons.play_circle_fill,
                                  color: Colors.white,
                                  size: bodyheight * .1,
                                ),
                          onPressed: () {
                            controller.playpauseonTap();
                          },
                        ),
                        CupertinoButton(
                          child: ImageIcon(
                            AssetImage('assets/ic_skip10sec.png'),
                            size: Get.textScaleFactor * 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.player.seek(Duration(seconds: controller.player.position.inSeconds + 10));
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: CupertinoButton(
                        child: Icon(
                          Icons.loop,
                          color: Colors.white,
                          size: bodyheight * .05,
                        ),
                        onPressed: () {
                          controller.player.seek(Duration(seconds: 0));
                        },
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
