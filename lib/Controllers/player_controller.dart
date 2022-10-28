import 'package:audioplayers/audioplayers.dart';
import 'package:get/state_manager.dart';

class player_controller extends GetxController{

  AudioPlayer player = AudioPlayer();
  AudioCache audioCache =  AudioCache();

  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool isplaying = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioCache  =   AudioCache();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    player.dispose();
    super.dispose();

  }

  Future<void> audiotoggele() async {
    if(isplaying){
      await player.pause();
    }
    else{
      // await player.play();
    }
  }

}