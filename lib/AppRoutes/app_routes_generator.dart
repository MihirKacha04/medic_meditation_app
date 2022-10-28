import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:medic_meditation_app/AppRoutes/app_routes.dart';
import 'package:medic_meditation_app/Screens/Sounds_Screen.dart';
import 'package:medic_meditation_app/Screens/home_screen.dart';
import 'package:medic_meditation_app/Screens/My_Splash.dart';

import '../Screens/Maditation_Screen.dart';
import '../Screens/Meditation_Sound_Screen.dart';
import '../Screens/audio_player_screen.dart';

class AppRoutesGenerator{

  static List<GetPage> route = [
     GetPage(
         name: AppRoutes.splashScreen,
         page: ()=> const MySplash(),
     ),
    GetPage(
        name: AppRoutes.homeScreen,
        page: ()=>  HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.soundsScreen,
      page: ()=>  SoundsScreen(),
    ),
    GetPage(
      name: AppRoutes.meditationScreen,
      page: ()=>  MeditationScreen(),
    ),
    GetPage(
      name: AppRoutes.meditationSoundScreen,
      page: ()=>  MaditationSoundScreen(),
    ),
    GetPage(
      name: AppRoutes.audioPlayerScreen,
      page: ()=>  AudioPlayerScreen(),
    )
  ];
}