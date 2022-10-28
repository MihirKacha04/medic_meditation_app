
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_meditation_app/Utils/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {


  MyAppBar(this.title);

  String title;

  @override
  Widget build(BuildContext context) {
    double appbar = kToolbarHeight;
    return  AppBar(
      backgroundColor: AppColor.themeColor,
      leading:    Padding(
        padding: EdgeInsets.all(appbar * .2),
        child: Image.asset("assets/Buttons/Logo (1).png",height: appbar * .8,),
      ),
      centerTitle: true,
      title: Text(title,
          style: GoogleFonts.alegreya(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              // fontSize: width * .06
          )),


      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}