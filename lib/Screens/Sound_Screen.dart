import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/Controllers/player_controller.dart';

import 'appbar_Scareen.dart';

class SoundScreen extends StatelessWidget {
  String AppbarTitel;
  String image;
  String Soundtitle;
  SoundScreen(this.AppbarTitel, this.image,this.Soundtitle);


  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double navigationbar = MediaQuery.of(context).padding.bottom;
    double appbar = kToolbarHeight;
    double bodyheight = hight-statusbar - appbar;
    player_controller _controller = Get.put(player_controller());
    return Scaffold(
      backgroundColor: Color(0xff253334),
      appBar: MyAppBar(AppbarTitel),

      body: GetBuilder(
        init: _controller,
        builder: (controller){
        return Padding(
          padding:  EdgeInsets.only(top: bodyheight * .04,left: width * .04 ,right: width * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: CircleAvatar(radius: bodyheight * .2,backgroundImage: AssetImage(image),)),

              Padding(
                padding:  EdgeInsets.only(top: bodyheight * .05),
                child: Text(Soundtitle,
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








