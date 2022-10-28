import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/My_Splash.dart';

void main(){
  runApp(
    Start()
  );
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: MySplash(),
    );
  }
}
