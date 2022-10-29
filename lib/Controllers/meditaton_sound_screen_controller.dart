import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MeditationSoundScreenController extends GetxController{
  AudioPlayer player = AudioPlayer();

  bool isplaying = false;

  var audioPath = Get.arguments[1];
  double timetoshow = 0.0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

    print("-- ----$audioPath");

    await player.setAsset(audioPath);
    player.positionStream.listen((event) {
      double duration = convertintdouble(seconds: player.duration!.inSeconds);
      double position = convertintdouble(seconds: player.position.inSeconds);

      timetoshow = (duration - position).toDouble();
      update();
    });
  }

  playpauseonTap() {
    if (!isplaying) {
      player.play();
      isplaying = true;
      update();
    } else {
      player.pause();
      isplaying = false;
      update();
    }
  }

  double convertintdouble({required int seconds}) {
    double inminutes = 0.0;
    for(int i=0;i<double.infinity;i++){
      if(seconds > 60){
        seconds = seconds-60;
        inminutes++;
      } else {
        print("second $seconds");
        inminutes = inminutes + (seconds/100);
        break;
      }
    }
    return inminutes;
  }


}