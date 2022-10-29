import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/Screens/appbar_Scareen.dart';

import '../Controllers/meditaton_sound_screen_controller.dart';
import '../Utils/app_colors.dart';

class MaditationSoundScreen extends StatefulWidget {
  String soundsTitle = Get.arguments[0];


  @override
  State<MaditationSoundScreen> createState() => _MaditationSoundScreenState();
}

class _MaditationSoundScreenState extends State<MaditationSoundScreen> {
  MeditationSoundScreenController meditationSoundScreenController = Get.put(MeditationSoundScreenController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    meditationSoundScreenController.player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double appbar = kToolbarHeight;
    double bodyheight = hight-statusbar - appbar;


    return Scaffold(
      backgroundColor: AppColor.themeColor,

      appBar: MyAppBar("Meditation"),
      body: GetBuilder(
        init: MeditationSoundScreenController(),
        builder: (MeditationSoundScreenController controller) {
          return Padding(
            padding:  EdgeInsets.only(top: bodyheight * .04,left: width * .04 ,right: width * .04),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                      "Meditation",
                    style: GoogleFonts.alegreya(
                      color: Colors.white,
                      fontSize: bodyheight * .05
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    "Guided by a short introductory course,",
                    style: GoogleFonts.alegreyaSans(
                      color: Colors.grey,
                      fontSize: bodyheight*.025
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    "start trying meditation.",
                    style: GoogleFonts.alegreyaSans(
                        color: Colors.grey,
                        fontSize: bodyheight*.025

                    ),
                  ),
                ),
                SizedBox(
                  height: bodyheight * .07,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only( right:  width * .05,left: width * .05),
                    child: Image.asset(
                      "assets/meditating.png"
                    ),
                  ),
                ),

                SizedBox(
                  height: bodyheight * .05,
                ),

                Text(
                  widget.soundsTitle,
                  style: GoogleFonts.alegreyaSans(
                      color:  Colors.white,
                      fontSize: bodyheight * .03
                  ),
                ),

                SizedBox(
                  height: bodyheight * .01,
                ),
                Text(
                  controller.timetoshow.toStringAsFixed(2),
                  style: GoogleFonts.alegreyaSans(
                    color:  Colors.white,
                    fontSize: bodyheight * .05
                  ),
                ),

                  SizedBox(height:  bodyheight * .03,),
                  CupertinoButton(
                    color: Color(0xff7c9a92),
                    child: !controller.isplaying ?Text(
                      "Play",
                    style: GoogleFonts.alegreyaSans(
                      color: Colors.white,
                      fontSize: bodyheight * .035
                    ),
                  ):
                    Text(
                      "Pause",
                      style: GoogleFonts.alegreyaSans(
                          color: Colors.white,
                          fontSize: bodyheight * .035
                      ),
                    )
                    ,
                    onPressed: () {
                      controller.playpauseonTap();
                    }
                  ,)


              ],
            ),
          );
        }
      ),
    );
  }


}
