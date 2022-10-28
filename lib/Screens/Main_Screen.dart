import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/Models/sounds_model.dart';
import 'package:medic_meditation_app/Screens/Maditation_Screen.dart';
import 'package:medic_meditation_app/Screens/Sounds_Screen.dart';
import 'package:medic_meditation_app/Screens/appbar_Scareen.dart';

class MainScreen extends StatelessWidget {


  Welcome welcome;

  MainScreen(this.welcome);


  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double statusbar = MediaQuery
        .of(context)
        .padding
        .top;
    double navigationbar = MediaQuery
        .of(context)
        .padding
        .bottom;
    double appbar = kToolbarHeight;
    double bodyheight = hight - statusbar - appbar;
    return Scaffold(
      backgroundColor: Color(0xff253334),


      appBar: MyAppBar("Meditation"),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: width * .07, top: bodyheight * .02),
                child: Text("Welcome back,afreen!",
                  style: GoogleFonts.alegreya(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: width * .07
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: width * .07),
                child: Text("How are you feeling today ?",
                  style: GoogleFonts.alegreya(
                      color: Colors.grey,
                      fontSize: width * .045
                  ),
                ),
              ),


              Container(
                height: bodyheight * .5,
                padding: EdgeInsets.only(left: width * .07,
                    right: width * .07,
                    top: bodyheight * .05),
                child: GridView.builder(
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                SoundsScreen(index, welcome),));
                        },
                          child: Container(
                              height: bodyheight * .15,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      bodyheight * .048),
                                  child: Image.asset(
                                    "${welcome.mods![index].logo}",
                                    fit: BoxFit.fill,))
                          ),
                        ),

                        Padding(

                          padding: EdgeInsets.only(top: bodyheight * .01),
                          child: Text("${welcome.mods![index].title}",
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,

                            ),),
                        )
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * .07, bodyheight * .02, width * .07, 0),

                child: InkWell(
                  onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MeditationScreen()));
                  },
                  child: Container(
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
                                    child: Container(
                                      height: bodyheight * .06,
                                      width: width * .33,
                                      decoration: BoxDecoration(
                                          color: Color(0xff253334),
                                          borderRadius: BorderRadius.circular(
                                              width * .03)
                                      ),
                                      child: Center(
                                        child: Text("Click hear",
                                            style: GoogleFonts.alegreyaSans(
                                                color: Colors.white,
                                                fontSize: width * .04
                                            ), textAlign: TextAlign.center),
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
                ),

              ),


            ],
          ),
        ),
      ),
    );
  }
}