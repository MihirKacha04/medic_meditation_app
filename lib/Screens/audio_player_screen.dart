import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/Controllers/player_controller.dart';

import '../Utils/app_colors.dart';
import 'appbar_Scareen.dart';


class AudioPlayerScreen extends StatefulWidget {
  String AppbarTitel = Get.arguments[0];
  String image =  Get.arguments[1];
  String Soundtitle =  Get.arguments[2];
  String soundPath = Get.arguments[3];
  AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double appbar = kToolbarHeight;
    double bodyheight = hight-statusbar - appbar;
    player_controller _controller = Get.put(player_controller());
    return  Scaffold(
        backgroundColor: AppColor.themeColor,
        appBar: MyAppBar(widget.AppbarTitel),

        body: GetBuilder(
          init: _controller,
          builder: (controller){
            return Padding(
              padding:  EdgeInsets.only(top: bodyheight * .04,left: width * .04 ,right: width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircleAvatar(radius: bodyheight * .2,backgroundImage: AssetImage(widget.image),)),

                  Padding(
                    padding:  EdgeInsets.only(top: bodyheight * .05),
                    child: Text(widget.Soundtitle,
                      style: GoogleFonts.alegreyaSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: width * .08
                      ),
                    ),
                  ),

                  Slider(
                      thumbColor: Colors.green,
                      max: _controller.duration.inSeconds.toDouble(),
                      value: _controller.position.inSeconds.toDouble(),
                      onChanged: (double value) {   }
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${_controller.duration.inSeconds.toString()}"),
                      Text("${_controller.position.inSeconds.toString()}")
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CupertinoButton(
                        child: ImageIcon(AssetImage('assets/backword.png'),color: Colors.white),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        child:
                        _controller.isplaying
                            ?  Icon(CupertinoIcons.pause_circle_fill,color: Colors.white,size: bodyheight * .1)
                            :  Icon(CupertinoIcons.play_circle_fill,color:  Colors.white,size: bodyheight * .1,),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        child: ImageIcon(AssetImage('assets/forword.png'),color: Colors.white,),
                        onPressed: () {
                          _controller.audiotoggele();
                        },
                      ),
                    ],
                  ),

                  Center(
                    child: CupertinoButton(
                      child: Icon(Icons.loop,color: Colors.white,size: bodyheight * .05,),
                      onPressed: () {},
                    ),
                  )


                ],
              ),
            );
          },)


    );
  }
}










