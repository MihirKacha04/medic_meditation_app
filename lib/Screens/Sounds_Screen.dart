import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/AppRoutes/app_routes.dart';
import 'package:medic_meditation_app/Models/sounds_model.dart';
import '../Utils/app_colors.dart';
import 'appbar_Scareen.dart';


class SoundsScreen extends StatefulWidget {
  int count = Get.arguments[0];
  Welcome welcome = Get.arguments[1];
  SoundsScreen({Key? key}) : super(key: key);

  @override
  State<SoundsScreen> createState() => _SoundsScreenState();
}

class _SoundsScreenState extends State<SoundsScreen> {
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double appbar = kToolbarHeight;
    double bodyheight = hight - statusbar - appbar;
    return Scaffold(
      backgroundColor: AppColor.themeColor,


      appBar: MyAppBar("${widget.welcome.mods![widget.count].title}"),

      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .04, bodyheight * .04, width * .04, bodyheight * .02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(bodyheight * .03),
              child: Container(
                height: bodyheight * .33,
                width: width,
                decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("${widget.welcome.mods![widget.count].mainimage}"),
                    fit: BoxFit.fill)
                ),

                child: Padding(
                  padding: EdgeInsets.only(
                      top: bodyheight * .07, left: width * .09),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.welcome.mods![widget.count].title}",
                        style: GoogleFonts.alegreya(
                            color: Colors.white,
                            fontSize: width * .07,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 8.0,
                                  color: Colors.black.withOpacity(.3)
                              )
                            ]
                        ),

                      ),
                      Text("${widget.welcome.mods![widget.count].poet}",
                        style: GoogleFonts.alegreya(
                            color: Colors.white,
                            fontSize: width * .04,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 8.0,
                                  color: Colors.black
                              )
                            ]
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: bodyheight * .04, left: width * .08, right: width * .08),
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
                        onTap:() => Get.toNamed(AppRoutes.audioPlayerScreen,arguments: [
                          "${widget.welcome.mods![widget.count].title}",
                          "${widget.welcome.mods![widget.count].soundsimage![itemindex]}",
                          "${widget.welcome.mods![widget.count].soundsname![itemindex]}",
                          "${widget.welcome.mods![widget.count].soundspath![itemindex]}",
                        ]),


                        child: Row(
                          children: [
                            Container(
                              height: bodyheight * .1,
                              width: bodyheight * .1,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    bodyheight * .031),

                                child: Image.asset("${widget.welcome.mods![widget.count].soundsimage![itemindex]}",
                                  fit: BoxFit.fill,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * .05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.welcome.mods![widget.count].soundsname![itemindex]}",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.alegreyaSans(
                                        color: Colors.white,
                                        fontSize: width * .05
                                    ),
                                  ),
                                  Text("${widget.welcome.mods![widget.count].listening![itemindex]}",
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


    );
  }
}




//
// class SoundsScreen extends StatelessWidget {
//   int count;
//   Welcome welcome;
//
//   SoundsScreen(this.count, this.welcome);
//
//
//   @override
//   Widget build(BuildContext context) {
//     double hight = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     double statusbar = MediaQuery.of(context).padding.top;
//     double navigationbar = MediaQuery.of(context).padding.bottom;
//     double appbar = kToolbarHeight;
//     double bodyheight = hight - statusbar - appbar;
//     return Scaffold(
//       backgroundColor: Color(0xff253334),
//
//
//       appBar: MyAppBar("${welcome.mods![count].title}"),
//
//       body: Column(
//         children: [
//
//           Padding(
//             padding: EdgeInsets.fromLTRB(
//                 width * .04, bodyheight * .04, width * .04, bodyheight * .02),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(bodyheight * .03),
//               child: Container(
//                 height: bodyheight * .33,
//                 width: width,
//                 decoration: BoxDecoration(image: DecorationImage(
//                     image: AssetImage("${welcome.mods![count].mainimage}"),
//                     fit: BoxFit.fill)
//                 ),
//
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: bodyheight * .07, left: width * .09),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("${welcome.mods![count].title}",
//                         style: GoogleFonts.alegreya(
//                             color: Colors.white,
//                             fontSize: width * .07,
//                             shadows: <Shadow>[
//                               Shadow(
//                                   offset: Offset(0.0, 0.0),
//                                   blurRadius: 8.0,
//                                   color: Colors.black.withOpacity(.3)
//                               )
//                             ]
//                         ),
//
//                       ),
//                       Text("${welcome.mods![count].poet}",
//                         style: GoogleFonts.alegreya(
//                             color: Colors.white,
//                             fontSize: width * .04,
//                             shadows: <Shadow>[
//                               Shadow(
//                                   offset: Offset(0.0, 0.0),
//                                   blurRadius: 8.0,
//                                   color: Colors.black
//                               )
//                             ]
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           Padding(
//             padding: EdgeInsets.only(
//                 top: bodyheight * .04, left: width * .08, right: width * .08),
//             child: Container(
//               // color: Colors.white,
//
//               child: ListView.builder(
//                 itemCount: 4,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, itemindex) {
//                   return
//
//                     Padding(
//                       padding: EdgeInsets.only(bottom: bodyheight * .03),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(
//                             builder: (context) {
//                               return SoundScreen("${welcome.mods![count].title}",
//                                   "${welcome.mods![count].soundsimage![itemindex]}",
//                                   "${welcome.mods![count].soundsname![itemindex]}"
//
//                               );
//                             },));
//                         },
//                         child: Row(
//                           children: [
//                             Container(
//                               height: bodyheight * .1,
//                               width: bodyheight * .1,
//
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(
//                                     bodyheight * .031),
//
//                                 child: Image.asset("${welcome.mods![count]
//                                     .soundsimage![itemindex]}",
//                                   fit: BoxFit.fill,),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: width * .05),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("${welcome.mods![count]
//                                       .soundsname![itemindex]}",
//                                     overflow: TextOverflow.clip,
//                                     style: GoogleFonts.alegreyaSans(
//                                         color: Colors.white,
//                                         fontSize: width * .05
//                                     ),
//                                   ),
//                                   Text("${welcome.mods![count]
//                                       .listening![itemindex]}",
//                                     style: GoogleFonts.alegreyaSans(
//                                         color: Colors.white.withOpacity(0.6),
//                                         fontSize: width * .03
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Spacer(),
//                             Center(
//                               child: Text("45Min",
//                                 style: GoogleFonts.alegreyaSans(
//                                     color: Colors.white.withOpacity(0.8),
//                                     fontSize: width * .04
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                 },),
//             ),
//           ),
//
//
//         ],
//       ),
//
//
//     );
//   }
//
// }
