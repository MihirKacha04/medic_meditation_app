import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/Screens/appbar_Scareen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../AppRoutes/app_routes.dart';
import '../Utils/app_colors.dart';

class MeditationScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double appbar = kToolbarHeight;
    double bodyheight = hight - statusbar - appbar;
    return Scaffold(
      backgroundColor: AppColor.themeColor,
      appBar: MyAppBar("Meditation 101"),
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(width * .04, bodyheight * .04, width * .04, bodyheight * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: bodyheight * .25,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(bodyheight * .048),
                      color: Color(0xfff7f3f0)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          left: width * .05,
                          top: bodyheight * .06,
                          child: Container(
                            height: bodyheight * .25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Meditation 101",
                                  style: GoogleFonts.alegreya(
                                      color: Color(0xff253334),
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * .05
                                  ),
                                ),

                                Text("Learn Metditation",
                                  style: GoogleFonts.alegreyaSans(
                                      color: Color(0xff253334),
                                      fontSize: width * .04
                                  ),
                                ),

                                Padding(

                                  padding: EdgeInsets.only(
                                      top: bodyheight * .014),
                                  child: InkWell(
                                    onTap: () {

                                      AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.NO_HEADER,
                                          animType: AnimType.bottomSlide,
                                          body: Padding(
                                            padding:  EdgeInsets.only(left: width * .03,right: width * .03,bottom:  bodyheight * .02),
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    highlightColor: AppColor.transparent,
                                                    splashColor: AppColor.transparent,
                                                    onTap: () {
                                                     _luanchUrl("https://www.youtube.com/watch?v=U9YKY7fdwyg&ab_channel=Goodful");
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                      Text("Technique of meditation",
                                                      style: GoogleFonts.alegreyaSans(
                                                        color: Color(0xff253334),
                                                        fontSize: width * .05
                                                      ),
                                                      ),
                                                        Spacer(),
                                                        Icon(Icons.slow_motion_video,color: Color(0xff253334),)
                                                    ],),
                                                  ),
                                                  Divider(color: Color(0xff253334),thickness: 2),
                                                  InkWell(
                                                    highlightColor: AppColor.transparent,
                                                    splashColor: AppColor.transparent,
                                                    onTap: () {
                                                      print("object");
                                                    _luanchUrl("https://positivepsychology.com/benefits-of-meditation/");
                                                  },
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text("Benefits of meditation",
                                                          style: GoogleFonts.alegreyaSans(
                                                              color: Color(0xff253334),
                                                              fontSize: width * .05
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Icon(Icons.menu_book,color: Color(0xff253334),)
                                                      ],),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                          
                                      ).show();
                                    },
                                    child: Container(
                                      height: bodyheight * .06,
                                      width: width * .33,
                                      decoration: BoxDecoration(
                                          color: Color(0xff253334),
                                          borderRadius: BorderRadius.circular(
                                              width * .03)
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Watch Now",
                                                style: GoogleFonts.alegreyaSans(
                                                    color: Colors.white,
                                                    fontSize: width * .04
                                                ), textAlign: TextAlign.center),
                                            SizedBox(width: width * .02,),
                                            Icon(Icons.slow_motion_video_sharp,color: Colors.white,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                      Positioned(
                          right: 0,

                          child: Container(
                            height: bodyheight * .25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/FullScreens/posterImage.png",
                                  width: width / 2,),
                              ],
                            ),
                          )
                      )
                    ],
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(top: bodyheight * .07),
                  child: Container(
                    // color: Colors.white,

                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, itemindex) {
                        return

                          Padding(
                            padding: EdgeInsets.only(bottom: bodyheight * .03),
                            child: InkWell(
                              highlightColor: AppColor.transparent,
                              splashColor: AppColor.transparent,
                              onTap: () =>  Get.toNamed(AppRoutes.meditationSoundScreen, arguments: [itemindex,soundsTitle[itemindex]]),
                              child: Row(
                                children: [
                                  Container(
                                    height: bodyheight * .1,
                                    width: bodyheight * .1,

                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          bodyheight * .031),

                                      child: Image.asset(Images[itemindex],
                                        fit: BoxFit.fill,),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: width * .05),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(soundsTitle[itemindex],
                                          overflow: TextOverflow.clip,
                                          style: GoogleFonts.alegreyaSans(
                                              color: Colors.white,
                                              fontSize: width * .05
                                          ),
                                        ),
                                        Text(Listing[itemindex],
                                          style: GoogleFonts.alegreyaSans(
                                              color: Colors.white.withOpacity(0.6),
                                              fontSize: width * .03
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Center(
                                    child: Text("45Min",
                                      style: GoogleFonts.alegreyaSans(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: width * .04
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                      },),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }

 _luanchUrl(String url) async {
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
  }


  List Listing = [
    "23422 Listenig",
    "33345 Listenig",
    "12323 Listenig",
    "56768 Listenig",
  ];

  List Images = [
    "assets/Meditation/meditation1.jpeg",
    "assets/Meditation/meditation2.jpeg",
    "assets/Meditation/meditation3.jpeg",
    "assets/Meditation/meditation4.jpeg",
  ];

  List soundsTitle = [
    "For Positive Energy",
    "Meditation Music",
    "Awareness Meditation",
    "Singing bowl sound",
  ];


}
