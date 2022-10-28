import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';

class player_controller extends GetxController {
  AudioPlayer player = AudioPlayer();
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool isplaying = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    player.setAsset("assets/Sounds/Calm/Calm Music.mp3");
    player.createPositionStream();
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.pause();
    player.dispose();
    super.dispose();
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

  Future<void> audiotoggele() async {
    if (isplaying) {
      await player.pause();
    } else {
      // await player.play();
    }
  }
}
