import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medic_meditation_app/Models/sounds_model.dart';
import 'package:medic_meditation_app/Screens/Main_Screen.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decodedjson();
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        play = true;
      });
    });
  }
  bool play = false;
   Welcome? welcome;
  @override
  Widget build(BuildContext context) {

    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double navigationbar = MediaQuery.of(context).padding.bottom;

    double bodyheight = hight-statusbar;


    return Scaffold(

      backgroundColor: Color(0xffacbba9),
      body: SafeArea(

        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/FullScreens/Background.png"),fit: BoxFit.fill)
          ),
          child: Stack(

            children: [


                AnimatedPositioned(
                  curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 1200),
                   height:play ?bodyheight * .5  :bodyheight * .57,
                    left: 0,
                    right: 0,
                    top: play ? bodyheight * .1 : bodyheight * .2,
                    child: Center(
                      child: Container(
                        // color: Colors.white,
                        height: bodyheight * .563,
                          child: Image.asset("assets/Buttons/Logo.png",)),
                    ),

                ),


              ///welcom text
              AnimatedPositioned(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 1500),
                height:play ?bodyheight * .44  :0,
                left: 0,
                right: 0,
                bottom: play ? bodyheight * .22  : bodyheight * .0,
                child: Center(
                  child: Container(
                      height: bodyheight * .12,
                      child: Image.asset("assets/Buttons/Welcome Text.png",)),
                ),

              ),

              ///button
              AnimatedPositioned(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 1500),
                height: play ? bodyheight * .078 : 0,
                left: 0,
                right: 0,
                bottom: play ? bodyheight * .18  : bodyheight * .0,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(width * .08, 0, width * .08, 0),
                    child: InkWell(
                      onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                       return MainScreen(welcome!);
                      },));
                    },
                      child: Container(
                          height: bodyheight * .078,
                         decoration: BoxDecoration(
                           // color: Colors.white,
                           image: DecorationImage(image: AssetImage("assets/Buttons/Button.png"))
                         ),
                          child: Stack(
                            children: [
                              Center(
                                child:Text("Get Started",
                                style: TextStyle(
                                  fontFamily: "AlegreyaSans",
                                  color: Colors.white,
                                  fontSize: play? width * .07:0
                                ),),
                              )
                            ]
                      )
                      ),
                    ),
                  ),
                ),

              ),


            ],
          ),
        ),
      )
    );
  }

  Future<void> decodedjson() async {
    // Decode the JSON
     String response = await rootBundle.loadString('assets/sounds.json');
     print('1111');
     var data = await json.decode(response);
     print('2222');
     welcome = Welcome.fromJson(data);

  }

}
